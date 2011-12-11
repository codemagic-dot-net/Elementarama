 package gameobjects
{
    import org.flixel.*;
    public class JumpPad extends FlxSprite
    {
      [Embed(source='../data/Images/ImgJumpPad.png')] private var ImgEnemy:Class;

       // private var _player:Player;
       //  private var _move_speed:int = 400;
      //  private var _jump_power:int = 800;   
    //  //  private var _max_health:int = 10;
        private var _hurt_counter:Number = 0;
   //   //  private var _can_jump:Boolean = true;
       // private var _last_jump:Number = 0;
		private var ImagesizeX:uint = 65;
		private var ImagesizeY:uint = 65;
	  //  private var getJumpPad:Boolean = false;
		
	
		//[Embed(source='data/Sound/SndEnemy1death.mp3')] protected var SndDeath:Class;
	//	private var Sound1:Enemy1Snd;
		
        public function JumpPad(X:Number,Y:Number,ThePlayer:Player):void
        {
			
			// Imagesize stuff
            
			//Customize here
			super(X, Y);
	        offset.x = 4;
			offset.y = 0;
			
			
			addAnimation("normal",     [0,1,2,3,4,5,6] ,15, true);
			addAnimation("dead",  [0,1,2,3,4,5,6]  ,15, true); // jumped on once
			loadGraphic(ImgEnemy, true, true,ImagesizeX,ImagesizeY);
            //_player = ThePlayer; // Noch rausmachen oder drin lassen und get funktion mit rein

			width = ImagesizeX;
			height = ImagesizeY+offset.y;
			
   //  play("normal");

		// Set Collision
		solid = true;
		moves = false;
		fixed = true;
		play("normal");
		//            health = 1; // See hurt function for GOD Mode
		this.scale.x = FlxG.ResolutionScaleX;
	this.scale.y = FlxG.ResolutionScaleY;	
	this.width = this.width * FlxG.ResolutionScaleX;
	this.height = this.height * FlxG.ResolutionScaleY;
	this.y = this.y * FlxG.ResolutionScaleY;
	this.x = this.x * FlxG.ResolutionScaleX;
        }
    

        
        override public function hurt(Damage:Number):void
        {
     this.play("dead");

			
        }       
		
		
	
		}
    }
