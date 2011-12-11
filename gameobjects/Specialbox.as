 package gameobjects
{
    import org.flixel.*;
    public class Specialbox extends FlxSprite
    {
  [Embed(source='../data/Images/ImgSpecialbox.png')] private var ImgSpecialbox:Class;

       // private var _player1:Player;
		//public var coins:FlxGroup;
    
			protected var _EmrCoins:FlxEmitter;
		
        public function Specialbox(X:Number,Y:Number,EmrCoins:FlxEmitter):void
        {


    super(X, Y);
	
			loadGraphic(ImgSpecialbox,true, true);
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
            addAnimation("normal", [0, 1, 2, 3,4,5,6,7,8,9,10], 10);

		_EmrCoins = EmrCoins;
				this.scale.x = FlxG.ResolutionScaleX;
	this.scale.y = FlxG.ResolutionScaleY;	
	this.width = this.width * FlxG.ResolutionScaleX;
	this.height = this.height * FlxG.ResolutionScaleY;
	this.y = this.y * FlxG.ResolutionScaleY;
	this.x = this.x * FlxG.ResolutionScaleX;
		
	}
	
	 override public function update():void
        {
			play("normal");
			     super.update();
			}

	
	
		
        
    
 
		override public function kill():void
		{
			if(dead)
				return;
	
			super.kill();
			flicker( -1);
			_EmrCoins.at(this);
			_EmrCoins.start(true, 0, 50);
			
			FlxG.score += 200;
		}
		
	}
}

 