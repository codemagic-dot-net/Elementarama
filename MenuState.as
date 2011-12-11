package 
{
    import org.flixel.*;
	import com.greensock.*;
import com.greensock.easing.*;
import scenes.*;

	
    public class MenuState extends FlxState
    {[Embed(source='data/Sound/SndStart.mp3')]
  protected var SndStart:Class;
//	[Embed(source = 'data/Images/ImgFg301.png')] private var ImgForeground301:Class;
		[Embed(source='data/Images/ImgPowerup.png')]    private var ImgIntrostar:Class;
	/*	[Embed(source = 'SprNinja.png')] private var SprNinja:Class;
				[Embed(source = 'SprNinja.png')] private var SprNinja2:Class;
						[Embed(source = 'SprNinja.png')] private var SprNinja3:Class;
								[Embed(source = 'SprNinja.png')] private var SprNinja4:Class;
								
								*/
								
								
									
	[Embed(source='data/Images/ImgTitle.png')] private var ImgTitle:Class;
	
	
		 private var _bloom:uint = 8; //How much light bloom to have - larger numbers = more
private var _fx:FlxSprite; //Our helper sprite - basically a mini screen buffer (see below)
[Embed(source = 'data/Sound/SndMainvox.mp3')] protected var SndVox:Class;

	//	[Embed(source = 'main.mp3')] private var Intro:Class;
        override public function MenuState():void
	{
		
		
		
		
		


			
			
		var txt:FlxText
		/*txt = new FlxText(0, (FlxG.width / 2) - 80, FlxG.width, "Killer Ninja")
		txt.setFormat(null,20,0xFFFFFFFF,"center")
		this.add(txt);
		
		*/
		txt = new FlxText(0, FlxG.height  -24, FlxG.width, "PRESS SPACE TO START")
		txt.setFormat(null, 16, 0xFFFFFFFF, "center");
		this.add(txt);
		

		//FlxG.playMusic(Intro,1);
			


		
		
        }
        override public function update():void
        {
            if (FlxG.keys.pressed("SPACE"))
            {                 FlxG.flash.start(0xffffffff, 1.75);
                FlxG.fade.start(0xff000000, 2, onFade);

				 FlxG.play(SndStart);
				
				
            }
			
			
	
			
			
            super.update();
        }
        private function onFade():void
        {
				
			FlxG.state = new Cutscene1();
			return;
        }
		
		
		
		
		 override public function create():void
{
//Title text, nothing crazy here!
	FlxG.play(SndVox);
//var title:FlxText = new FlxText(0,FlxG.height/2-20,FlxG.width,"Killer Ninja");
/*var title:FlxText = new FlxText(10, 100, FlxG.width, "Psyco Prof");
title.size = 32;
title.color = 0x00000ff;
title.alignment = "center";
add(title);*/

//TweenMax.to(title, 1, { x:15, y:100, alpha:1.7,delay:0,repeat:-1,yoyo:true});
//		var x1:FlxSprite;
//		x1 = new FlxSprite();
//s.createGraphic(16, 16);
//x1.loadGraphic(ImgForeground301, true);
//add(x1);			
//TweenMax.to(x1, 20, { x:150, y:100, alpha:1.7,delay:0,repeat:-1,yoyo:true});


//This is the sprite we're going to use to help with the light bloom effect
//First, we're going to initialize it to be a fraction of the screens size
_fx = new FlxSprite();
_fx.createGraphic(FlxG.width / _bloom, FlxG.height / _bloom, 0, true);
_fx.origin.x = _fx.origin.y = 0; //Zero the origin so scaling goes from top-left not center
_fx.scale.x = _fx.scale.y = _bloom; //Scale it up to be the same size as the screen again
_fx.antialiasing = true; //Set AA to true for maximum blurry
_fx.color = 0xafffff; //Tint it a little, cuz that looks cool
_fx.blend = "screen"; //Finally, set blend mode to "screen" (important!)
//Note that we do not add it to the game state! It's just a helper, not a real sprite.

//Then we scale the screen buffer down, so it draws a smaller version of itself
// into our tiny FX buffer, which is then scaled up. The net result of this operation
// is a blurry image that we can render back over the screen buffer to create the bloom.
screen.scale.x = screen.scale.y = 1/_bloom;

//This is the particle emitter that spews things off the bottom of the screen.
//I'm not going to go over it in too much detail here, but basically we
// create the emitter, then we create 50 16x16 sprites and add them to it.
var e:FlxEmitter = new FlxEmitter();
e.width = FlxG.width;
e.y =  500 //FlxG.height+8;
e.delay = 0.08;
e.gravity = -40;
e.setXSpeed(50,0);
e.setYSpeed();
var s:FlxSprite;
var particles:uint = 150;
for(var i:uint = 0; i < particles; i++)
{
s = new FlxSprite();
//s.createGraphic(16, 16);
s.loadGraphic(ImgIntrostar, true,false,33,72);
s.exists = false;
e.add(s);
}
e.start(false);
add(e);

var decoration:FlxSprite = new FlxSprite(640,480,ImgTitle);

		
		add(decoration);
		TweenMax.to(decoration, 2.4, { x:0, y:0,ease:Sine.easeIn, alpha:10} );
	TweenMax.to(decoration, 2.4, { x:-25, y:-25,ease:Sine.easeIn, alpha:10, repeat:-1,yoyo:true,delay:3} );

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