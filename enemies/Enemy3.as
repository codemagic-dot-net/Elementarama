 package enemies
{
    import org.flixel.*;
    public class Runner extends FlxSprite
    {
[Embed(source='data/Images/ImgRunner.png')] private var ImgRunner:Class;
        private var _player:Player;
        private var _move_speed:int = 400;
        private var _jump_power:int = 800;   
        private var _max_health:int = 10;
        private var _hurt_counter:Number = 0;
        private var _can_jump:Boolean = true;
        private var _last_jump:Number = 0;
		
		
        public function Runner(X:Number,Y:Number,ThePlayer:Player):void
        {
            super(X, Y);
	    	loadGraphic(ImgEnemy, true, true, 72, 90);
            _player = ThePlayer;
            maxVelocity.x = 200;
            maxVelocity.y = 200;
            health = 1;
            acceleration.y = 420;
            drag.x = 300;
         //   width = 8;
       //     height = 14;
			       width = 80;
            height = 45;
            offset.x = 4;
            offset.y = 2;
            addAnimation("normal", [0, 1, 2, 3], 10);
            addAnimation("jump", [2]);
            addAnimation("attack", [4,5,6],10);
            addAnimation("stopped", [0]);
            addAnimation("hurt", [2,7],10);
            addAnimation("dead", [7, 7, 7], 5);
        }
    
        override public function update():void
        {
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
          
                facing = LEFT;
                velocity.x -= _move_speed * FlxG.elapsed;
          
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
            super.update();
        }

        override public function hitBottom(Contact:FlxObject, Velocity:Number):void
       {
     _can_jump = true;
    super.hitBottom(Contact, Velocity);
       }
        
        override public function hurt(Damage:Number):void
        {
            _hurt_counter = 1;
            super.hurt(Damage);
        }       
    }
} 