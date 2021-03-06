package scenes
{
   	import org.flixel.*;
	import com.greensock.*;
	import com.greensock.easing.*;
	
	import flash.events.TimerEvent;

	import flash.utils.Timer;
		
	import layers.*;
	
    public class WinState extends FlxState
    {
	
		

		[Embed(source = '../data/Sound/MusWin.mp3')] private var Intro:Class;
		[Embed(source='../data/Images/ImgAura.png')] private var ImgBG:Class;
		[Embed(source='../data/Images/ImgPlayer.png')] private var ImgPlayer:Class;
		[Embed(source='../data/Images/ImgCodinsoft.png')] private var ImgCodinsoft:Class;


	
	
		private var _Map101Elements:Map101Elements;
	
	
		public var secondselapsed:uint = 0;
		public var secondselapsed2:uint = 0;

		
		public var score:FlxText;
		public var talk:FlxText;	
		private var _player2:FlxSprite;			// The Player
		private var Codinsoft:FlxSprite;		// The Jens

		protected var _bullets:FlxGroup;
		protected var _littleGibs:FlxEmitter;
	
		
		private var timer2:Timer;
       
	
	override public function WinState():void
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
	
	
	
				addChild( new Stats());

	
	
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

				

			_Map101Elements = new Map101Elements;
			FlxG.state.add(_Map101Elements);
			
	// Actors ;)	
	
		
				_player2 = new FlxSprite(1200, 800);
				_player2.loadGraphic(ImgPlayer,true,true,140/2,175);
				_player2.addAnimation("realidle", [21,22,23], 6, true);
				_player2.addAnimation("jump", [19, 20, 21,22,23], 3, false);
				add(_player2);


		
	
	// Text
	
			score = new FlxText(122,0,FlxG.width);
			score.shadow = 0xaf000000;
			score.color = 0x7A67EE;
			score.text = "YOU WIN !!!!";
			score.scrollFactor.x = score.scrollFactor.y = 0;
			score.size = 24;
			add(score);
			

			talk = new FlxText(450,275,FlxG.width);
			talk.shadow = 0xaf7A67EE;
			talk.color = 0x7A67EE;
			talk.text = "YOU WIN !!!";
			talk.size = 48;
			talk.scrollFactor.x = score.scrollFactor.y = 0;
			add(talk);
			
			// Ab Hier der Durchscroll Text
			var credits:FlxText = new FlxText(2,900,FlxG.width);
			 credits.shadow = 0xff7A67EE;
			 credits.text = "C R E D I T S";
			 credits.size = 34;
			 credits.scrollFactor.x =  credits.scrollFactor.y = 0;
			add( credits);
			TweenMax.to(credits, 55, { x:2,y:-200, alpha:1.7,delay:1,repeat:0,yoyo:true});

			 credits = new FlxText(2,900,FlxG.width);
			 credits.shadow = 0xff7A67EE;
			 credits.text = "PROGRAMMING: 	 						MARCEL FLAIG";
			 credits.size = 28;
			 credits.scrollFactor.x =  credits.scrollFactor.y = 0;
			add( credits);
			TweenMax.to(credits, 55, { x:2,y:-200, alpha:1.7,delay:4,repeat:0,yoyo:true});

			
			 credits = new FlxText(2,900,FlxG.width);
			 credits.shadow = 0xff7A67EE;
			 credits.text = "GRAPHICS:								TOBIAS BIHLMEYER"
			 credits.size = 28;
			 credits.scrollFactor.x =  credits.scrollFactor.y = 0;
			add( credits);
			TweenMax.to(credits, 55, { x:2,y:-200, alpha:1.7,delay:6,repeat:0,yoyo:true});

				 credits = new FlxText(2,900,FlxG.width);
			 credits.shadow = 0xff7A67EE;
			 credits.text = "ANIMATIONS:								TOBIAS BIHLMEYER"
			 credits.size = 28;
			 credits.scrollFactor.x =  credits.scrollFactor.y = 0;
			add( credits);
			TweenMax.to(credits, 55, { x:2,y:-200, alpha:1.7,delay:8,repeat:0,yoyo:true});

				 credits = new FlxText(2,900,FlxG.width);
			 credits.shadow = 0xff7A67EE;
			 credits.text = "MUSIC:									MARCEL FLAIG"
			 credits.size = 28;
			 credits.scrollFactor.x =  credits.scrollFactor.y = 0;
			add( credits);
			TweenMax.to(credits, 55, { x:2,y:-200, alpha:1.7,delay:10,repeat:0,yoyo:true});

					 credits = new FlxText(2,900,FlxG.width);
			 credits.shadow = 0xff7A67EE;
			 credits.text = "IDEA:									UH , NO IDEA"
			 credits.size = 28;
			 credits.scrollFactor.x =  credits.scrollFactor.y = 0;
			add( credits);
			TweenMax.to(credits, 55, { x:2,y:-200, alpha:1.7,delay:12,repeat:0,yoyo:true});

			
			
			
					 credits = new FlxText(2,900,FlxG.width);
			 credits.shadow = 0xff7A67EE;
			 credits.text = "BIG THANKS FLY OUT TO:								"
			 credits.size = 34;
			 credits.scrollFactor.x =  credits.scrollFactor.y = 0;
			add( credits);
			TweenMax.to(credits, 55, { x:2,y:-200, alpha:1.7,delay:16,repeat:0,yoyo:true});

			
			
			
					credits = new FlxText(2,900,FlxG.width);
			 credits.shadow = 0xff7A67EE;
			 credits.text = "MICHAEL AMMERSCHUBER						FOR RESIZING IMAGES"
			 credits.size = 28;
			 credits.scrollFactor.x =  credits.scrollFactor.y = 0;
			add( credits);
			TweenMax.to(credits, 55, { x:2,y:-200, alpha:1.7,delay:20,repeat:0,yoyo:true});

			
			credits = new FlxText(2,900,FlxG.width);
			 credits.shadow = 0xff7A67EE;
			 credits.text = "					GENERAL GAMEDEV SUPPORT AND KNOWLEDGE"
			 credits.size = 28;
			 credits.scrollFactor.x =  credits.scrollFactor.y = 0;
			add( credits);
			TweenMax.to(credits, 55, { x:2,y:-200, alpha:1.7,delay:26,repeat:0,yoyo:true});

				Codinsoft = new FlxSprite( FlxG.width/2,900,ImgCodinsoft);
				add(Codinsoft);
				TweenMax.to(Codinsoft, 55, { x:FlxG.width/2,y:-200, alpha:1.7,delay:28,repeat:0,yoyo:true});

			
			
			
TweenMax.to(talk, 5, { x:20,y:20, alpha:1.7,delay:2,repeat:0,yoyo:true});
TweenMax.to(talk, 3, { x:620, y:420, alpha:1.7,delay:7,repeat:0,yoyo:true});
TweenMax.to(talk, 3, { x:1024/2, y:768/2+30, alpha:1.7,delay:10,repeat:0,yoyo:true});
TweenMax.to(talk, 3, { x:900, y:768/2+30, alpha:1.7,delay:14,repeat:3,yoyo:true});	
		
			
TweenMax.to(score, 4, { x:30, y:30, alpha:1.7,delay:2,repeat:0,yoyo:true});
TweenMax.to(score, 2, { x:520, y:120, alpha:1.7,delay:7,repeat:0,yoyo:true});
TweenMax.to(score, 2, { x:300, y:300, alpha:1.7,delay:10,repeat:0,yoyo:true});
TweenMax.to(score, 2, { x:300, y:800, alpha:1.7,delay:14,repeat:3,yoyo:true});	
		
			
	//================  PLAYER TWEEENS  =============================

TweenMax.to(_player2, 3, { x:20, y:20, alpha:1.7,delay:0,repeat:0,yoyo:true});
TweenMax.to(_player2, 1, { x:620, y:420, alpha:1.7,delay:3,repeat:0,yoyo:true});
TweenMax.to(_player2, 1, { x:1024/2, y:768/2+30, alpha:1.7,delay:4,repeat:2,yoyo:true});
TweenMax.to(_player2, 1, { x:900, y:768/2+30-500, alpha:1.7,delay:6,repeat:-1,yoyo:true});	
		
			

 		
		
		
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
		
			//FlxG.quake.start(0.075,2);
		}

		
		
		
		// Ende wenn Cutscene fertig
		
	if (secondselapsed > 400 && secondselapsed < 600 )
		{
			FlxG.flash.start(0xffffffff, 1.75);
            FlxG.fade.start(0xff000000, 2, onFade);
	
		
		}
		
	
//========================= Text ===============================


// Story Text


			
			
			
			
			
		
			
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
				//FlxG.state = new Logo();
				
				
				return;
        }
		
		
		
	





	
	







		
}}





