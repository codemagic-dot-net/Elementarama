 package gameobjects
{
    import org.flixel.*;
//	import com.greensock.*;
//	import com.greensock.easing.*;
	
    public class Portal extends FlxSprite
    {
     [Embed(source='../data/Images/fire.png')] private var ImgEnemy:Class;

        private var _player:Player;
        private var _move_speed:int = 40;
      //  private var _jump_power:int = 800;   
    //    private var _max_health:int = 10;
     //   private var _hurt_counter:Number = 0;
      //  private var _can_jump:Boolean = true;
      //  private var _last_jump:Number = 0;
		private var ImagesizeX:uint = 60;
		private var ImagesizeY:uint = 70;
		//private var TmrSwitch:Number = 0;
		public var thisportX:Number;
		public var thisportY:Number;
		public var doport:Boolean = false; // Kann raus da in getPortal
		public var stay:Boolean = false; //(Playstate) kill Portal in getPortal function?
		
        public function Portal(X:Number,Y:Number,PorttoX:Number,PorttoY:Number,ThePlayer:Player):void
        {
			
			// Imagesize stuff
            super(X, Y);
	
			loadGraphic(ImgEnemy, true, true,ImagesizeX,ImagesizeY);
            _player = ThePlayer; // Noch rausmachen
             offset.x = 4;
			offset.y =  0;
			width = ImagesizeX;
			height = ImagesizeY;
			
            health = 1; // See hurt function for GOD Mode
     
		velocity.x = 0;
	
		solid = true;
		//moves = true;
		fixed = true;
	thisportX = PorttoX;
	thisportY = PorttoY;

		this.scale.x = FlxG.ResolutionScaleX;
	this.scale.y = FlxG.ResolutionScaleY;	
	this.width = this.width * FlxG.ResolutionScaleX;
	this.height = this.height * FlxG.ResolutionScaleY;
	this.y = this.y * FlxG.ResolutionScaleY;
	this.x = this.x * FlxG.ResolutionScaleX;
		
        }
    
        override public function update():void
        {
				
		
	//if(doport){	_player.x = thisportX;
//		_player.y = thisportY;}
			
			
			
		    super.update();
		
		                        }
        
        override public function hurt(Damage:Number):void
        {
           // _hurt_counter = 0; // GOD MODE ;)
			 Damage = 0; // GO D MODE ;)
            super.hurt(Damage);
			
        }       
		
		
	
		}
    }
