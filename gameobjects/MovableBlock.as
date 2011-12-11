 package  gameobjects
{
    import org.flixel.*;
    public class MovableBlock extends FlxSprite
    {
  [Embed(source='../data/Images/ImgMovableBlock.png')] private var ImgMovableBlock:Class;


        public function MovableBlock(X:Number,Y:Number):void
        {


			super(X, Y);
	
			loadGraphic(ImgMovableBlock,false,true,290,64);
	
			// Collision Settings , set dragy and maxvelocityy = 0 fo r nice bounce effect when 
			solid = true;
			moves = true;
			drag.x = 100;
			drag.y = 0;
			maxVelocity.x = 100;
			maxVelocity.y = 0;
			fixed = false;
			offset.x = 20;
			offset.y = -80;
			
			
		this.scale.x = FlxG.ResolutionScaleX;
	this.scale.y = FlxG.ResolutionScaleY;	
	this.width = this.width * FlxG.ResolutionScaleX;
	this.height = this.height * FlxG.ResolutionScaleY;
	this.y = this.y * FlxG.ResolutionScaleY;
	this.x = this.x * FlxG.ResolutionScaleX;
		
	}
	
	 override public function update():void
        {
		
			     super.update(); //needs to be done(dunno y?)
			}

	
	
		
        
    
 

		
	}
}

 