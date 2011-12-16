package
{
	import org.flixel.*;
	
	import scenes.*;//for gameoverscreen
	
	public class Player extends FlxSprite
	{
[Embed(source='data/Images/ImgPlayer.png')] private var ImgPlayer:Class;
		
		
		
//Sounds		
//[Embed(source='SndStart.mp3')] private var SndJump:Class;
[Embed(source='data/Sound/SndLand.mp3')] private var SndLand:Class;
[Embed(source='data/Sound/SndPlayerhurt.mp3')] private var SndDeath:Class;
[Embed(source='data/Sound/SndPlayerhurt.mp3')] private var SndHurt:Class;
[Embed(source='data/Sound/SndJam.mp3')] private var SndJam:Class;
[Embed(source='data/Sound/SndPlayershoot.mp3')] protected var SndPlayershoot:Class;	// Collect Coin


// Don't edit this ;)
public var hasPowerup:Boolean = false; 
public var hasPowerup2:Boolean = false; 
public var hasPowerup3:Boolean = false; 
public var Powerup2Timer:uint = 0;	
public var Powerup3Timer:uint = 0;	

private var _bullets:Array;
private var _bullets2:Array;
private var _curBullet:uint;
private var _curBullet2:uint;
private var _bulletVel:int;
private var _up:Boolean;
private var _down:Boolean;
private var _restart:Number;
private var _gibs:FlxEmitter;

private var Powerup3Scaleswitch:uint = 0;	

private var idlecount:uint = 0; // Für Animation
private var hasShot:Boolean = false;

// Edit this to tweak game 
public var Powerup2Duration:uint = 1000;
public var Powerup3Duration:uint = 2500;
private var imagesizeY:uint = 176 // just for lazy people
private var imagesizeX:uint = 58 //just for lazy people
//private var _jumpPower:uint = 1100; //the Players jump power is multiplied if hasPowerup2
//private var _jumpPowerstatic:uint=1100; 
private var _jumpPower:uint = 600; //the Players jump power is multiplied if hasPowerup2
private var _jumpPowerstatic:uint=600; 

	
	
		public function Player(X:Number, Y:Number,Bullets:Array,Bullets2:Array,Gibs:FlxEmitter)
		{
			super(X, Y);
			loadGraphic(ImgPlayer,true,true,imagesizeX,imagesizeY);
			maxVelocity.x = 4230;			//walking speed
			acceleration.y = 1400;			//gravity
			
			
			drag.x =maxVelocity.x*6;		//deceleration (sliding to a stop)
		//	maxVelocity.x = 230;			//walking speed
		//	acceleration.y = 400;			//gravity
		//	drag.x = maxVelocity.x*3;		//deceleration (sliding to a stop)
		
		//boundingbox tweak
			width = 55;
			height = 169;
		//	offset.x = 8;
			offset.y = -21;
			health=30; // Max Value 60 siehe playstate hud

	//Animation
if(FlxG.Resolution=="640x480"){
	this.scale.x = FlxG.ResolutionScaleX;
	this.scale.y = FlxG.ResolutionScaleY;	
	this.width = this.width * FlxG.ResolutionScaleX;
	this.height = this.height * FlxG.ResolutionScaleY;
	this.offset.y = this.offset.y * FlxG.ResolutionScaleY;
	this.offset.x = this.offset.x * FlxG.ResolutionScaleY;
}
		addAnimation("idle",[0],5,false); 
		addAnimation("walk",[1,2,3,2],7,true);
		addAnimation("walk_back",[3,2,1,3,2],7,true);
		addAnimation("flail", [1,2,3,2], 18, true); //  jet idle 
		addAnimation("jetidle", [16], 9, false);
		addAnimation("realidle", [1,2,0,0,0,3,3,3,0,0,0,0,2,2,2,2,12,0,0,0,0,0,13,14,15,16,17,18,19,4,5,6,7,8,9,0,0,0,0,7,8,9,0,7,8,0,7,7,7,8,9,0,0,0,0], 3, true);
			
		
		//Needs to be done:
			addAnimation("shoot", [5,6,7], 9, false);
			addAnimationCallback(myCallback);

			addAnimation("throw", [23,24,25],18, false);
		//	addAnimation("finger", [8,9,10], 18, false);
			addAnimation("jet pack", [11, 12,13,14,15,16], 5, false);
						//addAnimation("jet pack", [19, 20,22,23], 18, true);
			addAnimation("dead", [18, 19, 20,21], 10, false);
		addAnimation("jump", [12,13,14,15,16], 5, false);

			
			
		

_restart = 0;



	//basic player physics
var runSpeed:uint = 80*2.3; 
maxVelocity.x = runSpeed;


//animations


//bullet stuff
_bullets = Bullets;
_curBullet = 0;
_bulletVel = 360;
_bullets2 = Bullets2; // needs to be done
_curBullet2 = 0;


//Gibs emitted upon death
_gibs = Gibs;

			//MODE ENDE
			
			
			
			
			
			
			
			
			
			}
		
		override public function update():void
		{
			
			
			
		//MODE Start
			 //game restart timer
if(dead)
	{
			play("dead",true);
_restart += FlxG.elapsed;
if(_restart > 2)

	destroy();
		FlxG.state.destroy();
		FlxG.resetInput();
		
FlxG.state = new GameoverState();
return;
}



//AIMING
_up = false;
_down = false;
if(FlxG.keys.UP) _up = true;

//SHOOTING
if(!flickering() && FlxG.keys.justPressed("C"))
	{
	
	idlecount = 0 ;
	// Problem occurs if :( hasShot = true;
	FlxG.play(SndPlayershoot);	

	
	play("shoot",true);

	hasShot = true;
	

	var bXVel:int = 0;
	var bYVel:int = 0;
	var bX:int = x-20;
	var bY:int = y+(imagesizeY/2);

	
	if(_up)
			{
			bY -= _bullets[_curBullet].height - 4;
			bYVel = -_bulletVel;
			}
			
	else if(_down)
			{
			bY += height - 4;
			bYVel = _bulletVel;
			velocity.y -= 36;
			}
			
	else if(facing == RIGHT)
			{
			bX += width - 4;
			bXVel = _bulletVel;
			}
	
	else
			{
			bX -= _bullets[_curBullet].width - 4;
			bXVel = -_bulletVel;
			}
			
			
	_bullets[_curBullet].shoot(bX, bY, bXVel, bYVel);


	_bullets[_curBullet].shoot2(bX,bY,bXVel,bYVel);

	if (hasPowerup != false) 
			{
			_bullets2[_curBullet2].shoot3(bX,bY,bXVel,bYVel);
			_bullets2[_curBullet2].shoot4(bX,bY,bXVel,bYVel);
			}


//The different bullet types

if(++_curBullet >= _bullets.length)
_curBullet = 0;


if(++_curBullet2 >= _bullets2.length)
_curBullet2 = 0;




//UPDATE POSITION AND ANIMATION
//super.update();

//Jammed, can't fire!
if(flickering())
{
if(FlxG.keys.justPressed("C"))
FlxG.play(SndJam);
idlecount = 0 ;
}
		
//MODE ENDE
			
	}			
			
			
			
			
			
			
			
		if(hasPowerup2) {
	

			_jumpPower = _jumpPower * 1.3
			hasPowerup2 = false
			Powerup2Timer = Powerup2Duration;

			}
		
			
		Powerup2Timer -= FlxG.elapsed * 2
		
		
		if(Powerup2Timer < 500) {
	
		_jumpPower = _jumpPowerstatic;


		}
	
	
	
	if(hasPowerup3) {
	
			hasPowerup3 = false
									
			Powerup3Timer = Powerup3Duration;


	}
	
Powerup3Timer -= FlxG.elapsed * 2


if(Powerup3Timer < 200) {
	scale.x = 0.5;
	}
	
if(Powerup3Timer < 400) {
	scale.x = 3;
	}
	
if(Powerup3Timer < 800) {
	scale.x = 1;
	}
	
if(Powerup3Timer < 900) {
	scale.x = 2;
	}
if(Powerup3Timer < 1100) {
	scale.x = 0.25;
	}
	
if(Powerup3Timer < 1300) {
	scale.x = 2;
	}

if(Powerup3Timer < 1500) {
	scale.x = 1;
	}
	

	
	
			
			//Smooth slidey walking controls
			acceleration.x = 0;
			if(FlxG.keys.LEFT){
				acceleration.x -= drag.x;
		 facing = LEFT;
		 idlecount = 0 ;
			}
			   



			if(FlxG.keys.RIGHT)
			{	acceleration.x += drag.x;
			idlecount = 0 ;
			facing = RIGHT;}


			if(onFloor)
			{
				
				
						idlecount += 70 * FlxG.elapsed ;
						
				
				
				//Jump controls
				if(FlxG.keys.justPressed("SPACE"))
				{idlecount = 0 ;
				//	velocity.y = -acceleration.y*0.51;
			//	velocity.y = -acceleration.y * 0.81;
					velocity.y = -acceleration.y*_jumpPower/1000;
					
				}//Animations
				
				
				if(finished){
				
						//Jump controls
				if(FlxG.keys.justPressed("SPACE"))
				{idlecount = 0 ;
				//	velocity.y = -acceleration.y*0.51;
			//	velocity.y = -acceleration.y * 0.81;

					play("jump");
				}//Animations
				
				else if(velocity.x > 0 && hasShot == false)
					play("walk");
					
				
				else if(velocity.x < 0 && hasShot == false)
					play("walk_back");
					
				else if(hasShot == true)
					play("shoot",true);
			
				else if (idlecount <= 200 && hasShot == false)
				play ("idle");
				
				else if (idlecount > 200 && hasShot == false)
				play ("realidle");

				else
					// Problem with the idle animation needs to be fixed:
					
					idlecount += 70 * FlxG.elapsed ;
				}
			
			}
			
			
			else if(velocity.y < 0)
				play("jump");
			else
				play("jetidle");
			
			//Default object physics update
			super.update();
		}
		
		
		
		
		
		 override public function hitBottom(Contact:FlxObject,Velocity:Number):void
{
if(velocity.y > 50)
FlxG.play(SndLand);
onFloor = true;
trace("test");
return super.hitBottom(Contact,Velocity);
}

override public function hurt(Damage:Number):void
{this.play("dead",true);
//Damage = 0; // GOD MODE
if(flickering())
return;
FlxG.play(SndHurt);
flicker(1.3);

health = health -Damage;
if(velocity.x > 0)
velocity.x = -maxVelocity.x;
else
velocity.x = maxVelocity.x;

super.hurt(Damage);

}




private function myCallback(animationName:String, currentFrame:uint, frameIndex:uint):void 
{
	if (animationName == "shoot" && finished == true)
	{
	    hasShot = false;
		play("walk");
		updateAnimation();
	}		
}


override public function kill():void
{

	
	
			dead = true;
	
			
			play ("dead");
			if (finished) {
				trace("finished");
				exists = false;
		
				
				
	
	
if(dead)
return;

solid = false;
FlxG.play(SndDeath);
super.kill();
flicker(-1);
exists = true;
visible = false;
FlxG.quake.start(0.015,0.35);
FlxG.flash.start(0xffd8eba2,0.35);
if(_gibs != null)
{
_gibs.at(this);
_gibs.start(true,0,50);
}
	
				
			}
		
	
	





}

}
	}
