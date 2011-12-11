 package gameobjects
{
    import org.flixel.*;
	
	
    public class FlyingObject extends FlxSprite
    {
     [Embed(source='../data/Images/ImgElement1.png')] private var ImgEnemy:Class;

        private var _player:Player;
        private var _move_speed:int = 40;
        private var _jump_power:int = 800;   
        private var _max_health:int = 10;
        private var _hurt_counter:Number = 0;
        private var _can_jump:Boolean = true;
        private var _last_jump:Number = 0;
		private var ImagesizeX:uint = 60;
		private var ImagesizeY:uint = 70;
		
		private var TmrSwitch:Number = 5;
		
		
		[Embed(source='../data/Sound/SndEnemy1death.mp3')] protected var SndDeath:Class;
		
		
		//private var Sound1:Enemy1Snd;
		
        public function FlyingObject(X:Number,Y:Number,ThePlayer:Player):void
        {
			
			// Imagesize stuff
            super(X, Y-50);
	
			loadGraphic(ImgEnemy, true, true,ImagesizeX,ImagesizeY);
            _player = ThePlayer; // Noch rausmachen
             offset.x = 4;
			offset.y =  0;
			width = ImagesizeX;
			height = ImagesizeY;
			
            health = 1; // See hurt function for GOD Mode
     

		// This is what makes it a Spike
		solid = true;
		moves = true;
		fixed = false;
		this.scale.x = FlxG.ResolutionScaleX;
	this.scale.y = FlxG.ResolutionScaleY;	
	this.width = this.width * FlxG.ResolutionScaleX;
	this.height = this.height * FlxG.ResolutionScaleY;
	this.y = this.y * FlxG.ResolutionScaleY;
	this.x = this.x * FlxG.ResolutionScaleX;
		
        }
    
        override public function update():void
        {
				
		
			if ( onScreen())
					{
						
				//	Sound1.play();
            
           
					if(TmrSwitch < 10)
						{
                
                velocity.y += -_move_speed * FlxG.elapsed;    
						        TmrSwitch = TmrSwitch + FlxG.elapsed*4;

						}
						
					if(TmrSwitch >10)
						{

                            //   velocity.y = -_jump_power;

                velocity.y += _move_speed * FlxG.elapsed;  
						        TmrSwitch = TmrSwitch + FlxG.elapsed*4;

				
						}
						
							if(TmrSwitch >20)
						{

                     
						        TmrSwitch = 0;

				
						}
  
        
        }
		
		    super.update();
		
		                        }
        
        override public function hurt(Damage:Number):void
        {
            _hurt_counter = 0; // GOD MODE ;)
			 Damage = 0; // GO D MODE ;)
            super.hurt(Damage);
			
        }       
		
		
	
		}
    }
