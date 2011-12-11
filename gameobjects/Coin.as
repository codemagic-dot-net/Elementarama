 package gameobjects
{
	
	//Just a basic Coin Image with a tween
	
	
    import org.flixel.*;
	import com.greensock.*;
	import com.greensock.easing.*;
	
 	
    public class Coin extends FlxSprite
    {
    [Embed(source='../data/Images/ImgCoins.png')] private var ImgCoin:Class;

       // private var _player1:Player;
		//public var coins:FlxGroup;
    
				private var lastmove:uint=0;
		
        public function Coin(X:Number,Y:Number):void
        {

  super(X, Y);
	
   loadGraphic(ImgCoin, true, true, 36, 65);
   
  
	this.scale.x = FlxG.ResolutionScaleX;
	this.scale.y = FlxG.ResolutionScaleY;	
	this.width = this.width * FlxG.ResolutionScaleX;
	this.height = this.height * FlxG.ResolutionScaleY;
	this.y = this.y * FlxG.ResolutionScaleY;
	this.x = this.x * FlxG.ResolutionScaleX;

		//	coins.add();
//Versuch den move durch enemy bug zu beheben		
solid = true; // if this is set to true enemy will get stuck and bullets bug but collide() don't woek anyomore to collect

//moves = false;
//drag.x = 0;
//drag.y = 0;
//maxVelocity.x = 0;
//maxVelocity.y = 0;
fixed = true;
//Versuch ende

TweenMax.to(this,5, { x:this.x, y:this.y-50,alpha:10, repeat:-1, yoyo:true} );
  
	acceleration.y = 0;
          

	}
	
	 override public function update():void
        {
			
			     super.update();
			

					
			}

	
	
		
        }
    
 

        
}

 