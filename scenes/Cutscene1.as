package scenes
{
   	import org.flixel.*;
	import com.greensock.*;
	import com.greensock.easing.*;
	import layers.*;
	
import flash.events.TimerEvent;

	import flash.utils.Timer;
	
    public class Cutscene1 extends FlxState
    {
	
		

		[Embed(source = '../data/Sound/MusStory.mp3')] private var Intro:Class;
		[Embed(source='../data/Images/ImgAura.png')] private var ImgBG:Class;
		[Embed(source='../data/Images/ImgPlayer.png')] private var ImgPlayer:Class;
		
	[Embed(source='../data/Images/Ele1halb.png')] private var 				Imgelement101:Class;
	[Embed(source='../data/Images/ImgGreen.png')] private var 				ImgGreen:Class;

	
	
		//private var _Map101Elements:Map101Elements;
	
	
		public var secondselapsed:uint = 0;
		public var secondselapsed2:uint = 0;

		
		public var score:FlxText;
		public var talk:FlxText;	
		private var _player2:FlxSprite;		// The Player

		protected var _bullets:FlxGroup;
		protected var _littleGibs:FlxEmitter;
	
		
		private var timer2:Timer;
       
	
	override public function Cutscene1():void
	{
		
		timer2 = new Timer(150, 50000);
		timer2.addEventListener(TimerEvent.TIMER,incrTimer);
		timer2.start();
		


			FlxG.playMusic(Intro, 1);
		
	
		
		
		

	
	//Zeug das man brauch weil ioch copy paste mit dem Playstate gemacht habe
	_littleGibs = new FlxEmitter();
	_bullets = new FlxGroup();



				
				

		
        }
     
	 override public function create():void
	{	



			
	
	// Background
	var decoration:FlxSprite = new FlxSprite(0,0,ImgBG);
			decoration.moves = true;
			decoration.solid = false;
			decoration.angularAcceleration = 1;
			add(decoration);
			
	
	 decoration = new FlxSprite(0,0,ImgBG);
			decoration.moves = true;
			decoration.solid = false;
			decoration.x = 400;
			decoration.angularAcceleration = 1.5;
			add(decoration);
			
			
	decoration = new FlxSprite(0,0,ImgBG);
			decoration.moves = true;
			decoration.x = 300;
			decoration.y = 200;
			decoration.solid = false;
			decoration.angularAcceleration = 3;
			add(decoration);
			
			
	decoration = new FlxSprite(0,0,ImgBG);
			decoration.moves = true;
			decoration.x = 700;
			decoration.y = 400;
			decoration.solid = false;
			decoration.angularAcceleration = 1;
			add(decoration);
				
	// Map

			 var Foreground:FlxSprite;
		 Foreground = new FlxSprite(0,580,Imgelement101);
Foreground.moves = true;
		Foreground.solid = false;
	Foreground.scale.x = 1;
Foreground.scale.y = 1;
				Foreground.scrollFactor.x = 1.000000;
Foreground.scrollFactor.y = 1.000000;
			FlxG.state.add(Foreground);	

		 Foreground = new FlxSprite(0,0,ImgGreen);
Foreground.moves = true;
		Foreground.solid = false;
	Foreground.scale.x = 1;
Foreground.scale.y = 1;
				Foreground.scrollFactor.x = 1.000000;
Foreground.scrollFactor.y = 1.000000;

			FlxG.state.add(Foreground);	

	

		//	_Map101Elements = new Map101Elements;
		//	FlxG.state.add(_Map101Elements);
			
	// Actors ;)	
	
		
				_player2 = new FlxSprite(1200, 800);
				_player2.loadGraphic(ImgPlayer,true,true,140/2,175);
				_player2.addAnimation("realidle", [1, 2,17,18,19,1,2,3,4,5,6,7,1,2,1,2,1,3,2,1,2,1,3,18,19,18,19,0], 6, true);
				_player2.addAnimation("jump", [19, 20, 21,22,23], 3, false);
				add(_player2);


		
	
	// Text
	
			score = new FlxText(122,0,FlxG.width);
			score.shadow = 0xff000000;
			score.text = "";
			score.scrollFactor.x = score.scrollFactor.y = 0;
			score.size = 24;
			add(score);
			

			talk = new FlxText(450,275,FlxG.width);
			talk.shadow = 0xff7A67EE;
			talk.text = "";
			talk.size = 48;
			talk.scrollFactor.x = score.scrollFactor.y = 0;
			add(talk);
			
			
	//================  PLAYER TWEEENS  =============================

TweenMax.to(_player2, 5, { x:20, y:20, alpha:1.7,delay:2,repeat:0,yoyo:true});
TweenMax.to(_player2, 3, { x:620, y:420, alpha:1.7,delay:7,repeat:0,yoyo:true});
TweenMax.to(_player2, 3, { x:1024/2, y:768/2+30, alpha:1.7,delay:10,repeat:0,yoyo:true});
TweenMax.to(_player2, 3, { x:900, y:768/2+30, alpha:1.7,delay:14,repeat:3,yoyo:true});	
		
			

 		
		
		
}		
		
override public function update():void
        {

			// The Script
			
			
// Player Animations

	if (secondselapsed < 70)
{
		_player2.play("jump");
		}	
		
		
	if (secondselapsed > 70 && secondselapsed < 200 )
{
		_player2.play("realidle");
		}
		
		
		
		
		
	if (secondselapsed >= 140 && secondselapsed < 146 )
{
		
			FlxG.quake.start(0.075,2);
		}

		
		
		
		// Ende wenn Cutscene fertig
		
	if (secondselapsed > 400 && secondselapsed < 600 )
		{
			FlxG.flash.start(0xffffffff, 1.75);
            FlxG.fade.start(0xff000000, 2, onFade);
	
		
		}
		
	
//========================= Text ===============================


// Story Text




if (secondselapsed >= 1 && secondselapsed < 2 )
{			
	
	score.text = "A";

	
		
		}
	
		
		if (secondselapsed >= 3 && secondselapsed < 4 )
{			
	
	score.text = "AT";

	
		
		}
	
		if (secondselapsed >= 4 && secondselapsed < 5 )
{			
	
	score.text = "AT ";

	
		
		}
	
		if (secondselapsed >= 5 && secondselapsed <  6)
{			
	
	score.text = "AT F";

	
		
		}
		
		// FUCK 
	
		if (secondselapsed >= 6 && secondselapsed < 7 )
{			
	
	score.text = "AT FIR";

	
		
		}
		
		
		
		
		
		
		
				
		if (secondselapsed >= 7 && secondselapsed < 8 )
{			
	
	score.text = "AT FIRS";


	
		
		}
	
		if (secondselapsed >= 8 && secondselapsed < 9 )
{			
	score.text = "AT FIRST";


	
		
		}
	
		if (secondselapsed >= 9 && secondselapsed < 10 )
{			
	
	score.text = "AT FIRST ";


	
		
		}
	
		if (secondselapsed >= 10 && secondselapsed < 11 )
{			
	
	score.text = "AT FIRST I";

	
		
		}
		
		
		
		
		
				
		if (secondselapsed >= 11 && secondselapsed < 12 )
{			
	
	score.text = "AT FIRST IT";


	
		
		}
	
		if (secondselapsed >= 12 && secondselapsed < 13 )
{			
	
	score.text = "AT FIRST IT";


	
		
		}
	
		if (secondselapsed >= 13 && secondselapsed < 14 )
{			
	
	score.text = "AT FIRST IT S";


	
		
		}
	
		if (secondselapsed >= 14 && secondselapsed < 15 )
{			
	
	score.text = "AT FIRST IT SE";

	
		
		}
		
		
				if (secondselapsed >= 15 && secondselapsed < 16 )
{			
	
	score.text = "AT FIRST IT SEE";

	
		
		}
		
		
		
		
		
				
		if (secondselapsed >= 16 && secondselapsed < 17 )
{			
	

	score.text = "AT FIRST IT SEEM";

	
		
		}
	
		if (secondselapsed >= 17 && secondselapsed < 18 )
{			
	

	score.text = "AT FIRST IT SEEME";

	
		
		}
	
		if (secondselapsed >= 18 && secondselapsed < 19 )
{			
	
	
	score.text = "AT FIRST IT SEEMED";

	
		
		}
	
		if (secondselapsed >= 19 && secondselapsed < 20 )
{			
	
	
	score.text = "AT FIRST IT SEEMED ";

	
		
		}
				if (secondselapsed >= 20 && secondselapsed < 21 )
{			
	

	score.text = "AT FIRST IT SEEMED L";
	
		
		}
		
		
		
		
		
				
		if (secondselapsed >= 21 && secondselapsed < 22 )
{			
	
	
	score.text = "AT FIRST IT SEEMED LI";


	
		
		}
	
		if (secondselapsed >= 22 && secondselapsed < 23 )
{			
	
	
	score.text = "AT FIRST IT SEEMED LIK";

	
		
		}
	
		if (secondselapsed >= 23 && secondselapsed < 24 )
{			
	

	score.text = "AT FIRST IT SEEMED LIKE";

		
		}
	
		if (secondselapsed >= 24 && secondselapsed < 25 )
{			
	

	score.text = "AT FIRST IT SEEMED LIKE ";


	
		
		}
		
	
	if (secondselapsed >= 25 && secondselapsed < 26 )
{			
	
	
	score.text = "AT FIRST IT SEEMED LIKE A";

	
		
		}
				if (secondselapsed >= 26 && secondselapsed < 27 )
{			
	
	score.text = "AT FIRST IT SEEMED LIKE A ";
	
		
		}
		
		
		
		
		
				
		if (secondselapsed >= 27 && secondselapsed < 28 )
{			
	
		score.text = "AT FIRST IT SEEMED LIKE A N";


	
		
		}
	
		if (secondselapsed >= 28 && secondselapsed < 29 )
{			
	
	
	score.text = "AT FIRST IT SEEMED LIKE A NO";

	
		
		}
	
		if (secondselapsed >= 29 && secondselapsed < 30 )
{			
	

	score.text = "AT FIRST IT SEEMED LIKE A NOR";
		
		}
	
		if (secondselapsed >= 30 && secondselapsed < 31)
{			
	
	score.text = "AT FIRST IT SEEMED LIKE A NORM";


	
		
		}
			if (secondselapsed >= 31 && secondselapsed < 32 )
{			
	
	
	score.text = "AT FIRST IT SEEMED LIKE A NORMA";

	
		
		}
				if (secondselapsed >= 32 && secondselapsed < 33 )
{			
	

	score.text = "AT FIRST IT SEEMED LIKE A NORMAL";
	
		
		}
		
		
		
		
		
				
		if (secondselapsed >= 33 && secondselapsed < 34 )
{			
	
	
	score.text = "AT FIRST IT SEEMED LIKE A NORMAL ";


	
		
		}
	
		if (secondselapsed >= 34 && secondselapsed < 35)
{			
	
	
	score.text = "AT FIRST IT SEEMED LIKE A NORMAL D";

	
		
		}
	
		if (secondselapsed >= 35 && secondselapsed < 36)
{			
	
	score.text = "AT FIRST IT SEEMED LIKE A NORMAL DA";
		
		}
	
		if (secondselapsed >= 36 && secondselapsed < 37 )
{			
	score.text = "AT FIRST IT SEEMED LIKE A NORMAL DAY";


	
		
		}
				
		
		
		
		
		
		
		
		
			
		if (secondselapsed >= 37 && secondselapsed < 38 )
{			
	score.text = "AT FIRST IT SEEMED LIKE A NORMAL DAY ";


	
		
		}
		
	
	if (secondselapsed >= 38 && secondselapsed < 39 )
{			
	
	
score.text = "AT FIRST IT SEEMED LIKE A NORMAL DAY F";

	
		
		}
				if (secondselapsed >= 39 && secondselapsed < 40 )
{			
	
	score.text = "AT FIRST IT SEEMED LIKE A NORMAL DAY FO";
	
		}
		
		
		
		
		
				
		if (secondselapsed >= 40 && secondselapsed < 41 )
{			
	
	score.text = "AT FIRST IT SEEMED LIKE A NORMAL DAY FOR";

		
		}
	
		if (secondselapsed >= 41 && secondselapsed < 42 )
{			
	score.text = "AT FIRST IT SEEMED LIKE A NORMAL DAY FOR ";

	
		
		}
	
		if (secondselapsed >= 42 && secondselapsed < 43 )
{			
	

	score.text = "AT FIRST IT SEEMED LIKE A NORMAL DAY FOR X";
	
		}
	
		if (secondselapsed >= 43 && secondselapsed < 44)
{			
	score.text = "AT FIRST IT SEEMED LIKE A NORMAL DAY FOR XE";

	
		
		}
			if (secondselapsed >= 44 && secondselapsed < 45 )
{			
	
	
	score.text = "AT FIRST IT SEEMED LIKE A NORMAL DAY FOR XEN";

		
		}
				if (secondselapsed >= 45 && secondselapsed < 46)
{			
	score.text = "AT FIRST IT SEEMED LIKE A NORMAL DAY FOR XENI";

		
		}
		
		
		
		
		
				
		if (secondselapsed >= 46 && secondselapsed < 47 )
{			
	
	
	score.text = "AT FIRST IT SEEMED LIKE A NORMAL DAY FOR XENIU";

	
		
		}
	
		if (secondselapsed >= 47 && secondselapsed < 48)
{			
	
	score.text = "AT FIRST IT SEEMED LIKE A NORMAL DAY FOR XENIUS";

	
		
		}
	
		if (secondselapsed >= 48 && secondselapsed < 49)
{			
	
	score.text = "AT FIRST IT SEEMED LIKE A NORMAL DAY FOR XENIUS.";
	
		}
	
		if (secondselapsed >= 49 && secondselapsed < 50 )
{			
	score.text = "AT FIRST IT SEEMED LIKE A NORMAL DAY FOR XENIUS..";

	
		
		}
			if (secondselapsed >= 50 && secondselapsed < 51 )
{			
	score.text = "AT FIRST IT SEEMED LIKE A NORMAL DAY FOR XENIUS...";

	
		
		}	
		
		
		
		
		//talk.text = "" + storietex(talkbuchstaben, 20, 0.5);


	//========= Story Text Ende
		

if (secondselapsed >= 148 && secondselapsed < 158 )
{			
	
	talk.text = "@*#&!?";

	
		
		}
	
		
		if (secondselapsed >= 158 && secondselapsed < 168 )
{			
	
	talk.text = "WHAT HAPPEND?";

	
		
		}	
			
			
			
			
			
			
			
		
			
		// Abort the Cutscene	
		if (FlxG.keys.pressed("SPACE"))
            {   
				FlxG.flash.start(0xffffffff, 1.75);
                FlxG.fade.start(0xff000000, 2, onFade);

				
            }
			

			
          super.update();
				

		
        }
		
		
		   public function incrTimer(evt:TimerEvent):void
		{
		
			//timer.removeEventListener(TimerEvent.TIMER_COMPLETE,incrTimer);
		secondselapsed = secondselapsed + 1; 

        }

		
		
  
		
		        private function onFade():void
        {
				FlxG.state = new MovControlls();
        }
		
		
		
	





	
	







		
}}





