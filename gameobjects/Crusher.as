 package gameobjects
{
    import org.flixel.*;
		import com.greensock.*;
	import com.greensock.easing.*;
	
    public class Crusher extends FlxSprite
    {

        private var _player:Player;
        private var _move_speed:int = 40;
        private var _jump_power:int = 800;   
        private var _max_health:int = 10;
        private var _hurt_counter:Number = 0;
        private var _can_jump:Boolean = true;
        private var _last_jump:Number = 0;
		private var ImagesizeX:uint = 278;
		private var ImagesizeY:uint = 146;
		private var TmrSwitch:Number = 5;
		
		
		[Embed(source='../data/Sound/SndEnemy1death.mp3')] protected var SndDeath:Class;
		[Embed(source='../data/Images/ImgCrusher.png')] private var ImgEnemy:Class;

		
	//	private var Sound1:Enemy1Snd;
		
        public function Crusher(X:Number,Y:Number,Speed:uint,ReachX:uint,ReachY:uint):void
        {
			
			// Imagesize stuff
            super(X, Y);
	
			loadGraphic(ImgEnemy, true, true,ImagesizeX,ImagesizeY);
        //   _player = ThePlayer; // Noch rausmachen
             offset.x = 4;
			offset.y =  0;
			width = ImagesizeX-80;
			height = ImagesizeY-130;
		this.scale.x = FlxG.ResolutionScaleX;
	this.scale.y = FlxG.ResolutionScaleY;	
	this.width = this.width * FlxG.ResolutionScaleX;
	this.height = this.height * FlxG.ResolutionScaleY;
	this.y = this.y * FlxG.ResolutionScaleY;
	this.x = this.x * FlxG.ResolutionScaleX;
            health = 1; // See hurt function for GOD Mode
     

		// This is what makes it a Spike
		solid = true;
		moves = true;
		fixed = true;
		TweenMax.to(this,Speed, { x:this.x+ReachX, y:this.y-ReachY,alpha:10, repeat:-1, yoyo:true} );

		
        }
    
        override public function update():void
        {
				
		/* so war vorher
			if ( onScreen())
					{
						
				//	Sound1.play();
            
           
					if(TmrSwitch < 10)
						{
                
                velocity.y += -_move_speed * FlxG.elapsed*2;    
						        TmrSwitch = TmrSwitch + FlxG.elapsed*2;

						}
						
					if(TmrSwitch >10)
						{

                            //   velocity.y = -_jump_power;

                velocity.y += _move_speed * FlxG.elapsed*2;  
						        TmrSwitch = TmrSwitch + FlxG.elapsed*2;

				
						}
						
							if(TmrSwitch >20)
						{

                     
						        TmrSwitch = 0;

				
						}
  
        
        }
		*/
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
