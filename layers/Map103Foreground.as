package  layers
{
	import org.flixel.*;
	import com.greensock.*;
	import com.greensock.easing.*;
	/**
	 * ...
	 * @author Marcel Flaig
	 */
	public class Map103Foreground extends FlxObject	{
			[Embed(source='../data/Images/ImgFgMoving201.png')] private var ImgFront1:Class;
	
					[Embed(source='../data/Images/Ele1halb.png')] private var 				Imgelement101:Class;
[Embed(source = '../data/Images/Ele2halb.png')] private var 			ImgElement102:Class;
			
			private		var XYForeground1:Array = new Array( 0, 5 , 10, 15, 20 , 25, 30, 35, 40, 45, 50,290,295,300,305,310,315,320,325,330,333,335,338,341,343,346,349,352,355,360,365,370,375,378,380,385,390,393,396,625,630,640,645,648,650,656,659,663,670,676,678,681,684,687,690,695,700.710,718,725,727,734,740,755,760.767,768,769,777,787,789,795,797,800,803,807,810);
				private var tilesize:uint = 32;
			
				private var Foreground:FlxSprite
				
				private		var XYElement1:Array = new Array( -3 ,28,98,140,165,190,215,240,265,290,315);
				private		var XYElement2:Array = new Array( 59,72,85,93,106,119,132,325,340,355,370,385,400);
					
						
		
		public function Map103Foreground() 
		{
									

			
			
					// ELEMENTE
	for (var x:uint = 0; x < XYElement1.length; x++) {
 



Foreground = new FlxSprite(0,0,Imgelement101);
Foreground.moves = true;
		Foreground.solid = false;
	Foreground.scale.x = 1;
Foreground.scale.y = 1;
				Foreground.scrollFactor.x = 1.000000;
Foreground.scrollFactor.y = 1.000000;
Foreground.y = 580;
Foreground.x = XYElement1[x]*tilesize;

			
			FlxG.state.add(Foreground);	

}


			


	for ( x= 0; x < XYElement2.length; x++) {
 



Foreground = new FlxSprite(0,0,ImgElement102);
Foreground.moves = true;
		Foreground.solid = false;
	Foreground.scale.x = 1;
Foreground.scale.y = 1;
				Foreground.scrollFactor.x = 1.000000;
Foreground.scrollFactor.y = 1.000000;
Foreground.y = 580;
Foreground.x = XYElement2[x]*tilesize;

			
			FlxG.state.add(Foreground);	

}

			


			
			
			
			
			
for (x= 0; x < XYForeground1.length; x++) {
 



Foreground = new FlxSprite(0, 0);

Foreground.loadGraphic(ImgFront1,true,true,567,300)
  Foreground.addAnimation("normal", [0, 1, 2,3], 0.3);
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





			
			
			
			



			
			
												
		


	
			
									
			
			
	
			
		
	
	}}
		
	

}