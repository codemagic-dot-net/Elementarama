package scenes
{
	import flash.events.TimerEvent;
    import org.flixel.*;
	import flash.utils.Timer;
	import com.greensock.*;
import com.greensock.easing.*;
	
    public class Logo extends FlxState
    {
		[Embed(source='../data/Sound/SndStart.mp3')]
  protected var SndStart:Class;

		 private var _bloom:uint = 8; //How much light bloom to have - larger numbers = more
private var _fx:FlxSprite; //Our helper sprite - basically a mini screen buffer (see below)
[Embed(source='../data/Images/Imgflag-101.png')] private var  ImgFlag101:Class;
[Embed(source='../data/Images/Imgflag-102.png')] private var  ImgFlag102:Class;
[Embed(source='../data/Images/Imgflag-103.png')]private var   ImgFlag103:Class;
[Embed(source = '../data/Images/Imgflag-104.png')] private var  ImgFlag104:Class;
private var abort:Boolean;
private var decoration3:FlxSprite;
//private var time:uint = 0;
private var timer:Timer = new Timer(30000, 1);

//[Embed(source='../assets/ammibeat_7.mp3')] private var Intro:Class;
		[Embed(source ='../data/Sound/main.mp3')] private var Intro:Class;
        override public function Logo():void
	{
		
		
		
		
	
		bgColor = 0xff464646;

		
		FlxG.playMusic(Intro, 0.8);


		
		
        }
        override public function update():void
        {
			
               
			
						
						
			//	time += 0.1*FlxG.elapsed;
          // 	FlxG.fade.start(0xff000000, 30, onFade);
			
				//
			     //if (time >= 10 && time <= 15)
	
		
			
            //    FlxG.fade.start(0xff464646, 1, onFade);
		/*
					time = time+1+10*FlxG.elapsed;
                //FlxG.flash.start(0xffffffff, 5);
          
				
		  if (time >= 5)
				decoration3.angularAcceleration   = 0;
				*/
           			FlxG.fade.start(0xff000000, 30, onFade);
				     if (FlxG.keys.pressed("SPACE"))
            {            FlxG.state = new Moor;
				abort = true;
				      }	
			
	
			
			
            super.update();
        }
        private function onFade():void
		{
			
			FlxG.state = new Moor();
			FlxG.flash.start(0xff464646, 3);
        }
		
		
		
		
		 override public function create():void
{
			bgColor = 0xff464646;
//Title text, nothing crazy here!

//var title:FlxText = new FlxText(0,FlxG.height/2-20,FlxG.width,"Killer Ninja");
/*var title:FlxText = new FlxText(10, 150, FlxG.width, "Marcel Soft");
title.size = 32;
title.alignment = "center";
add(title);
*/
//TweenMax.to(title, 1, { x:15, y:100, alpha:1.7,delay:0,repeat:-1,yoyo:true});
	
	var decoration:FlxSprite = new FlxSprite(170, -800, ImgFlag101);
		add(decoration);
		TweenMax.to(decoration, 2, { x:170, y:450, ease:Sine.easeIn, alpha:10 ,delay:2} );
		
		
		//PRODUCTIONS
		decoration = new FlxSprite(1024/2,-800,ImgFlag102);
		add(decoration);
		TweenMax.to(decoration, 4, { x:900, y:700, ease:Sine.easeIn, delay:6, alpha:10 } );
		
		// DAS I
		decoration3= new FlxSprite(1024/2,-800,ImgFlag103);
		add(decoration3);
		TweenMax.to(decoration3, 5, { x:1024/2+75, y:8000, ease:Sine.easeIn,delay:3, alpha:10 } );
		decoration3.angularAcceleration   = 400;
		
		
		decoration= new FlxSprite(1024/2+75,800,ImgFlag103);
		add(decoration);
		TweenMax.to(decoration, 2, { x:1024/2+75, y:450, ease:Sine.easeIn,delay:5, alpha:10 } );

		
		
		//bullet
		decoration= new FlxSprite(-800,400,ImgFlag104);
		add(decoration);
		TweenMax.to(decoration, 1, { x:0, y:400,ease:Sine.easeIn, alpha:10} );

//This is the sprite we're going to use to help with the light bloom effect
//First, we're going to initialize it to be a fraction of the screens size
_fx = new FlxSprite();
_fx.createGraphic(FlxG.width / _bloom, FlxG.height / _bloom, 0, true);
_fx.origin.x = _fx.origin.y = 0; //Zero the origin so scaling goes from top-left not center
_fx.scale.x = _fx.scale.y = _bloom; //Scale it up to be the same size as the screen again
_fx.antialiasing = true; //Set AA to true for maximum blurry
_fx.color = 0x464646; //Tint it a little, cuz that looks cool
//_fx.color = 0xafffff; //Tint it a little, cuz that looks cool
_fx.blend = "screen"; //Finally, set blend mode to "screen" (important!)
//Note that we do not add it to the game state! It's just a helper, not a real sprite.

//Then we scale the screen buffer down, so it draws a smaller version of itself
// into our tiny FX buffer, which is then scaled up. The net result of this operation
// is a blurry image that we can render back over the screen buffer to create the bloom.
screen.scale.x = screen.scale.y = 1 / _bloom;


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