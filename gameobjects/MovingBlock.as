 package gameobjects
{
    import org.flixel.*;
//	import com.greensock.*;
//	import com.greensock.easing.*;
	
    public class MovingBlock extends FlxSprite
    {
     [Embed(source='../data/Images/ImgMovingBlock1.png')] private var ImgEnemy:Class;

    //    private var _player:Player;
        private var _move_speed:uint = 20;
        private var _jump_power:int = 800;   
        private var _accellX:uint;// = 20;
        private var _hurt_counter:Number = 0;
     //   private var _can_jump:Boolean = true;
      //  private var _last_jump:Number = 0;
		private var ImagesizeX:uint = 278;
		private var ImagesizeY:uint = 146;
		//private var TmrSwitch:Number = 0;
		private var maxSpeed:uint = 50;
		
		[Embed(source='../data/Sound/SndEnemy1death.mp3')] protected var SndDeath:Class;
		
		
	//	private var Sound1:Enemy1Snd;
		
        public function MovingBlock(X:Number,Y:Number,AccellX:uint,maxSpeed:uint):void
        {
			
			// Imagesize stuff
            super(X, Y-50);
	
			loadGraphic(ImgEnemy, true, true,ImagesizeX,ImagesizeY);
          //  _player = ThePlayer; // Noch rausmachen
             offset.x = 4;
			offset.y =  0;
			width = ImagesizeX;
			height = ImagesizeY;
			
            health = 1; // See hurt function for GOD Mode
     
velocity.x = 0;
		// This is what makes it a Spike
		solid = true;
		moves = true;
		fixed = true;
//TweenMax.to(this, 3, { x:this.x-7*FlxG.tilesize, y:this.y, alpha:1.7,delay:0,repeat:-1,yoyo:true});
	
		
		_accellX = AccellX;
		
		
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
		
					}
		//Zwischen -50 und 51
		if (velocity.x <= maxSpeed+1 && velocity.x >= -maxSpeed) {
			
			velocity.x -= FlxG.elapsed * _accellX;
			
			}
			
		if (velocity.x <= -maxSpeed) {
			
			velocity.x =maxSpeed;
			
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
