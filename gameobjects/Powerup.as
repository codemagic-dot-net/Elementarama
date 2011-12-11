 package gameobjects
{
    import org.flixel.*;
		import com.greensock.*;
import com.greensock.easing.*;
	
    public class Powerup extends FlxSprite
    {
    [Embed(source='../data/Images/ImgPowerup.png')] private var ImgPowerup:Class;

       // private var _player1:Player;
		//public var coins:FlxGroup;
    
	[Embed(source='../data/Sound/SndPowerup1.mp3')] private var SndPowerup1:Class;
		
        public function Powerup(X:Number,Y:Number):void
        {


    super(X, Y);
	
			//loadGraphic(ImgPowerup, false);
		//	coins.add();
		
					loadGraphic(ImgPowerup,true, true, 33, 72);
		//	coins.add();
		
//Versuch den mopve durch enemy bug zu beheben		
solid = true;
moves = false;
drag.x = 0;
drag.y = 0;
maxVelocity.x = 0;
maxVelocity.y = 0;
fixed = true;
//Versuch ende
         //   addAnimation("normal", [0, 1, 2, 3,4,5,6,7,8,9,10,11,12], 15);

		this.scale.x = FlxG.ResolutionScaleX;
	this.scale.y = FlxG.ResolutionScaleY;	
	this.width = this.width * FlxG.ResolutionScaleX;
	this.height = this.height * FlxG.ResolutionScaleY;
	this.y = this.y * FlxG.ResolutionScaleY;
	this.x = this.x * FlxG.ResolutionScaleX;

TweenMax.to(this,5, { x:this.x, y:this.y-50,alpha:10, repeat:-1, yoyo:true} );
 
		
	}
	
	 override public function update():void
        {
		//	play("normal");
			     super.update();
			}

		
			
	 override public function kill():void
        {
		FlxG.play(SndPowerup1);
		FlxG.play(SndPowerup1);
		FlxG.play(SndPowerup1);
		super.kill();
			}

	
	

	
	
		
        }
    
 

        
}

 