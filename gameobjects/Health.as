 package gameobjects
{
	
	// Sound Image Tween , nothing special
    import org.flixel.*;
	import com.greensock.TweenMax;
    public class Health extends FlxSprite
    {
  [Embed(source='../data/Images/ImgHealth.png')] private var ImgHealth:Class;
  [Embed(source='../data/Sound/SndStart.mp3')] protected var SndPowerup1:Class;

       // private var _player1:Player;
		//public var coins:FlxGroup;
    
		
       
	public function Health(X:Number,Y:Number):void
        {


    super(X, Y);
	
			loadGraphic(ImgHealth,true, true,33,72);
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
		this.scale.x = FlxG.ResolutionScaleX;
	this.scale.y = FlxG.ResolutionScaleY;	
	this.width = this.width * FlxG.ResolutionScaleX;
	this.height = this.height * FlxG.ResolutionScaleY;
	this.y = this.y * FlxG.ResolutionScaleY;
	this.x = this.x * FlxG.ResolutionScaleX;
TweenMax.to(this,3, { x:this.x, y:this.y-70,alpha:10, repeat:-1, yoyo:true} );
		
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

 