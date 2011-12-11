package  layers
{
	import org.flixel.*;
	import com.greensock.*;
	import com.greensock.easing.*;
	/**
	 * ...
	 * @author Marcel Flaig
	 */
	public class Map102Foreground extends FlxObject	{
			[Embed(source='../data/Images/ImgFgMoving201.png')] private var ImgFront1:Class;
	


				private		var XYForeground1:Array = new Array( -3 , 10, 50,288,293,296,300,305,308,311,314,317);
				private		var XYForeground2:Array = new Array( 60,70,80,85,110,130,155,175,200);
				private		var XYForeground3:Array = new Array( 215,220,230,235,237,250,260,262,269,2720,275,281,285);
				private		var XYForeground4:Array = new Array(496,492,488,483,480,475,470,465, 463, 461, 457, 455, 452);
				
				
				private var tilesize:uint = 32;
			
		
				
			
				
				
				
				private var Foreground:FlxSprite
				
				
						
		
		public function Map102Foreground() 
		{
	
			
		
			

for (x= 0; x < XYForeground1.length; x++) {
 



Foreground = new FlxSprite(0, 0);

Foreground.loadGraphic(ImgFront1,true,true,567,300)
  Foreground.addAnimation("normal", [0, 1, 2,3], 0.1);
Foreground.play("normal");
		
Foreground.moves = true;
		Foreground.solid = false;
	Foreground.scale.x = 1;
Foreground.scale.y = 1;
				Foreground.scrollFactor.x = 1.620000;
Foreground.scrollFactor.y = 1.200000;
Foreground.y = 620;
Foreground.x = XYForeground1[x]*tilesize;

		
			FlxG.state.add(Foreground);	
TweenMax.to(Foreground, 5, { x: XYForeground1[x]*tilesize+10, y:680,ease:Sine.easeIn, alpha:10,repeat:-1,yoyo:true} );
	
}


for (x= 0; x < XYForeground2.length; x++) {
 



Foreground = new FlxSprite(0, 0);

Foreground.loadGraphic(ImgFront1,true,true,567,300)
  Foreground.addAnimation("normal", [0, 1, 2,3], 0.1);
Foreground.play("normal");
		
Foreground.moves = true;
		Foreground.solid = false;
	Foreground.scale.x = 1;
Foreground.scale.y = 1;
				Foreground.scrollFactor.x = 1.620000;
Foreground.scrollFactor.y = 1.200000;
Foreground.y = 620;
Foreground.x = XYForeground2[x]*tilesize;

			
			FlxG.state.add(Foreground);	
TweenMax.to(Foreground, 5, { x: XYForeground2[x]*tilesize+10, y:680,ease:Sine.easeIn, alpha:10,repeat:-1,yoyo:true} );
	
}

			

for (x= 0; x < XYForeground3.length; x++) {
 



Foreground = new FlxSprite(0, 0);

Foreground.loadGraphic(ImgFront1,true,true,567,300)
  Foreground.addAnimation("normal", [0, 1, 2,3], 0.1);
Foreground.play("normal");
		
Foreground.moves = true;
		Foreground.solid = false;
	Foreground.scale.x = 1;
Foreground.scale.y = 1;
				Foreground.scrollFactor.x = 1.620000;
Foreground.scrollFactor.y = 1.200000;
Foreground.y = 620;
Foreground.x = XYForeground3[x]*tilesize;

			
			FlxG.state.add(Foreground);	
TweenMax.to(Foreground, 5, { x: XYForeground3[x]*tilesize+10, y:680,ease:Sine.easeIn, alpha:10,repeat:-1,yoyo:true} );
	
}

			

for (x= 0; x < XYForeground4.length; x++) {
 



Foreground = new FlxSprite(0, 0);

Foreground.loadGraphic(ImgFront1,true,true,567,300)
  Foreground.addAnimation("normal", [0, 1, 2,3], 0.1);
Foreground.play("normal");
		
Foreground.moves = true;
		Foreground.solid = false;
	Foreground.scale.x = 1;
Foreground.scale.y = 1;
				Foreground.scrollFactor.x = 1.620000;
Foreground.scrollFactor.y = 1.200000;
Foreground.y = 620;
Foreground.x = XYForeground4[x]*tilesize;

			
			FlxG.state.add(Foreground);	
TweenMax.to(Foreground, 5, { x: XYForeground4[x]*tilesize+10, y:680,ease:Sine.easeIn, alpha:10,repeat:-1,yoyo:true} );
	
}

			
			
			
			



			
			
												
		


	
			
									
			
			
	
			
		
	
	}}
		
	

}