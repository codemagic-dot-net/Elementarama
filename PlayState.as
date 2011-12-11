package
{

	import org.flixel.*;
	import Rnd;
	import Displacement;
	import com.greensock.*;
    import com.greensock.easing.*;
	
	import layers.*;
	import gameobjects.*;
	import scenes.*;
	import enemies.*;
	
	public class PlayState extends FlxState
	{
		 
	//	public var MapNumber:uint=101;
		[Embed(source='data/Images/ImgBeard.png')] private var ImgBeard:Class;
/*=================================Images========================================================================*/
	//	[Embed(source='data/Images/noisechecker.png')]private var ImgBG:Class;
[Embed(source='data/Images/protoTiles.png')] 	private var ImgTiles:Class;
[Embed(source='data/Images/waterfall.png')] private var ImgWater:Class;
[Embed(source='data/Images/fire.png')] private var ImgFire:Class;
[Embed(source='data/Images/part.png')] private var ImgPart:Class;
//displacer ende

	//	[Embed(source="map.png")] private var ImgMap:Class;		// MapFile für png to scv
	//	[Embed(source='tileset3yx.png')]private var ImgTiles:Class;	// MapTiles für png to csv map

	//	[Embed(source = 'exit.png')] 				private var ImgExit:Class;		// Exit

[Embed(source='data/Images/ImgEnemygibs.png')]			private var ImgGibs:Class;		// Gibs
[Embed(source='data/Images/ImgEnemygibs.png')]	 private var ImgSpawnerGibs:Class;  // Spawner Gibs
//[Embed(source='data/Images/ImgCoins.png')] private var ImgCoins:Class;
[Embed(source = 'data/Images/ImgHealth.png')] private var ImgHealth:Class;
[Embed(source = 'data/Images/ImgKey.png')] private var ImgHudkey:Class;

[Embed(source = 'data/Images/ImgHUDPowerup1.png')] private var ImgHUDPowerup1:Class;
[Embed(source = 'data/Images/ImgHUDPowerup2.png')] private var ImgHUDPowerup2:Class;
[Embed(source = 'data/Images/ImgHUDPowerup3.png')] private var ImgHUDPowerup3:Class;

[Embed(source='data/Images/HUD.png')] private var ImgHUDBG:Class;
//[Embed(source='data/Images/ImgHUDBGR.png')] private var ImgHUDBGR:Class;

[Embed(source='data/Images/ImgCoins.png')] private var ImgSinglecoin:Class;
/*=================================Map========================================================================*/
		
		
//		[Embed(source = 'map.txt', mimeType = "application/octet-stream")] private var DataMap:Class;
	

/*=================================Sounds=====================================================================*/	
		
		[Embed(source='data/Sound/SndCoin.mp3')] protected var SndCoin:Class;	// Collect Coin
		[Embed(source='data/Sound/SndJumpPad.mp3')] protected var SndJumpPad:Class;	// Collect Coin
		[Embed(source='data/Sound/SndSlowdown.mp3')] protected var SndSlowdown:Class;	// Collect Coin
		[Embed(source='data/Sound/SndWin.mp3') ]  protected var SndWin:Class;	// Collected All coins / exit	
		[Embed(source='data/Sound/MusTheme1.mp3')] private var MusTheme1:Class;	// Theme
		[Embed(source='data/Sound/MusBoss1.mp3')] private var MusBoss1:Class;	// Theme



/*=================================Variablen==================================================================*/		
		public var bar:FlxSprite ;			
//Displacers
// private var emitterD:Displacement;
private var FxGroup:FXGroup;
//private var mouseEmitter:Displacement;
private var particles:FlxEmitter;
private var particles2:FlxEmitter;





//DISplacers ende
					// geändert für versuch fglan zeug in extra as zu bekommen protected var _player1:Player;		// The Player
					// public var _player1:Player;		// The Player
					protected var _player1:Player;		// The Player
					private var lastquake:uint=0;
	
					private var _map102:Map102; // Flan
					private var _map103:Map103; // Flan
					private var _enemy:Enemy1;
					
					
					private var _map101:Map101; // Flan
					private var _Map101Foreground:Map101Foreground;
					private var _Map101Background:Map101Background;
					private var _Map101Elements:Map101Elements;
					private var _Map101Interactive:Map101Interactive;
					private var _Map102Foreground:Map102Foreground;
					private var _Map102Background:Map102Background;
					private var _Map102Elements:Map102Elements;
					
					
					private var _Map103Foreground:Map103Foreground;
					private var _Map103Background:Map103Background;
					
					private var _map199:Map199; // Flan
					private var _Map199Foreground:Map199Foreground;
					private var _Map199Background:Map199Background;
					
					public var hasKey:Number = 0; // sollte eigentlich in die Player.as
					public var hasPowerup:Boolean = false; // sollte eigentlich in die Player.as
					public var hasPowerup2:Boolean = false; // sollte eigentlich in die Player.as
					public var hasPowerup3:Boolean = false; // sollte eigentlich in die Player.as
					public var hasJumpPad:Boolean = false; // sollte eigentlich in die Player.as
					public var bot1:Bot;
					public var Spawner1:Spawner;
					public var reload:Boolean; // Aus MODE 
					public var GrpKey:FlxGroup; // Flx Gruppe für den Key
					public var GrpDoor:FlxGroup; // Flx Gruppe für den Key
					public var GrpPowerup:FlxGroup; // Flx Gruppe für den Key
					public var GrpPowerup2:FlxGroup; // Flx Gruppe für den Key
					public var GrpPowerup3:FlxGroup; // Flx Gruppe für den Key
					public var GrpHealth:FlxGroup; // Flx Gruppe für den Key
					public var GrpExit:FlxGroup; // Flx Gruppe für den Key
					public var GrpSpecialbox:FlxGroup; // Flx Gruppe für den Key
					public var GrpJumpPad:FlxGroup; // Flx Gruppe für den Key
					public var GrpCrusher:FlxGroup; // Flx Gruppe für den Key			
					public var GrpAbyss:FlxGroup; // Flx Gruppe für den Key			
					public var GrpPortal:FlxGroup; // Flx Gruppe für den Key	
										public var GrpMovableBlock:FlxGroup; // Flx Gruppe für den Key

					// Sizes and Heights
			
					private var levelheight:uint = 40; // Nur zum berechnene von x y und leichtem ändern
					
/*=======Groups============*/

					public var GrpCoins:FlxGroup;		// Coins

				
					protected var _bullets:FlxGroup;
					protected var _bullets2:FlxGroup;
					protected var _bots:FlxGroup;
			
					protected var _spawners:FlxGroup;
					protected var _botBullets:FlxGroup;

					 //meta groups,für schnellere Kollision

					protected var MGrpObjects:FlxGroup;
					protected var _enemies:FlxGroup;
					public var TxtScore:FlxText;		// Mission 
				

/*=======Emitter=========*/

					protected var _littleGibs:FlxEmitter; // Player / Spawner / Bot1
					protected var _bigGibs:FlxEmitter; //Player / Spawner / Bot1
					protected var EmrCoins:FlxEmitter; //Wird von SpecialboxKlasse benutzt
		

/*=======Sprites=========*/

				//	public var exit:FlxSprite;			// Exit
					protected var _player:FlxSprite;	// Playersprite
									protected var beard:FlxSprite;	// Playersprite

/*=======HUD Text============*/

				
					public var score:FlxText;		    // Score 
					public var playerpos:FlxText;		// Playerposition 
					public var TxtStatus:FlxText;		// Mission 
				
					
/*=======HUD Sprites============*/				
					public var HealthStatus1:FlxSprite;
					public var HealthStatus2:FlxSprite;
					public var HealthStatus3:FlxSprite;	
					public var HealthStatus4:FlxSprite;
					public var HealthStatus5:FlxSprite;
					public var HealthStatus6:FlxSprite;
					public var HUDKey1:FlxSprite;
					public var HUDKey2:FlxSprite;
					public var HUDPowerup1:FlxSprite;
					private var HUDPowerup2:FlxSprite;
					//private var HUDBGR:FlxSprite;
					private var HUDPowerup3:FlxSprite;
					private var HUDBG:FlxSprite;
					
					
					
	/*=======Map abhängig============*/				
					
					private var _Boss1:FlxSprite; // Von Map104
					
					
/*=======================================================================================================*/
/*=================================Create================================================================*/
/*=======================================================================================================*/					
		
	override public function create():void

		{
			addChild( new Stats());
			FlxState.bgColor = 0xff464646;
			/*
			
			
	//Displacerzeug		
			
			 var bg:FlxBackdrop = new FlxBackdrop(ImgBG);
add(bg);

var water:FlxSprite = new FlxSprite(100, 160, ImgWater);
add(water);
var fire:FlxSprite = new FlxSprite(380 - 32, 160 - 70, ImgFire);
add(fire);
var wallThickness:int = 16;
var b:FlxTileblock = new FlxTileblock(0, 0, FlxG.width, wallThickness); //ceiling
b.createGraphic(FlxG.width, wallThickness,0x88000000);
add(b);
b = new FlxTileblock(0, 0, wallThickness, FlxG.height); //left wall
b.createGraphic(wallThickness, FlxG.height,0x88000000);
add(b);
b = new FlxTileblock(FlxG.width - wallThickness, 0, wallThickness, FlxG.height); //right wall
b.createGraphic(wallThickness,FlxG.height,0x88000000);
add(b);
b = new FlxTileblock(0, FlxG.height - wallThickness, FlxG.width, wallThickness); //floor
b.createGraphic(FlxG.width,wallThickness,0x88000000);
add(b);


add(particles = new FlxEmitter(0, 0));
particles.createSprites(ImgPart,FlxG.width/2, 16, false);
particles.setXSpeed( -15, 15);
particles.setYSpeed(0, 55);
particles.setRotation( 0, 0);
particles.gravity = 0;
particles.setSize(FlxG.width, 1);
particles.start(false, 0.01);

add(particles2 = new FlxEmitter(0, FlxG.height));
particles2.createSprites(ImgPart,FlxG.width/2, 16, false);
particles2.setXSpeed( -15, 15);
particles2.setYSpeed(0, -55);
particles2.setRotation( 0, 0);
particles2.gravity = 0;
particles2.setSize(FlxG.width, 1);
particles2.start(false, 0.01);



FxGroup = new FXGroup;
add(FxGroup);
FxGroup.add(emitter = new Displacement(FxGroup.FXBuffer, 100, 160));
emitter.setSize(32, 1);
emitter.setXSpeed(-5, 5);
emitter.setYSpeed( 30, 60);
emitter.blobHeight = 4;
emitter.blobWidth = 10;
emitter.gravity = 0;
emitter.displaceAmtX = 2;
emitter.displaceAmtY = 4;
emitter.alpha = .6;
emitter.life = 2.5;
emitter.blobCount = 300;
emitter.begin();

FxGroup.add(emitter = new Displacement(FxGroup.FXBuffer, 380-32, 160));
emitter.setSize(32, 1);
emitter.setXSpeed(-5, 5);
emitter.setYSpeed( -20, -60);
emitter.blobHeight = 16;
emitter.blobWidth = 8;
emitter.displaceAmtX = 2;
emitter.displaceAmtY = 3;
emitter.alpha = .6;
emitter.life = 2.5;
emitter.blobCount = 300;
emitter.begin();


FxGroup.add(mouseEmitter = new Displacement(FxGroup.FXBuffer,0,0));
mouseEmitter.setSize(8, 8);
mouseEmitter.setXSpeed(-15, 15);
mouseEmitter.setYSpeed( -100, -150);
mouseEmitter.blobHeight = 8;
mouseEmitter.blobWidth = 8;
mouseEmitter.displaceAmtX = 2;
mouseEmitter.displaceAmtY = 2;
mouseEmitter.alpha = .8;
mouseEmitter.life = .4;
mouseEmitter.blobCount = 200;
mouseEmitter.begin();
*/
/*=================================Setup Level Background and Music==================================================================*/	

		
		bgColor = 0xff464646;
		FlxG.playMusic(MusTheme1,1);

		FlxG.mouse.hide();
		
	 

	 
	 

//get the gibs set up and out of the way
_littleGibs = new FlxEmitter();
_littleGibs.delay = 3;
_littleGibs.setXSpeed(-150,150);
_littleGibs.setYSpeed(-200,0);
_littleGibs.setRotation(-720,-720);
//_littleGibs.createSprites(ImgGibs,100,10,true,0.5,0.65);
_littleGibs.createSprites(ImgGibs, 50, 10, true, 0);
_bigGibs = new FlxEmitter();
_bigGibs.setXSpeed(-200,200);
_bigGibs.setYSpeed(-300,0);
_bigGibs.setRotation(-720,-720);
//_bigGibs.createSprites(ImgSpawnerGibs,50,20,true,0.5,0.35);
_bigGibs.createSprites(ImgSpawnerGibs,50,20,true,0);






EmrCoins = new FlxEmitter();
EmrCoins.delay = 3;
//EmrCoins.setXSpeed(-150,150);
//EmrCoins.setYSpeed(-200,0);
//EmrCoins.setRotation(-720,-720);

EmrCoins.createSprites(ImgSinglecoin,50,0,true,1);

//level generation needs to know about the spawners (and thusly the bots, players, etc)

_bullets = new FlxGroup();
_bullets2  = new FlxGroup();
_enemies = new FlxGroup();
MGrpObjects = new FlxGroup();	
_bots = new FlxGroup();
_botBullets = new FlxGroup();
_spawners = new FlxGroup();

		
 


_player1 = new Player(FlxG.tilesize*5, +20*FlxG.tilesize, _bullets.members, _bullets2.members, _littleGibs); // Muss an map angepasst werden
			
	







//spawner _spawners.add MUSS REIN
//Spawner1 = new Spawner(10*8,10*8,_bigGibs,_bots,_botBullets.members,_littleGibs,_player1);
//add(Spawner1);
//Spawner1 = new Spawner(50*8,10*8,_bigGibs,_bots,_botBullets.members,_littleGibs,_player1);
//add(Spawner1);
/*Spawner1 = new Spawner(30*8,10*8,_bigGibs,_bots,_botBullets.members,_littleGibs,_player1);
add(Spawner1);
Spawner1 = new Spawner(60*8,10*8,_bigGibs,_bots,_botBullets.members,_littleGibs,_player1);
add(Spawner1);
*/
/*
_bots.add(bot1 = new Bot (40 * 8, 10 * 8, _botBullets.members, _bigGibs, _player1));
add(bot1);
bot1 = new Bot (50 * 8, 10 * 8, _botBullets.members, _bigGibs, _player1);
add(bot1);
*/




/* Beispiel COde für 1 Enemy1
_enemy = new Enemy1(48, 48, _player1);
add(_enemy)



*/
var i:uint;

 for(i = 0; i < 50; i++)
_botBullets.add(new BotBullet());


for(i = 0; i < 30; i++)
_bullets.add(new Bullet());
 

for(i = 0; i < 8; i++)
_bullets2.add(new Bullet2());













/*=================================//Create coins to collect (see createCoin() function below for more info) (X*8+3,Y*8+2)
==================================================================*/				

GrpCoins = new FlxGroup();

//Beispiel 	coins.add(test = new Coin(FlxG.tilesize*2, (FlxG.tilesize * levelheight)-FlxG.tilesize*4)); add(coins);
			
	GrpCoins.add(EmrCoins);		
		
	
	// Kollisionsgruppen für getGrpname zb getCoin
				GrpMovableBlock = new FlxGroup();		 

			GrpKey = new FlxGroup();		 
			GrpDoor = new FlxGroup();		
			GrpExit = new FlxGroup();	
			GrpPowerup = new FlxGroup();	
			GrpPowerup2 = new FlxGroup();	
			GrpPowerup3 = new FlxGroup();	
			GrpSpecialbox = new FlxGroup();
			GrpHealth = new FlxGroup();
			GrpJumpPad = new FlxGroup();
			GrpCrusher = new FlxGroup();
			GrpAbyss = new FlxGroup();
			GrpPortal = new FlxGroup();

			
/*=================================Load the Map and add Player=====================================================================*/		
			

			


											
//if(MapNumber==101){

if(MapNumber == 101){
		


				

			_Map101Background = new Map101Background;
			FlxG.state.add(_Map101Background);
				
			
			_map101 = new Map101;
			add(_map101.layerMap);
			   
			
			_Map101Elements = new Map101Elements;
			FlxG.state.add(_Map101Elements);
			
		
						add(_player1);
						add(_bullets);

                        add(_bullets2);
						
			//_Map101Interactive = new Map101Interactive;
			//FlxG.state.add(_Map101Interactive)

			_Map101Foreground = new Map101Foreground;
			FlxG.state.add(_Map101Foreground);
				
				
				
				
// TEST
/*
		obj = new Portal(9309, 269, 1250, 50);
						obj = new Portal(93, 237, 12200, 50);
									obj = new Portal(7325, 525,12627,800);
										obj = new Crusher(11306, 1228,5,0,400);
*/	

//==================================FLAN CODE START MAP 101=================================
//====================================================================
		
			var obj:FlxSprite;
			
			obj = new Runner(14688, 512,_player1);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Runner(15040, 384,_player1);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Runner(15808, 384,_player1);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Runner(13312, 192,_player1);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Runner(12928, 512,_player1);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Runner(11360, 544,_player1);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Runner(10496, 256,_player1);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Runner(9088, 64,_player1);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
	
			obj = new Coin(6656, 320);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(6720, 320);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(6976, 320);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(7040, 320);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(7296, 320);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(7360, 320);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(2656, 512);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(2720, 512);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(2784, 512);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(2848, 512);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(2912, 512);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(2976, 512);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Health(5088, 352);
GrpHealth.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Health(5184, 352);
GrpHealth.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Enemy1(4400, 624,_player1);
_enemies.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Enemy1(4592, 624,_player1);
_enemies.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Enemy1(4816, 624,_player1);
_enemies.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Powerup(6533, 197);
GrpPowerup.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Powerup(11525, 165);
GrpPowerup.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new JumpPad(2528, 1184,_player1);
GrpJumpPad.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new JumpPad(4832, 1184,_player1);
GrpJumpPad.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Exit(12688, 1168);
GrpExit.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new MovingBlock(11616, 992,20,100);
MGrpObjects.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new MovingBlock(11840, 992,30,150);
MGrpObjects.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new MovingBlock(12096, 992,40,50);
MGrpObjects.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Door(12576, 960);
GrpDoor.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new JumpPad(12608, 896,_player1);
GrpJumpPad.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new JumpPad(11520, 1184,_player1);
GrpJumpPad.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Key(11456, 320);
GrpKey.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new MovableBlock(3888, 1200);
GrpMovableBlock.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new MovableBlock(3440, 1200);
GrpMovableBlock.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Enemy2(9504, 1184,_player1);
_enemies.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(5502, 368);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(5662, 272);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(5822, 208);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Runner(13216, 1120,_player1);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Runner(13760, 832,_player1);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Runner(15488, 992,_player1);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Runner(15936, 992,_player1);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Runner(11008, 1024,_player1);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Runner(9408, 928,_player1);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Runner(9216, 320,_player1);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Runner(7616, 928,_player1);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Runner(7648, 288,_player1);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Runner(6080, 896,_player1);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Runner(5728, 352,_player1);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Runner(3648, 448,_player1);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Runner(1888, 832,_player1);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Runner(1056, 288,_player1);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Door(4320, 960);
GrpDoor.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Key(4384, 1184);
GrpKey.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Powerup2(4448, 1088);
GrpPowerup2.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Enemy2(6528, 1184,_player1);
_enemies.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Enemy2(6720, 1184,_player1);
_enemies.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new JumpPad(6560, 1184,_player1);
GrpJumpPad.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new MovingBlock(12320, 992,20,50);
MGrpObjects.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(12606, 624);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(12606, 560);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(12606, 496);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(12606, 432);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(12606, 368);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(12606, 304);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(7550, 336);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(7614, 336);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(7678, 336);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(7870, 400);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(7934, 400);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(7998, 400);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new FlyingObject(9748, 1072,_player1);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new FlyingObject(9908, 1072,_player1);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(8094, 560);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(8158, 560);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(8222, 560);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new JumpPad(7456, 1184,_player1);
GrpJumpPad.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new FlyingObject(5716, 1072,_player1);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new FlyingObject(5972, 1072,_player1);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Enemy2(5856, 1184,_player1);
_enemies.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(7454, 976);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(7454, 848);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(7454, 720);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(7454, 592);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(7454, 464);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(6558, 1008);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(6558, 880);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(6558, 752);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(6558, 624);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(6558, 496);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(4830, 1072);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(4830, 976);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(4830, 880);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(4830, 784);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(4830, 688);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(4862, 528);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(4894, 432);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(4958, 368);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(2526, 1072);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(2526, 944);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(2526, 816);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(2526, 688);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(2526, 528);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(4318, 848);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(4382, 848);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(4446, 848);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(4510, 848);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Crusher(8500, 1072,5,0,400);
GrpCrusher.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Crusher(8660, 1072,5,0,400);
GrpCrusher.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Crusher(8788, 1072,5,0,400);
GrpCrusher.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Crusher(8916, 1072,5,0,400);
GrpCrusher.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new FlyingObject(8276, 1072,_player1);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new FlyingObject(8180, 1072,_player1);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new MovingBlock(672, 1024,5,50);
MGrpObjects.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new MovingBlock(896, 1024,20,50);
MGrpObjects.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new MovingBlock(1120, 1024,60,50);
MGrpObjects.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new MovingBlock(1344, 1024,50,50);
MGrpObjects.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Crusher(1748, 1072,5,0,400);
GrpCrusher.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Crusher(1908, 1072,5,0,400);
GrpCrusher.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Crusher(2036, 1072,5,0,400);
GrpCrusher.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(5982, 112);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(6046, 112);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(6110, 112);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(6174, 112);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(6238, 112);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(6430, 208);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(10206, 1136);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(10270, 1136);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(10334, 1136);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(10398, 1136);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(10462, 1136);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(10526, 1136);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(10590, 1136);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(10654, 1136);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(10718, 1136);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(10782, 1136);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(10846, 1136);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(10910, 1136);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(10974, 1136);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(5246, 1136);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(5310, 1136);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(5374, 1136);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(5438, 1136);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(5502, 1136);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(5566, 1136);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(5630, 1136);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(2878, 1136);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(2942, 1136);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(3006, 1136);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(3070, 1136);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(3134, 1136);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(3198, 1136);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(3262, 1136);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(3326, 1136);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(6142, 1136);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(6206, 1136);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(6270, 1136);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(6334, 1136);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(6398, 1136);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(6846, 1136);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(6910, 1136);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(6974, 1136);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(7038, 1136);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(7102, 1136);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(7166, 1136);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(7230, 1136);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(7294, 1136);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(7838, 1136);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(7902, 1136);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(7966, 1136);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(8030, 1136);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new JumpPad(8224, 640,_player1);
GrpJumpPad.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Spike(1394, 1197,_player1);
_enemies.add(obj);
MGrpObjects.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Spike(1362, 1197,_player1);
_enemies.add(obj);
MGrpObjects.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Spike(1330, 1197,_player1);
_enemies.add(obj);
MGrpObjects.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Spike(1298, 1197,_player1);
_enemies.add(obj);
MGrpObjects.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Spike(1426, 1197,_player1);
_enemies.add(obj);
MGrpObjects.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Spike(1234, 1197,_player1);
_enemies.add(obj);
MGrpObjects.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Spike(1266, 1197,_player1);
_enemies.add(obj);
MGrpObjects.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Spike(1202, 1197,_player1);
_enemies.add(obj);
MGrpObjects.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Spike(1170, 1197,_player1);
_enemies.add(obj);
MGrpObjects.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Spike(1138, 1197,_player1);
_enemies.add(obj);
MGrpObjects.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Spike(1106, 1197,_player1);
_enemies.add(obj);
MGrpObjects.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Spike(1074, 1197,_player1);
_enemies.add(obj);
MGrpObjects.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Spike(1042, 1197,_player1);
_enemies.add(obj);
MGrpObjects.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Spike(1010, 1197,_player1);
_enemies.add(obj);
MGrpObjects.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Spike(978, 1197,_player1);
_enemies.add(obj);
MGrpObjects.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Spike(946, 1197,_player1);
_enemies.add(obj);
MGrpObjects.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Spike(914, 1197,_player1);
_enemies.add(obj);
MGrpObjects.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Spike(882, 1197,_player1);
_enemies.add(obj);
MGrpObjects.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Spike(850, 1197,_player1);
_enemies.add(obj);
MGrpObjects.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Spike(818, 1197,_player1);
_enemies.add(obj);
MGrpObjects.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Spike(786, 1197,_player1);
_enemies.add(obj);
MGrpObjects.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Spike(754, 1197,_player1);
_enemies.add(obj);
MGrpObjects.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Spike(722, 1197,_player1);
_enemies.add(obj);
MGrpObjects.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Spike(690, 1197,_player1);
_enemies.add(obj);
MGrpObjects.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Spike(658, 1197,_player1);
_enemies.add(obj);
MGrpObjects.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Spike(626, 1197,_player1);
_enemies.add(obj);
MGrpObjects.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Spike(594, 1197,_player1);
_enemies.add(obj);
MGrpObjects.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new JumpPad(11360, 352,_player1);
GrpJumpPad.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(11358, 272);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(11358, 208);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(11358, 144);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(11358, 80);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(11358, 16);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Powerup(8965, 165);
GrpPowerup.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(8894, 144);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(8830, 144);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(8766, 144);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(8702, 144);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(8638, 144);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(8574, 144);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(8510, 144);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(8446, 144);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(8382, 144);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Powerup3(8094, 1136);
GrpPowerup3.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Enemy2(9056, 1184,_player1);
_enemies.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(6686, 560);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(6750, 560);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(6814, 560);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(6878, 560);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(6942, 560);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(7006, 560);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(7070, 560);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(7134, 560);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(7198, 560);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(7262, 560);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(11678, 144);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(11742, 144);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(11806, 144);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(11870, 144);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(11934, 144);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(11998, 144);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(12062, 144);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(12126, 144);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(12190, 144);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(12254, 144);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(12318, 144);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(12382, 144);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(12446, 144);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Health(11261, 393);
GrpHealth.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(10910, 400);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(10974, 400);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(11038, 400);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(10494, 400);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(10558, 400);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(10622, 400);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(10686, 400);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(10110, 400);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(10174, 400);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(10238, 400);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new JumpPad(10048, 448,_player1);
GrpJumpPad.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(9950, 240);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(9886, 240);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(9822, 240);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(9758, 240);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(9694, 240);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(9630, 240);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(9566, 240);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(9502, 240);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(9438, 240);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(9374, 240);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Health(9245, 233);
GrpHealth.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Crusher(11306, 1228,5,0,400);
GrpCrusher.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Portal(93, 237, 12200, 50, _player1);
			
			
			
				
									
GrpPortal.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(414, 176);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(414, 112);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(414, 48);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(446, 48);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(478, 48);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(510, 48);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(446, 112);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(446, 176);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(478, 112);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(510, 112);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(542, 112);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(542, 48);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(542, 176);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(510, 176);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(478, 176);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(574, 176);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(574, 112);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(574, 48);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(606, 48);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(606, 112);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(606, 176);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(670, 176);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(638, 176);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(638, 112);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(702, 112);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(670, 112);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(638, 48);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(670, 48);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(702, 48);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(702, 176);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(734, 176);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(734, 112);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(734, 48);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(766, 48);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(766, 176);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(766, 112);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(798, 176);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(798, 112);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(798, 48);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(830, 48);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(830, 112);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(830, 176);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(862, 176);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(862, 112);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(862, 48);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(894, 176);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(926, 176);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(894, 112);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(894, 48);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(926, 48);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(926, 112);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(958, 112);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(958, 48);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(990, 112);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(1022, 112);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(1054, 112);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(958, 176);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(990, 176);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(1022, 176);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(1054, 176);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(990, 48);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(1022, 48);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(1054, 48);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(1086, 48);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(1118, 48);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(1150, 48);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(1182, 48);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(1214, 48);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(1246, 48);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(1278, 48);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(1310, 48);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(1342, 48);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(1374, 48);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(1470, 48);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(1438, 48);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(1406, 48);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(1086, 112);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(1086, 176);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(1118, 176);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(1150, 176);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(1182, 176);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(1246, 176);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(1406, 176);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(1470, 176);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(1566, 176);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(1534, 176);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(1502, 176);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(1502, 48);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(1534, 48);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(1598, 48);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(1118, 112);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(1150, 112);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(1182, 112);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(1214, 112);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(1246, 112);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(1278, 112);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(1342, 112);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(1374, 112);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(1406, 112);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(1438, 112);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(1502, 112);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(1470, 112);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(1534, 112);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(1438, 176);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(1310, 176);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(1310, 112);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(1342, 176);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(1374, 176);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(1278, 176);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(1214, 176);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(1566, 48);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(1566, 112);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(1598, 176);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(1598, 112);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(1630, 48);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(1630, 112);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(1630, 176);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(1662, 176);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(1662, 112);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(1662, 48);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(1726, 176);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(1726, 112);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(1726, 48);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(1758, 48);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(1790, 48);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(1822, 48);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(1822, 112);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(1822, 176);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(1790, 176);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(1790, 112);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(1758, 112);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(1758, 176);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(1694, 176);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(1694, 112);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(1694, 48);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Portal(9309, 269, 1250,50, _player1);
			
			
					
								
									
GrpPortal.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Portal(7325, 525,12627, 800,_player1);
GrpPortal.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Abyss(11952, 1232);
GrpAbyss.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Abyss(11792, 1232);
GrpAbyss.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Abyss(11632, 1232);
GrpAbyss.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Abyss(12112, 1232);
GrpAbyss.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Abyss(12240, 1232);
GrpAbyss.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
	

//==================================FLAN CODE END MAP 101=================================
//====================================================================

}

if(MapNumber == 102) {
	  	  



				_map102 = new Map102;
	FlxG.playMusic(MusTheme1,1);

				

				_Map102Background = new Map102Background;
			FlxG.state.add(_Map102Background);
				
	    
		       //    this.add(_mapflan.layerFaraway);
           // this.add(_map101.layerBackground);
            this.add(_map102.layerMap);
			   
		
				_Map102Elements = new Map102Elements;
			FlxG.state.add(_Map102Elements);
				
						add(_player1);
	

				_Map102Foreground = new Map102Foreground;
				FlxG.state.add(_Map102Foreground);
				//this.add(_map101.layerForeground)


// TEST

//==================================FLAN CODE START MAP 102=================================
//====================================================================
		
			
			obj = new Coin(2656, 512);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(2720, 512);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(2784, 512);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(2848, 512);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(2912, 512);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(2976, 512);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(11104, 608);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(11168, 608);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(11232, 608);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(11296, 608);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(11360, 608);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(11424, 608);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(11488, 608);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(11552, 608);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(11616, 608);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(11680, 608);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Enemy1(12432, 624,_player1);
_enemies.add(obj);
MGrpObjects.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Enemy1(12240, 624,_player1);
_enemies.add(obj);
MGrpObjects.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Enemy1(12336, 624,_player1);
_enemies.add(obj);
MGrpObjects.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Enemy1(9872, 592,_player1);
_enemies.add(obj);
MGrpObjects.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Enemy1(10000, 592,_player1);
_enemies.add(obj);
MGrpObjects.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Enemy1(10096, 592,_player1);
_enemies.add(obj);
MGrpObjects.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Enemy1(10192, 592,_player1);
_enemies.add(obj);
MGrpObjects.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Enemy1(6800, 624,_player1);
_enemies.add(obj);
MGrpObjects.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Enemy1(4400, 624,_player1);
_enemies.add(obj);
MGrpObjects.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Enemy1(4592, 624,_player1);
_enemies.add(obj);
MGrpObjects.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Enemy1(4816, 624,_player1);
_enemies.add(obj);
MGrpObjects.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Enemy1(4144, 496,_player1);
_enemies.add(obj);
MGrpObjects.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Exit(12688, 624);
GrpExit.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Powerup2(12640, 352);
GrpPowerup2.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Powerup2(12448, 352);
GrpPowerup2.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Powerup(12549, 357);
GrpPowerup.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(5248, 192);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(5312, 192);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(5376, 192);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(5440, 192);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(5504, 192);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(5568, 192);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(5632, 192);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(5696, 192);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(5760, 192);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(5824, 192);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(5888, 192);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(5312, 384);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(5376, 384);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(5440, 384);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(5504, 384);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(5568, 384);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(5632, 384);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(5696, 384);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(5760, 384);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(5824, 384);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(5888, 384);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(5952, 384);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(5952, 192);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(6016, 192);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(6080, 192);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(6144, 192);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(6016, 384);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(6080, 384);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(6144, 384);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(6208, 384);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(7840, 608);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(7872, 576);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(7904, 544);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(7936, 512);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(7968, 480);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(8000, 448);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(8032, 416);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Enemy2(12384, 352,_player1);
_enemies.add(obj);
MGrpObjects.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Enemy2(12288, 352,_player1);
_enemies.add(obj);
MGrpObjects.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Enemy2(12192, 352,_player1);
_enemies.add(obj);
MGrpObjects.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Enemy2(1664, 480,_player1);
_enemies.add(obj);
MGrpObjects.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Enemy2(1792, 480,_player1);
_enemies.add(obj);
MGrpObjects.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Enemy2(1920, 480,_player1);
_enemies.add(obj);
MGrpObjects.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Enemy2(3712, 448,_player1);
_enemies.add(obj);
MGrpObjects.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Enemy2(9184, 384,_player1);
_enemies.add(obj);
MGrpObjects.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Enemy2(9280, 384,_player1);
_enemies.add(obj);
MGrpObjects.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Enemy2(9376, 384,_player1);
_enemies.add(obj);
MGrpObjects.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Enemy2(9152, 608,_player1);
_enemies.add(obj);
MGrpObjects.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Runner(12928, 768,_player1);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Runner(12960, 608,_player1);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Runner(13600, 672,_player1);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Runner(13696, 448,_player1);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Runner(14304, 224,_player1);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Runner(14464, 256,_player1);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Runner(15008, 96,_player1);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Runner(15072, 352,_player1);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Runner(15136, 640,_player1);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Key(12701, 242);
GrpKey.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Door(8066, 505);
GrpDoor.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
		

//==================================FLAN CODE END= MAP 102================================
//====================================================================

}

		




if(MapNumber==103){  



			_Map103Background = new Map103Background;
			FlxG.state.add(_Map103Background);
				
	      _map103 = new  Map103();
				this.add(_map103.layerMap); 
		
				add(_player1);
			_Map103Foreground = new Map103Foreground;
		add(_Map103Foreground);


//==================================FLAN CODE START MAP 103=================================
//====================================================================
		
	
			obj = new Runner(13600, 672,_player1);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Runner(13696, 448,_player1);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Runner(14304, 224,_player1);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Runner(14464, 256,_player1);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Runner(14508, 639,_player1);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Runner(15392, 917,_player1);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Runner(15296, 305,_player1);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Runner(15939, 683,_player1);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Runner(11350, 168,_player1);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Runner(8636, 210,_player1);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Runner(5089, 846,_player1);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Runner(5102, 338,_player1);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Runner(1145, 200,_player1);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(608, 512);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(672, 512);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Coin(736, 512);
GrpCoins.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Powerup(2693, 165);
GrpPowerup.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Powerup(2629, 165);
GrpPowerup.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Powerup(2565, 165);
GrpPowerup.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Health(2336, 160);
GrpHealth.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Health(2272, 160);
GrpHealth.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Health(2208, 160);
GrpHealth.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Powerup2(1728, 256);
GrpPowerup2.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Powerup3(2016, 480);
GrpPowerup3.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Powerup2(896, 320);
GrpPowerup2.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Powerup2(992, 320);
GrpPowerup2.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Spike(3040, 576,_player1);
_enemies.add(obj);
MGrpObjects.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Spike(3104, 576,_player1);
_enemies.add(obj);
MGrpObjects.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Spike(3168, 576,_player1);
_enemies.add(obj);
MGrpObjects.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Spike(3232, 576,_player1);
_enemies.add(obj);
MGrpObjects.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Spike(3296, 576,_player1);
_enemies.add(obj);
MGrpObjects.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Spike(3360, 576,_player1);
_enemies.add(obj);
MGrpObjects.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Spike(3424, 576,_player1);
_enemies.add(obj);
MGrpObjects.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Spike(3488, 576,_player1);
_enemies.add(obj);
MGrpObjects.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Spike(3616, 576,_player1);
_enemies.add(obj);
MGrpObjects.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Spike(3744, 576,_player1);
_enemies.add(obj);
MGrpObjects.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Spike(3872, 576,_player1);
_enemies.add(obj);
MGrpObjects.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Exit(48, 528);
GrpExit.add(obj);
;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Enemy2(5344, 256,_player1);
_enemies.add(obj);
MGrpObjects.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Enemy2(5504, 256,_player1);
_enemies.add(obj);
MGrpObjects.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Enemy2(12480, 160,_player1);
_enemies.add(obj);
MGrpObjects.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Enemy1(7664, 400,_player1);
_enemies.add(obj);
MGrpObjects.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Enemy1(8816, 464,_player1);
_enemies.add(obj);
MGrpObjects.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Enemy1(8592, 464,_player1);
_enemies.add(obj);
MGrpObjects.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Enemy1(8688, 464,_player1);
_enemies.add(obj);
MGrpObjects.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Enemy1(11856, 432,_player1);
_enemies.add(obj);
MGrpObjects.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Enemy1(12176, 432,_player1);
_enemies.add(obj);
MGrpObjects.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Spike(6560, 576,_player1);
_enemies.add(obj);
MGrpObjects.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Spike(6656, 576,_player1);
_enemies.add(obj);
MGrpObjects.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new MovableBlock(9256, 552);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new MovableBlock(10280, 552);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Key(12320, 96);
GrpKey.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Door(7744, 320);
GrpDoor.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Door(7584, 320);
GrpDoor.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Door(192, 352);
GrpDoor.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Door(224, 352);
GrpDoor.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Powerup3(5431, 260);
GrpPowerup3.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Key(7648, 544);
GrpKey.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Key(7680, 544);
GrpKey.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Key(7712, 544);
GrpKey.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Powerup2(12576, 160);
GrpPowerup2.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Powerup3(12512, 160);
GrpPowerup3.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Powerup(12453, 165);
GrpPowerup.add(obj);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
		
	
//==================================FLAN CODE END= MAp103================================
//====================================================================

		
//==================================FLAN CODE END= MAp103================================
//====================================================================


}

if(MapNumber==104){
	FlxG.playMusic(MusBoss1,1);
				_Map199Background = new Map199Background;
				FlxG.state.add(_Map199Background);
				
	      _map199 = new  Map199();
		       //    this.add(_mapflan.layerFaraway);
            this.add(_map199.layerBackground);
            this.add(_map199.layerMap);
			   
		
						add(_player1);
					_Map199Foreground = new Map199Foreground;
				FlxG.state.add(_Map199Foreground);
				this.add(_map199.layerForeground)

				
				
				
				
				
				
				
				
				
				
				
				
				//===================FLAN 10 4 =========================================
				
				
			
			obj = new Runner(13696, 448,_player1);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Runner(14304, 224,_player1);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Runner(15392, 917,_player1);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Runner(15296, 305,_player1);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Runner(15939, 683,_player1);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Runner(8636, 210,_player1);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Runner(5089, 846,_player1);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
			obj = new Runner(5102, 338,_player1);;
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
	// ======================================================== FLAN 104  !=$ ENDE !=)===============================						
				//Boss beginnt hier
	obj = new Boss1(120 * FlxG.tilesize,	600,_player1);
		 _Boss1 = obj;
		 
_enemies.add(_Boss1);
MGrpObjects.add(_Boss1);
		
//_enemies.add(obj);
//MGrpObjects.add(obj);
			obj.x+=obj.offset.x;
			obj.y+=obj.offset.y;
			FlxG.state.add(obj);
			if(onAddCallback != null)
				onAddCallback(obj);
				
				
				
				
				//===================
//=============================================================== FLAN 104 ENDE =============================
			 
	 var frame:FlxSprite = new FlxSprite(280,650);
frame.createGraphic(2.5,25); //White frame for the health bar
frame.scrollFactor.x = frame.scrollFactor.y = 0;
FlxG.state.add(frame);

var inside:FlxSprite = new FlxSprite(280,650);
inside.createGraphic(2.5,25,0xff000000); //Black interior, 48 pixels wide
inside.scrollFactor.x = inside.scrollFactor.y = 0;
FlxG.state.add(inside);





 bar = new FlxSprite(280,650);
bar.createGraphic(2.5,25,0xffff0000); //The red bar itself
bar.scrollFactor.x = bar.scrollFactor.y = 0;
bar.origin.x = bar.origin.y = 0; //Zero out the origin
bar.scale.x = 100; //Fill up the health bar all the way
FlxG.state.add(bar);


			

}










	
			
/*=================================HUD=====================================================================*/


//Leftside HUD BG
HUDBG = new FlxSprite;
	HUDBG.loadGraphic(ImgHUDBG, false, false, 1024,768);
	HUDBG.x = 0;
	HUDBG.y = 0;
	HUDBG.scrollFactor.x = HUDBG.scrollFactor.y = 0;
	HUDBG.drag.x = 0;
	HUDBG.drag.y = 0;
	HUDBG.maxVelocity.x = 0;
	HUDBG.maxVelocity.y = 0;
	HUDBG.fixed = true;
	HUDBG.moves = false;	
	HUDBG.solid = false;
add(HUDBG);	

//Right side HUD Background
//HUDBGR = new FlxSprite;
//	HUDBGR.loadGraphic(ImgHUDBGR , false, false,768,1024);
//	HUDBGR.x = 0;
//	HUDBGR.y = 0;
//	HUDBGR.scrollFactor.x = HUDBGR.scrollFactor.y = 0;
//	HUDBGR.moves = false;	
//	HUDBGR.drag.y = 0;
//	HUDBGR.maxVelocity.x = 0;
//	HUDBGR.maxVelocity.y = 0;
//	HUDBGR.fixed = true;
//	HUDBGR.solid = false;
//add(HUDBGR);	

beard = new FlxSprite;
beard.loadGraphic(ImgBeard, false, false);
add(beard);





// HUD Texte
	var tx:FlxText;
/*=====Copyright================*/
/*
		
			tx = new FlxText(2,0,FlxG.width,"(c) 2010 Marcel Flaig");
			tx.scrollFactor.x = tx.scrollFactor.y = 0;
			tx.color = 0x000000;
			tx.shadow = 0xffffff;

			add(tx);
*/
/*=====Missionstatus================*/	

			tx = new FlxText(2,FlxG.height-12,FlxG.width," Collect All Coins and find the Exit!");
			tx.scrollFactor.x = tx.scrollFactor.y = 0;
			tx.color = 0xffffff;
			//tx.size = 7;
		
			add(tx);
			
/*=====Score=======================*/						
			score = new FlxText(450, 0, FlxG.width);
			score.color = 0x464646;
			score.shadow = 0xffffffff;
			score.text = "" +(FlxG.score);
			score.scrollFactor.x = score.scrollFactor.y = 0;
			score.size = 24;
			add(score);

		HealthStatus1 = new FlxSprite;
		HealthStatus1.loadGraphic(ImgHealth, false,false);
		HealthStatus1.x = 850;
		HealthStatus1.y = 1;
	//HealthStatus1.scale.x = 2;
	//HealthStatus1.scale.y = 2 ;
		HealthStatus1.scrollFactor.x = HealthStatus1.scrollFactor.y = 0;
		HealthStatus1.drag.x = 0;
		HealthStatus1.drag.y = 0;
		HealthStatus1.maxVelocity.x = 0;
		HealthStatus1.maxVelocity.y = 0;
		HealthStatus1.fixed = true;
	add(HealthStatus1);
	
	
	
	HealthStatus2 = new FlxSprite;
				HealthStatus2.loadGraphic(ImgHealth, false,false);
		HealthStatus2.x = 870;
			HealthStatus2.y = 1;
		//		HealthStatus2.scale.x = 2;
		//HealthStatus2.scale.y = 2 ;
			HealthStatus2.scrollFactor.x = HealthStatus2.scrollFactor.y = 0;
						HealthStatus2.drag.x = 0;
HealthStatus2.drag.y = 0;
HealthStatus2.maxVelocity.x = 0;
HealthStatus2.maxVelocity.y = 0;
HealthStatus2.fixed = true;
	add(HealthStatus2);
	
	
	
	
		HealthStatus3 = new FlxSprite;
		HealthStatus3.loadGraphic(ImgHealth, false,false);
		HealthStatus3.x = 890;
		HealthStatus3.y = 1;
//				HealthStatus3.scale.x = 2;
	//	HealthStatus3.scale.y = 2 ;
		HealthStatus3.scrollFactor.x = HealthStatus3.scrollFactor.y = 0;
		HealthStatus3.drag.x = 0;
		HealthStatus3.drag.y = 0;
		HealthStatus3.maxVelocity.x = 0;
		HealthStatus3.maxVelocity.y = 0;
		HealthStatus3.fixed = true;
		
		add(HealthStatus3);
	
		
		
		HealthStatus4 = new FlxSprite;
		HealthStatus4.loadGraphic(ImgHealth,false,false);
		HealthStatus4.x = 910;
		HealthStatus4.y = 1;
		//HealthStatus4.scale.x = 2;
		//HealthStatus4.scale.y = 2 ;
		HealthStatus4.scrollFactor.x = HealthStatus4.scrollFactor.y = 0;
		HealthStatus4.drag.x = 0;
		HealthStatus4.drag.y = 0;
		HealthStatus4.maxVelocity.x = 0;
		HealthStatus4.maxVelocity.y = 0;
		HealthStatus4.fixed = true;
		add(HealthStatus4);
		
		
		HealthStatus5 = new FlxSprite;
		HealthStatus5.loadGraphic(ImgHealth, false,false);
		HealthStatus5.x = 930;
		HealthStatus5.y = 1;
		//HealthStatus5.scale.x = 2;
	//	HealthStatus5.scale.y = 2 ;
		HealthStatus5.scrollFactor.x = HealthStatus5.scrollFactor.y = 0;
		HealthStatus5.drag.x = 0;
		HealthStatus5.drag.y = 0;
		HealthStatus5.maxVelocity.x = 0;
		HealthStatus5.maxVelocity.y = 0;
		HealthStatus5.fixed = true;
		add(HealthStatus5);
		
		
		HealthStatus6 = new FlxSprite;
		HealthStatus6.loadGraphic(ImgHealth, false,false);
		HealthStatus6.x = 950;
		HealthStatus6.y = 1;
	//	HealthStatus6.scale.x = 2;
	//	HealthStatus6.scale.y = 2 ;
		HealthStatus6.scrollFactor.x = HealthStatus6.scrollFactor.y = 0;
		HealthStatus6.drag.x = 0;
HealthStatus6.drag.y = 0;
HealthStatus6.maxVelocity.x = 0;
HealthStatus6.maxVelocity.y = 0;
HealthStatus6.fixed = true;
	add(HealthStatus6);
	
	
	
	HUDKey1 = new FlxSprite;
	HUDKey1.loadGraphic(ImgHudkey, true, true);
	HUDKey1.x = 550;
	HUDKey1.y = 450;
HUDKey1.scrollFactor.x = HUDKey1.scrollFactor.y = 0;
HUDKey1.visible = false;
HUDKey1.moves = false;	

add(HUDKey1);
	
			HUDKey2 = new FlxSprite;
	HUDKey2.loadGraphic(ImgHudkey, true, true);
HUDKey2.x = 600;
	HUDKey2.y = 450;
	
HUDKey2.scrollFactor.x = HUDKey2.scrollFactor.y = 0;
HUDKey2.visible = false;
HUDKey2.moves = false;	
	add(HUDKey2);
	
	
	


HUDPowerup1 = new FlxSprite;
	HUDPowerup1.loadGraphic(ImgHUDPowerup1, true, true); // DAS ROte
	HUDPowerup1.x = 250;
	HUDPowerup1.y = 5;	
	HUDPowerup1.scrollFactor.x = HUDPowerup1.scrollFactor.y = 0;
	HUDPowerup1.visible = false;
	HUDPowerup1.moves = false;
	HUDPowerup1.drag.x = 0;
	HUDPowerup1.drag.y = 0;
	HUDPowerup1.maxVelocity.x = 0;
	HUDPowerup1.maxVelocity.y = 0;
	HUDPowerup1.fixed = true;
	HUDPowerup1.solid = false;
add(HUDPowerup1);
	
	
		 
HUDPowerup2 = new FlxSprite;
	HUDPowerup2.loadGraphic(ImgHUDPowerup2, true, true);
	HUDPowerup2.x = 350;
	HUDPowerup2.y = 5;
	
HUDPowerup2.scrollFactor.x = HUDPowerup2.scrollFactor.y = 0;
HUDPowerup2.visible = false;
HUDPowerup2.moves = false;
		HUDPowerup2.drag.x = 0;
HUDPowerup2.drag.y = 0;
HUDPowerup2.maxVelocity.x = 0;
HUDPowerup2.maxVelocity.y = 0;
HUDPowerup2.fixed = true;
HUDPowerup2.solid = false;
	add(HUDPowerup2);	
	
				HUDPowerup3 = new FlxSprite;
	HUDPowerup3.loadGraphic(ImgHUDPowerup3, true, true);
HUDPowerup3.x = 450;
	HUDPowerup3.y = 5;
	
HUDPowerup3.scrollFactor.x = HUDPowerup3.scrollFactor.y = 0;
HUDPowerup3.visible = false;
HUDPowerup3.moves = false;
		HUDPowerup3.drag.x = 0;
HUDPowerup3.drag.y = 0;
HUDPowerup3.maxVelocity.x = 0;
HUDPowerup3.maxVelocity.y = 0;
HUDPowerup3.fixed = true;
HUDPowerup3.solid = false;
	add(HUDPowerup3);
	
	
	

	
/*=====Playerposition================*/

//			Display The Playersposition (X/Y) on Screen
				
		/*	playerpos = new FlxText(22,80,FlxG.width);
       			playerpos.shadow = 0xff000000;
			playerpos.text = ("This shows X and Y when updated" +_player1.x+_player1.y);
			playerpos.scrollFactor.x = playerpos.scrollFactor.y = 0;

			add(playerpos);
		

			

*/


//=================================Create Groups and add objects==================================================================	

 //add gibs + bullets to scene here, so they're drawn on top of pretty much everything
add(_botBullets);

_enemies.add(_botBullets);
_enemies.add(_spawners);
_enemies.add(_bots);
_enemies.add(_enemy);
_enemies.add(bot1);



MGrpObjects.add(_botBullets);
MGrpObjects.add(_bullets);
MGrpObjects.add(_bullets2);
//MGrpObjects.add(_bots);
//MGrpObjects.add(_player);
MGrpObjects.add(_player1);  //NEU
//MGrpObjects.add(_littleGibs);
//MGrpObjects.add(_bigGibs);



//MGrpObjects.add(_enemy);
//MGrpObjects.add(bot1);


add(EmrCoins);
MGrpObjects.add(EmrCoins);


/*Add Gruppen für die einzelnen objekte */
add(_spawners);
add(_littleGibs);
add(_bigGibs);
add(_bots);

// Aus update
//		_player1.collide(_map101.layerMap); 
//		_enemies.collide(_map101.layerMap);
//		_player1.collide(MGrpObjects);
//		MGrpObjects.collide(_map101.layerMap)

//MGrpObjects.add(_player1);
MGrpObjects.add(_map101.layerMap);



/*=====scorebonustext===============*/	

	
			


}
		
				





/*=================================Update=====================================================================*/

override public function update():void
		{
		
					if (MapNumber == 101) { 
				
		//_bullets.(_map101.layerMap);
		//_bullets2.collide(_map101.layerMap);

		_bullets.collide(_map101.layerMap);
		_player1.collide(GrpMovableBlock);
		_player1.collide(_map101.layerMap);
	GrpMovableBlock.collide(_map101.layerMap);
		_enemies.collide(_map101.layerMap);
		//FlxU.collide(MGrpObjects,MGrpObjects);
		MGrpObjects.collide(MGrpObjects);
		beard.x = _player1.x +25;
		beard.y = _player1.y +70;
		
}
		
	//		if (MapNumber == 102) { 
				
		//_bullets.collide(_map102.layerMap);
	//	_bullets2.collide(_map102.layerMap);
		/*	_player1.collide(_map102.layerMap);
				_enemies.collide(_map102.layerMap);
}
			if (MapNumber == 103) { 
				
		_bullets.collide(_map103.layerMap);
		_bullets2.collide(_map103.layerMap);
			_player1.collide(_map103.layerMap); 
				_enemies.collide(_map103.layerMap);
}*/

			if (MapNumber == 104)
			
			{ 
				
				//	_player1.collide(_map199.layerMap); 
				//	_enemies.collide(_map199.layerMap);
				
				//		_bullets.collide(_map199.layerMap);
				//		_bullets2.collide(_map199.layerMap);
							
							
							
			bar.scale.x = _Boss1.health; //Drop the health bar to half
	
				
				if (lastquake > 1 ) 
				{
					
					  lastquake -= 1*FlxG.elapsed; 
					
						//_player.scale.x = 10;
				}
					if (lastquake <= 150 ) 
				{ 
										_player1.scale.x = 1;

						//_player.scale.x = 10;
				}
				
			
				if (lastquake <= 1 )
				{ 		
					_player1.scale.x = 10;
					FlxG.quake.start(0.015, 1);
					lastquake = 200;
				// FLash in ROT     FlxG.flash.start(0xf0CD0000,2,null,true);
						FlxG.flash.start(0xffffffff, 2,null,true);
				}
			
			}
			

		
	

			//	playerpos.text = ("Player X: " +_player1.x + "Player Y" +_player1.y);
				
			
			score.text = "" +(FlxG.score);
		
			
			FlxG.follow(_player1,2.5);
    		//FlxG.follow(_player1);
			// ROckelt	FlxG.followAdjust(0.5, 0.5);
			//FlxG.followBounds(1,1,640-1,480-1);
			//FlxG.followBounds(1,1,500*32-1,20*32-1); //* X / Y ANZAHL TILES!!! AIF MAÜP ANPÜASSEN // So wars vor JUMPAD
			FlxG.followBounds(-100000,-10000000,900000*32,40*32-1); // Fantasiwerte
			
			
			//Check if player collected a coin or coins this frame
			FlxU.overlap(GrpCrusher, _player1, getCrusher);
			FlxU.overlap(GrpJumpPad, _player1, getJumpPad);
			FlxU.overlap(GrpCoins, _player1, getCoin);
			FlxU.overlap(GrpKey, _player1, getKey);
			FlxU.overlap(GrpDoor,_player1,getDoor);
			FlxU.overlap(GrpPowerup, _player1, getPowerup);
			FlxU.overlap(GrpPowerup2, _player1, getPowerup2);
			FlxU.overlap(GrpPowerup3, _player1, getPowerup3);
			FlxU.overlap(GrpExit, _player1, getExit);
			FlxU.overlap(GrpSpecialbox,_player1,getSpecialbox);
			FlxU.overlap(GrpHealth,_player1,getHealth);
			FlxU.overlap(_enemies,_player1,overlapped);//Standard Gegner Kollision weil probloeme mit collide()
			FlxU.overlap(_bullets,_enemies,overlapped);//Kollision Gegner mit Schuss
			FlxU.overlap(GrpAbyss, _player1, getAbyss);
			FlxU.overlap(GrpPortal, _player1,getPortal);
			//collide(); // verursacht einen komischen bug von x 8780 - 925 y 0 deshalb _player1.collide(map101.layermap)
			
					
			// VErsuch den Bug mit dem Schuss zu beheben
		//	_bullets.collide();
	//		_bullets2.collide();
				
		
		//	_bullets.collide(coins);
		/*	_bullets.collide(GrpKey);
			_bullets.collide(GrpDoor);
			_bullets.collide(GrpPowerup);
			_bullets.collide(GrpPowerup2);
			_bullets.collide(GrpPowerup3);
			_bullets.collide(GrpExit);
			_bullets.collide(GrpSpecialbox);
			_bullets.collide(GrpCoins);
			_bullets.collide(GrpHealth);
			_bullets.collide(_bullets);
		*/	// versucxh ende
			
			
			
	if (FlxG.keys.justReleased("ENTER"))
	
	{
/*		var i:uint = 0;
		for(i = 0; i < coins.members.length; i++)
{
coins.kill();
coins.destroy();
coins.remove(coins);
}*/

FlxG.resetInput();
FlxG.state.destroy();
//FlxObject.coins.destroy();
//FlxObject.coins.kill();


	//	GrpKey.length = 0;
		this._player1.destroy();
		this._player1.kill();
		this.EmrCoins.destroy();
		this.EmrCoins.kill();
		
		this._enemies.kill();
		this._enemies.destroy();
		//this._enemy.kill();
		//this._enemy.destroy();
		this.GrpKey.kill();
		this.destroy();
		this._bigGibs.destroy();
		this._bigGibs.kill();
		this.MGrpObjects.destroy();
		this.MGrpObjects.kill();
		this._botBullets.destroy();
		this._botBullets.kill();
		this.GrpCoins.destroy();
		this.GrpCoins.kill();
		this.EmrCoins.destroy();

		this.EmrCoins.kill();
		this.HUDBG.kill();
		this.HUDBG.destroy();
	//	this.HUDBGR.kill();
	//	this.HUDBGR.destroy();
		
		this.HealthStatus1.kill();
		this.HealthStatus1.destroy();
		
		this.HealthStatus2.kill();
		this.HealthStatus2.destroy();
		
		this.HealthStatus3.kill();
		this.HealthStatus3.destroy();	
		
		this.HealthStatus4.kill();
		this.HealthStatus4.destroy();		
		
		this.HealthStatus5.kill();
		this.HealthStatus5.destroy();		
		
		this.HealthStatus6.kill();
		this.HealthStatus6.destroy();
		
		
		

		
		
		
		
		
		
		
		
		
		// DIe GROps fehelen noch wi3e GrpKey oder GRp Door
	//	this.Spawner1.destroy();
		
		

		
		
		if (MapNumber>=105){
			//MapNumber = MapNumber + 1;
			//this.destroy();

			FlxG.state = new WinState;
			MapNumber = 101;
		return;
		}
		else 
				MapNumber = MapNumber + 1;
				
			
		

			
			//====== KILL & DESTROY ========================================================
					
	
	if (MapNumber==101){
				
			//_Map199Background.destroy();
			//	_Map199Foreground.destroy();
			}
		if (MapNumber==102){
				
		_Map101Background.destroy();
		_Map101Background.kill();
		
		_Map101Foreground.destroy();
		_Map101Foreground.kill();
		
		_Map101Elements.destroy();	
		_Map101Elements..kill();
		
		_map101.mainLayer.destroy();
		_map101.mainLayer.kill();
						
		_map101.layerMap.destroy();
		_map101.layerMap.kill();
		
		this._Map101Background.destroy();
		this._Map101Background.kill();
		
		this._Map101Foreground.destroy();
		this._Map101Foreground.kill();
		
		this._Map101Elements.destroy();	
		this._Map101Elements.kill();
		
		this._map101.mainLayer.destroy();
		this._map101.mainLayer.kill();
						
		this._map101.layerMap.destroy();
		this._map101.layerMap.kill();
		
	//	_map101.layerForeground.destroy();
	//	_map101.layerBackground.destroy();
	//	_map101.layerFaraway.destroy();
			
		

		
		
				
			}

		if (MapNumber==103){
				
		this._Map102Background.destroy();
		this._Map102Background.kill();
		
		this._Map102Foreground.destroy();
		this._Map102Foreground.kill();
		
	
		
		this._map102.mainLayer.destroy();
		this._map102.mainLayer.kill();
						
		this._map102.layerMap.destroy();
		this._map102.layerMap.kill();
						
		_Map102Background.destroy();
		_Map102Background.kill();
		
	_Map102Foreground.destroy();
	_Map102Foreground.kill();
		
	
		
	_map102.mainLayer.destroy();
		_map102.mainLayer.kill();
						
		_map102.layerMap.destroy();
	_map102.layerMap.kill();
			}

	

			
		
				
			
				FlxG.state.destroy();
				FlxG.state = new PlayState;
		
		
				return;
		
		
			}
			
			// ===================================HUD=============================================
				
			
			//Health
			if (_player1.health <60)  HealthStatus1.visible = false;
			if (_player1.health < 50) HealthStatus2.visible = false;
			if (_player1.health < 40) HealthStatus3.visible = false;
			if (_player1.health < 30) HealthStatus4.visible = false;
			if (_player1.health < 20) HealthStatus5.visible = false;
			if (_player1.health <10)  HealthStatus6.visible = false;
			if (_player1.health >60)  HealthStatus1.visible = true;
			if (_player1.health > 50) HealthStatus2.visible = true;
			if (_player1.health > 40) HealthStatus3.visible = true;
			if (_player1.health > 30) HealthStatus4.visible = true;
			if (_player1.health > 20) HealthStatus5.visible = true;
			if(_player1.health > 10)  HealthStatus6.visible = true;
			
			
			//Keys Max 2
			if (hasKey == 1) { 
				HUDKey1.visible = false;
				HUDKey2.visible = true;}
	
			if (hasKey == 2) { 
				HUDKey1.visible = true;
				HUDKey2.visible = true;}
		
			if (hasKey == 0) { 
				HUDKey1.visible = false;
				HUDKey2.visible = false;}
		
		
			//================================================ HUD CHECK für POWER UP 1-3==============================
			
			if (_player1.hasPowerup == true) { 
			HUDPowerup1.visible = true;
			}
					if (_player1.hasPowerup == false) { 
			HUDPowerup1.visible = false;
			}
			
			
			
					if (_player1.Powerup2Timer > 500) { 
			HUDPowerup2.visible = true;
			}
					if (_player1.Powerup2Timer <= 500) { 
			HUDPowerup2.visible = false;
			}
			
			// der Teil mit FLXg.scale gehört eigentlich nicht ins HUD
			
					if (_player1.Powerup3Timer > 1500) { 
			HUDPowerup3.visible = true;
			FlxG.timeScale = 0.5; //Everything moves at half speed now
			FlxG.play(SndSlowdown);
			}
					if (_player1.Powerup3Timer <= 1500) { 
			HUDPowerup3.visible = false;
						FlxG.timeScale = 1; //Everything moves at half speed now

			}
			
			// ====================== HUD PowerUPS Ende ============================
			
			
			
			
			
			
			
			super.update();
			
			
		}



//Displkacers
/* override public function preProcess():void
{
//do nothing, we're drawing a BG so the extra screen clear isn't necessary
}
override public function render():void
{
super.render();
FXGroup.doRender();
}
*/
//Displacers ende



/*=======================================================================================================
=========================================================================================================
=========================================================================================================
=========================================================================================================
=======================================================================================================*/

		
		
/*=================================Check Overlap==================================================================*/
	
 protected function overlapped(Object1:FlxObject,Object2:FlxObject):void
{
if((Object1 is BotBullet) || (Object1 is Bullet))
Object1.kill();
Object2.hurt(1);
}



/*=================================Get Coin=====================================================================*/


 public function getCoin(Coin:FlxSprite,Player:FlxSprite):void
{
	Coin.kill();
	//score.text = "SCORE: " + (coins.countDead() * 100);
	FlxG.play(SndCoin);
	FlxG.score = FlxG.score + 100;
//	if(coins.countLiving() == 0)
	//	{
			//status.text = "Find the exit.";
		//	exit.exists = true;
	//		FlxG.play(SndWin);
	//	}
	
	TxtScore = new FlxText(300,30,FlxG.width,"");
			
			TxtScore.color = 0xff4040;
			TxtScore.size = 15;
			TxtScore.visible = false;
			add(TxtScore);
			TxtScore.x = _player1.x;
			TxtScore.y = _player1.y;
			TxtScore.visible = true ;
			TxtScore.text = "100";
	
	TxtScore.update();
	TweenMax.to(TxtScore, 5, { x:_player1.x-(1024/2), y:_player1.y-3000, alpha:1.7,delay:0,repeat:0,yoyo:true});
	
	
}

 public function getKey(Key:FlxSprite,Player:FlxSprite):void
{
	Key.kill();

	FlxG.play(SndCoin);
	FlxG.score = FlxG.score + 1000;
hasKey = hasKey+1;
}

 public function getDoor(Door:FlxSprite,Player:FlxSprite):void
{
	if(hasKey > 0)            {
	Door.kill();
	hasKey = hasKey-1;                    }
}


 public function getCrusher(MovingBlock:FlxSprite,Player:FlxSprite):void
{
	//_player1.health = _player1.health -30 ;
	_player1.hurt(30);
}


 public function getJumpPad(ThisJumpPad:FlxSprite,Player:FlxSprite):void
{
	
	//_player1.acceleration.x = _player1.acceleration.x * 1.5;
	//_player1.acceleration.y = -_player1.acceleration.y * 1.5 ;
	      //       _player1.acceleration.y = _player.acceleration.y * 2
		    //     _player1.acceleration.x = _player.acceleration.x * 1.5
		//	hasJumpPad = true;
				_player1.velocity.y = -_player1.acceleration.y;
					//_player1.play("jump");
					FlxG.play(SndJumpPad);
					ThisJumpPad.play("dead");
}

 public function getAbyss(Abyss:FlxSprite,Player:FlxSprite):void
{
	//_player1.health -= 1000000
	//Abyss.kill();
	_player1.hurt(1000000);
}

 public function getPortal(ThisPortal:Portal,Player:FlxSprite):void
{
	if(ThisPortal.stay==false){ThisPortal.kill();}
	//ThisPortal.doport = true;
	_player1.x = ThisPortal.thisportX;
	_player1.y = ThisPortal.thisportY;
	//_player1.x = 500;
	//_player1.y = 500;
	}

 public function getExit(Exit:FlxSprite,Player:FlxSprite):void
{

_player1.hasPowerup = false;
_player1.hasPowerup2 = false;
_player1.hasPowerup3 = false;
hasKey = 0;

	if (MapNumber>=105){
				MapNumber = 101;
				FlxG.state = new WinState;
				return;
			}
			
			if (MapNumber<104){
				MapNumber = MapNumber+1;
			}

		FlxG.state = new PlayState();
		
		return;
}

 public function getPowerup(Powerup:FlxSprite,Player:FlxSprite):void
{
	Powerup.kill();
	FlxG.score = FlxG.score + 1000;
_player1.hasPowerup = true;

	TxtScore = new FlxText(300,30,FlxG.width,"");
			
			TxtScore.color = 0xff4040;
			TxtScore.size = 25;
			TxtScore.visible = false;
			add(TxtScore);
			TxtScore.x = _player1.x;
			TxtScore.y = _player1.y;
			TxtScore.visible = true ;
			TxtScore.text = "1000";
	
	TxtScore.update();
	TweenMax.to(TxtScore, 5, { x:_player1.x-(1024/2), y:_player1.y-3000, alpha:1.7,delay:0,repeat:0,yoyo:true});
	

}


 public function getPowerup2(Powerup2:FlxSprite,Player:FlxSprite):void
{
	Powerup2.kill();
	FlxG.score = FlxG.score + 500;	
_player1.hasPowerup2 = true;

	TxtScore = new FlxText(300,30,FlxG.width,"");
			
			TxtScore.color = 0xff4040;
			TxtScore.size = 25;
			TxtScore.visible = false;
			add(TxtScore);
			TxtScore.x = _player1.x;
			TxtScore.y = _player1.y;
			TxtScore.visible = true ;
			TxtScore.text = "1000";
	
	TxtScore.update();
	TweenMax.to(TxtScore, 5, { x:_player1.x-(1024/2), y:_player1.y-3000, alpha:1.7,delay:0,repeat:0,yoyo:true});
	


}
 public function getPowerup3(Powerup3:FlxSprite,Player:FlxSprite):void
{
	Powerup3.kill();
	FlxG.score = FlxG.score + 1500;
	_player1.hasPowerup3 = true;

	TxtScore = new FlxText(300,30,FlxG.width,"");
			
			TxtScore.color = 0xff4040;
			TxtScore.size = 25;
			TxtScore.visible = false;
			add(TxtScore);
			TxtScore.x = _player1.x;
			TxtScore.y = _player1.y;
			TxtScore.visible = true ;
			TxtScore.text = "1000";
	
	TxtScore.update();
	TweenMax.to(TxtScore, 5, { x:_player1.x-(1024/2), y:_player1.y-3000, alpha:1.7,delay:0,repeat:0,yoyo:true});
	


}


 public function getSpecialbox(Specialbox:FlxSprite,Player:FlxSprite):void
{
	Specialbox.kill();
	FlxG.score = FlxG.score + 1000;

	

}


 public function getHealth(Health:FlxSprite,Player:FlxSprite):void
{
	Health.kill();
	FlxG.score = FlxG.score + 200;
	_player1.health = _player1.health + 10;

	TxtScore = new FlxText(300,30,FlxG.width,"");
			
			TxtScore.color = 0xff4040;
			TxtScore.size = 20;
			TxtScore.visible = false;
			add(TxtScore);
			TxtScore.x = _player1.x;
			TxtScore.y = _player1.y;
			TxtScore.visible = true ;
			TxtScore.text = "200";
	
	TxtScore.update();
	TweenMax.to(TxtScore, 5, { x:_player1.x-(1024/2), y:_player1.y-3000, alpha:1.7,delay:0,repeat:0,yoyo:true});
	

}


// FLan funktion mit absicht leer damit kein Fehler beim compilieren kommt und nicht alles von hand aus dem flan code angpeast wqerden muss
public function onAddCallback(obj:FlxSprite):void
{

}
	

	}
}


