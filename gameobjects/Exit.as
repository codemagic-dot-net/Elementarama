 package  gameobjects
{
    import org.flixel.*;
	
    public class Exit extends FlxSprite
    {
		
    [Embed(source='../data/Images/ImgExit.png')] private var ImgExit:Class;

      
	 public function Exit(X:Number,Y:Number):void
        {


			super(X, Y);
	
			loadGraphic(ImgExit, false);
		
		//Collision Settings
		
		solid = true;
		moves = false;
		drag.x = 0;
		drag.y = 0;
		maxVelocity.x = 0;
		maxVelocity.y = 0;
		fixed = true;
			this.scale.x = FlxG.ResolutionScaleX;
	this.scale.y = FlxG.ResolutionScaleY;	
	this.width = this.width * FlxG.ResolutionScaleX;
	this.height = this.height * FlxG.ResolutionScaleY;
	this.y = this.y * FlxG.ResolutionScaleY;
	this.x = this.x * FlxG.ResolutionScaleX;		}
	
	

	
	
		
        }
    
 

        
}

 