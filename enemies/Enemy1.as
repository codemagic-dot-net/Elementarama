 package enemies
{
    import org.flixel.*;
	import com.greensock.TweenMax;
		
    public class Enemy1 extends FlxSprite
    {
      [Embed(source='../data/Images/ImgEnemy1.png')] private var ImgEnemy:Class;

        private var _player:Player;
        private var _move_speed:int = 400;
        private var _jump_power:int = 800;   
        private var _max_health:int = 10;
        private var _hurt_counter:Number = 0;
        private var _can_jump:Boolean = true;
        private var _last_jump:Number = 0;
		private var ImagesizeX:uint = 616/14;
		private var ImagesizeY:uint = 117;
		[Embed(source='../data/Sound/SndEnemy1death.mp3')] protected var SndDeath:Class;
		private var Sound1:Enemy1Snd;
		
        public function Enemy1(X:Number,Y:Number,ThePlayer:Player):void
        {
            super(X, Y);
	
			loadGraphic(ImgEnemy, true, true,ImagesizeX,ImagesizeY);
            _player = ThePlayer;
            maxVelocity.x = 100;
            maxVelocity.y = 200;
            health = 1;
            acceleration.y = 420;
            drag.x = 300;
       width = ImagesizeX;
       height = ImagesizeY+offset.y;
	Sound1 = new Enemy1Snd;
            offset.x = 4;
            offset.y = -40;
            addAnimation("normal", [0, 1, 2,3], 10);
            addAnimation("jump", [2]);
			addAnimation("attack", [3,2,3],10);
            addAnimation("stopped", [0]);
            addAnimation("hurt", [4],10);
			addAnimation("dead", [0, 7,8,9,10,11,12,13,14], 6,false);
	
		 
          //  addAnimation("attack", [4,5,6],10);
         //   addAnimation("stopped", [0]);
         //   addAnimation("hurt", [2,7],10);
         //   addAnimation("dead", [7, 7, 7], 5);
        }
    
        override public function update():void
        {
				
		
			if ( onScreen()){
		Sound1.play();
            if(dead)
            {
				play("dead");
                if(finished) exists = false;
                else
                    super.update();
                return;
            }
            if (_hurt_counter > 0)
            {
                _hurt_counter -= FlxG.elapsed*3;
            }
            if (_last_jump > 0)
            {
                _last_jump -= FlxG.elapsed;
            }
            if (velocity.y != 0 || _last_jump > 0)
            {
                _can_jump = false;
            }
            if(_player.x < x)
            {
                facing = LEFT;
                velocity.x -= _move_speed * FlxG.elapsed;
            }
            else
            {
                facing = RIGHT;
                velocity.x += _move_speed * FlxG.elapsed;                
            }
            if(_player.y < y && _can_jump)
            {
                velocity.y = -_jump_power;
                _last_jump = 2;
                _can_jump = false;
            }
            if (_hurt_counter > 0)
            {
                play("hurt");
            }
            else            
            {
                if (velocity.y != 0)
                {
                    play("jump");
					
                }
                else
                {
                    if (velocity.x == 0)
                    {
                        play("stopped");
                    }
                    else
                    {
                       play("normal");
                    }
                }
				
			
            }
			}
            super.update();
        }

        override public function hitBottom(Contact:FlxObject, Velocity:Number):void
       {
     _can_jump = true;

    super.hitBottom(Contact, Velocity);
       }
        
        override public function hurt(Damage:Number):void
        {
            _hurt_counter = 3;
            super.hurt(Damage);
				FlxG.play(SndDeath);
				//this._color = 0x00ff00
				//this.color = 0x00ff00
			
				TweenMax.to(this,3, { x:this.x, y:this.y-10,alpha:10, repeat:-1, yoyo:true} );

        }       
		
		
				override public function kill():void
		{
			dead = true;
			play ("dead");
			if (finished) {
				//trace("finished");
				exists = false;
			}
		}
    }
} 