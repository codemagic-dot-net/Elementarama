 package gameobjects
{
    import org.flixel.*;
    public class Key extends FlxSprite
    {
    [Embed(source='../data/Images/ImgKey.png')] private var ImgKey:Class;

       // private var _player1:Player;
		//public var coins:FlxGroup;
    
		
		
        public function Key(X:Number,Y:Number):void
        {


    super(X, Y);
	
			loadGraphic(ImgKey, false);
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
	}
	
	

	
	
		
        }
    
 

        
}

 