 package enemies
{
    import org.flixel.*;
	
		
	import layers.*;
	import scenes.*;
	
    public class Boss1 extends FlxSprite
    {
      [Embed(source='../data/Images/ImgBoss1.png')] private var ImgEnemy:Class;

        private var _player:Player;
        private var _move_speed:int = 400;
        private var _jump_power:int = 800;   
        private var _max_health:int = 10;
        private var _hurt_counter:Number = 0;
        private var _can_jump:Boolean = true;
        private var _last_jump:Number = 0;
		private var imagesizeX:uint = 280;
		private var imagesizeY:uint = 700;

		[Embed(source='../data/Sound/SndEnemy1death.mp3')] protected var SndDeath:Class;
		private var Sound1:Enemy1Snd;
		
        public function Boss1(X:Number,Y:Number,ThePlayer:Player):void
        {
            super(X, Y);
	
			loadGraphic(ImgEnemy, true, true,imagesizeX,imagesizeY);
            _player = ThePlayer;
            maxVelocity.x = 100;
            maxVelocity.y = 1;
            health = 100;
            acceleration.y = 50;
			solid = true;
			_solid =  true;
			
            drag.x = 300;
       width = imagesizeX-5;
       height = imagesizeY-5;
	Sound1 = new Enemy1Snd;
            offset.x = 4;
            offset.y = -40*5;
            addAnimation("normal", [7,8,9,10,11,12], 10);
            addAnimation("jump", [9]);
			  addAnimation("attack", [8,9],10);
           addAnimation("stopped", [0]);
            addAnimation("hurt", [12],10);
       addAnimation("dead", [0, 1, 2,3,4,5,6], 3);
	
		 
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
        }       
		
			override public function kill():void
		{	FlxG.state = new WinState;
			super.kill();
	
			}
		
		
		
		
		
		
    }
} 