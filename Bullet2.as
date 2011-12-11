package 
{
	import org.flixel.*;

	public class Bullet2 extends FlxSprite
	{      
		
		[Embed(source='data/Images/ImgPlayerBullet2.png')] private var ImgBullet:Class;

		
		public function Bullet2()
		{
			super();
			loadGraphic(ImgBullet,true,false,31,31);
			
			//width = 171;
			//height = 67;
			
			offset.x = 1;
			offset.y = 1;
			exists = false;
			//addAnimation("up",[0]);
			//addAnimation("down",[0]);
			//addAnimation("left",[0]);
			//addAnimation("right",[0]);
			//addAnimation("poof",[0], 50, false);
		}
		
		override public function update():void
		{
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
		
		public function shoot3(X:int, Y:int, VelocityX:int, VelocityY:int):void
		{
			//FlxG.play(SndShoot);
			super.reset(X,Y);
			//solid = true;
			velocity.x = -VelocityX;
			velocity.y = -VelocityY;
			if(velocity.y < 0)
				play("up");
			else if(velocity.y > 0)
				play("down");
			else if(velocity.x < 0)
				play("left");
			else if(velocity.x > 0)
				play("right");
		}
				public function shoot4(X:int, Y:int, VelocityX:int, VelocityY:int):void
		{
			//FlxG.play(SndShoot);
			super.reset(X,Y);
			solid = true;
			velocity.x = -VelocityX;
			velocity.y = -VelocityY;
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