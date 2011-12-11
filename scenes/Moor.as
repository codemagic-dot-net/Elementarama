package scenes
{
    import org.flixel.*;
	import com.greensock.*;
import com.greensock.easing.*;
		import flash.events.TimerEvent;
			import flash.utils.Timer;
    public class Moor extends FlxState
    {

		
		
		/*die rotation mit dem nach-oben-fliegen ist das hier:

TweenMax.to(title, 2, {x:title.x + 40, y:title.y - 224, ease:Quad.easeInOut, angle:360, onComplete:tweenBack});

"title" ist der name des Objekts, welches bewegt wird (die Titelschrift).
angle dreht das object.

*/
	[Embed(source='../data/Images/ImgMoor101.png')] private var ImgMoor101:Class;
	[Embed(source='../data/Images/ImgMoor102.png')] private var ImgMoor102:Class;
		 private var _bloom:uint = 8; //How much light bloom to have - larger numbers = more
private var _fx:FlxSprite; //Our helper sprite - basically a mini screen buffer (see below)
[Embed(source='../data/Sound/SndLogo.mp3')] protected var SndMoor:Class;
private var decoration2:FlxSprite;
//private var time:uint = 0;
private var turn:uint;

private var timer:Timer = new Timer(1000,5000);


        override public function Moor():void
	{
		
		
		
		
		//
		
		
		


		 
		
        }
        override public function update():void
        {
			// Mit bis 150 und 300 gehts sind dann aber 1.5 Umdrehungen time += 50*FlxG.elapsed;
                //FlxG.flash.start(0xffffffff, 5);
                if (turn == 1)
				{//decoration2.angle = 358;
				decoration2.angularAcceleration = 10;}
		  if (turn == 2){
				decoration2.angularAcceleration = -10;
				//		decoration2.angle = 02;
				// if (time >= 300)
				//time= 0;}
				
				
				
				/*
				
				time += 0.1*FlxG.elapsed;
                //FlxG.flash.start(0xffffffff, 5);
                if (time >= 0 && time <= 15)
	
						decoration2.angularAcceleration = 100;
		  if (time > 30)
				decoration2.angularAcceleration = -100;
					
				 if (time >= 45)
				time= 0;
				
				
				*/
		  }
		
				FlxG.fade.start(0xff000000, 30, onFade);
			
				
				
				
				
			     if (FlxG.keys.pressed("SPACE"))
            {            FlxG.state = new presents;
				timer.removeEventListener(TimerEvent.TIMER_COMPLETE,FuncTimer);
			
				      }	
           
			
			
	
			
			
            super.update();
        }
		
		
        private function onFade():void
        {
				
			FlxG.state = new presents();
			    FlxG.flash.start(0xff464646, 5);
	
			
             
        }
		
		
		     private function  FuncTimer(evt:TimerEvent):void
		{
if(turn == 1)	{ turn = 2;; }
if (turn == 2){ turn = 1;}
        }
		
		 override public function create():void
{FlxG.play(SndMoor, 1);
	bgColor = 0xff464646;
timer.addEventListener(TimerEvent.TIMER_COMPLETE, FuncTimer);
		timer.start();


//Title text, nothing crazy here!
	var decoration:FlxSprite = new FlxSprite(200,-500,ImgMoor101);

		
		add(decoration);
		TweenMax.to(decoration, 2, { x:200, y:0,ease:Sine.easeIn, alpha:10} );

		
		decoration2 = new FlxSprite(450,-500,ImgMoor102);
		add(decoration2);
			decoration2.maxAngular = 120;
			decoration2.angularDrag = 400;
		
			
			//decoration2.angle = 270;
		
		TweenMax.to(decoration2, 3, { x:450, y:768/2, ease:Sine.easeIn, delay:1, alpha:10 } );	
		TweenMax.to(decoration2, 1, { x:450, y:768/2+10, ease:Sine.easeIn, delay:4, alpha:10,repeat:-1,yoyo:true } );	
		
//var title:FlxText = new FlxText(0,FlxG.height/2-20,FlxG.width,"Killer Ninja");
//var title:FlxText = new FlxText(10, 150, FlxG.width, "presents");
//title.size = 32;
//title.alignment = "center";
//add(title);
//TweenMax.to(title, 1, { x:15, y:100, alpha:1.7,delay:0,repeat:-1,yoyo:true});


//This is the sprite we're going to use to help with the light bloom effect
//First, we're going to initialize it to be a fraction of the screens size
_fx = new FlxSprite();
_fx.createGraphic(FlxG.width / _bloom, FlxG.height / _bloom, 0, true);
_fx.origin.x = _fx.origin.y = 0; //Zero the origin so scaling goes from top-left not center
_fx.scale.x = _fx.scale.y = _bloom; //Scale it up to be the same size as the screen again
_fx.antialiasing = true; //Set AA to true for maximum blurry
_fx.color = 0xafffff; //Tint it a little, cuz that looks cool
_fx.color = 0x464646; //Tint it a little, cuz that looks cool
_fx.blend = "screen"; //Finally, set blend mode to "screen" (important!)
//Note that we do not add it to the game state! It's just a helper, not a real sprite.

//Then we scale the screen buffer down, so it draws a smaller version of itself
// into our tiny FX buffer, which is then scaled up. The net result of this operation
// is a blurry image that we can render back over the screen buffer to create the bloom.
screen.scale.x = screen.scale.y = 1/_bloom;

//This is the particle emitter that spews things off the bottom of the screen.
//I'm not going to go over it in too much detail here, but basically we
// create the emitter, then we create 50 16x16 sprites and add them to it.


}
		
		
		 //This is the new hotness! This is essentially a callback from the game rendering loop,
// letting us know that all the game rendering has finished,
// and that FlxState.screen has been filled with the game's visual contents.
override public function postProcess():void
{
//The actual blur process is quite simple now.
//First we draw the contents of the screen onto the tiny FX buffer:
_fx.draw(screen);
//Then we draw the scaled-up contents of the FX buffer back onto the screen:
screen.draw(_fx);
}
		
    }
}