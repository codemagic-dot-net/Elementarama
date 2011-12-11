package 
{
	import org.flixel.*;

	public class Bullet extends FlxSprite
	{      [Embed(source='data/Images/ImgFire.png')] private var ImgBullet:Class;
	//	[Embed(source='NinjaStar.png')] private var ImgBullet:Class;
	//	[Embed(source="../../../data/jump.mp3")] private var SndHit:Class;
	//	[Embed(source="../../../data/shoot.mp3")] private var SndShoot:Class;
		
		public function Bullet()
		{
			super();
			loadGraphic(ImgBullet,true,false,40,40);
			width = 171;
			height = 67;
				//width = 6;
			//height = 6;
			offset.x = 1;
			offset.y = 1;
			exists = false;
			
			//versuch den bug zu beheben
				solid = true;
				moves = true;
				fixed = false;
			//versuch ende
			
			
	
			addAnimation("up",[0]);
			addAnimation("down",[0]);
			addAnimation("left",[0]);
			addAnimation("right",[0]);
			addAnimation("poof", [0], 50, false);
					this.scale.x = FlxG.ResolutionScaleX;
	this.scale.y = FlxG.ResolutionScaleY;	
	this.width = this.width * FlxG.ResolutionScaleX;
	this.height = this.height * FlxG.ResolutionScaleY;
	this.y = this.y * FlxG.ResolutionScaleY;
	this.x = this.x * FlxG.ResolutionScaleX;
		}
		
		override public function update():void
		{
			// Versuch den bug mit den prjektil resten im level zu beheben
							if (this.velocity.x == 0 ){ kill(); } // KILLER CODE :) :) hat den BUG behoben

				if (this.collide() ){ kill(); }
				// Versuch Ende
			if(dead && finished) exists = false;
			else super.update();
		}
		
		override public function render():void
		{
			super.render();
		}


// Bei BOtBullet die COllide schon geändert

		//override public function hitSide(Contact:FlxObject,Velocity:Number):void { kill(); }
		override public function hitBottom(Contact:FlxObject,Velocity:Number):void { kill(); }
		override public function hitTop(Contact:FlxObject,Velocity:Number):void { kill(); }
	
	//override public function hitSide(Contact:FlxObject,Velocity:Number):void { kill(); }
		override public function hitLeft(Contact:FlxObject,Velocity:Number):void { kill(); }
		override public function hitRight(Contact:FlxObject,Velocity:Number):void { kill(); }


	override public function kill():void
		{
			if(dead) return;
			velocity.x = 0;
			velocity.y = 0;
			if(onScreen())// FlxG.play(SndHit);
	
			dead = true;
			solid = false;
			play("poof");
		}
		
		public function shoot(X:int, Y:int, VelocityX:int, VelocityY:int):void
		{
			//FlxG.play(SndShoot);
			super.reset(X,Y);
			//solid = true;
			velocity.x = VelocityX;
			velocity.y = VelocityY;
			if(velocity.y < 0)
				play("up");
			else if(velocity.y > 0)
				play("down");
			else if(velocity.x < 0)
				play("left");
			else if(velocity.x > 0)
				play("right");
		}
				public function shoot2(X:int, Y:int, VelocityX:int, VelocityY:int):void
		{
			//FlxG.play(SndShoot);
			super.reset(X,Y);
			solid = true;
			velocity.x = VelocityX;
			velocity.y = VelocityY;
			if(velocity.y < 0)
				play("up");
			else if(velocity.y > 0)
				play("down");
			else if(velocity.x < 0)
				play("left");
			else if(velocity.x > 0)
				play("right");
		}
		
	
	}
}