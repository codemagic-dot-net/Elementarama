package  layers
{
	import org.flixel.*;
	import com.greensock.*;
	import com.greensock.easing.*;
	/**
	 * ...
	 * @author Marcel Flaig
	 */
	public class Map199Foreground extends FlxObject	{
			[Embed(source='../data/Images/ImgFgMoving202.png')] private var ImgFront1:Class;
	private		var XYForeground1:Array = new Array( 0, 5 , 10, 15, 20 , 25, 30, 35, 40,45,50,60,70,80,90,100,110,120,130,140,150,160,170,180,190,200,210,220,230,240,250,260,270,280,290,300,310,320,330,340,350,360,370,380,390,400);
				
				private var tilesize:uint = 32;
			
				private var Foreground:FlxSprite
				
				
						
		
		public function Map199Foreground() 
		{
	for (x= 0; x < XYForeground1.length; x++) {
 



Foreground = new FlxSprite(0, 0);

Foreground.loadGraphic(ImgFront1,true,true,567,300)
  Foreground.addAnimation("normal", [0, 1], 5);
Foreground.play("normal");
		
Foreground.moves = true;
		Foreground.solid = false;
	Foreground.scale.x = 1;
Foreground.scale.y = 1;
				Foreground.scrollFactor.x = 1.620000;
Foreground.scrollFactor.y = 1.200000;
Foreground.y = 670;
Foreground.x = XYForeground1[x]*tilesize;

		
			FlxG.state.add(Foreground);	
TweenMax.to(Foreground, 5, { x: XYForeground1[x]*tilesize+10, y:630,ease:Sine.easeIn, alpha:10,repeat:-1,yoyo:true} );
	
}
}

			
			
			
			



			
			
												
		


	
			
									
			
			
	
			
		
	
	}}
		
	

