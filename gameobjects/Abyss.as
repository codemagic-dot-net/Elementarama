 package gameobjects
{
	
	
	
    import org.flixel.*;
    public class Abyss extends FlxSprite
    {
      [Embed(source='../data/Images/ImgAbyss.png')] private var ImgAbyss:Class;

        private var _player:Player;
     //   private var _move_speed:int = 400;
     //   private var _jump_power:int = 800;   
     //   private var _max_health:int = 10;
     //   private var _hurt_counter:Number = 0;
     //   private var _can_jump:Boolean = true;
     //   private var _last_jump:Number = 0;
		private var ImagesizeX:uint = 278;
		private var ImagesizeY:uint = 175;
	//	[Embed(source='../data/Sound/SndEnemy1death.mp3')] protected var SndDeath:Class;
	//	private var Sound1:Enemy1Snd;
		
        public function Abyss(X:Number,Y:Number):void
        {
			
			// Imagesize stuff
            super(X, Y-50);
	
			loadGraphic(ImgAbyss, true, true,ImagesizeX,ImagesizeY);
             offset.x = 4;
			offset.y = -70;
			width = ImagesizeX;
		//	height = ImagesizeY+offset.y;
		height = 10;	
		
		this.scale.x = FlxG.ResolutionScaleX;
	this.scale.y = FlxG.ResolutionScaleY;	
	this.width = this.width * FlxG.ResolutionScaleX;
	this.height = this.height * FlxG.ResolutionScaleY;
	this.y = this.y * FlxG.ResolutionScaleY;
	this.x = this.x * FlxG.ResolutionScaleX;
	
		// This and the Enemies Grp  make it a Spike
		solid = true;
		moves = false;
		fixed = true;
		
		
        }
    

        
        override public function hurt(Damage:Number):void
        {
         
			
        }       
		
		
	
		}
    }
