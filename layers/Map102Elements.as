package  layers
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Marcel Flaig
	 */
	public class Map102Elements extends FlxObject	{
		
	[Embed(source='../data/Images/Ele1halb.png')] private var 				Imgelement101:Class;
[Embed(source = '../data/Images/Ele2halb.png')] private var 			ImgElement102:Class;
[Embed(source='../data/Images/ImgElement2_kleinalt.png')]	private var ImgElement103:Class;
[Embed(source = '../data/Images/ImgElement1_kleinalt.png')] private var 	ImgElement104:Class;


		private var tilesize:uint = 32;
				
				
		private		var XYElement1:Array = new Array( -3 ,28,98);
		private		var XYElement2:Array = new Array( 59,72);
		private		var XYElement3:Array = new Array(117,132,147,162,172,177,192,207,222,225,237,240,252,267,282,297,310,320,330,340,350,360,370,380,390,400,410,420,430);
		private		var XYElement4:Array = new Array(110,125,140,155,165,170,185,199,200,215,220,230, 245,250, 260, 275, 280,290,300,305,315,325,335,345,355,365,375,385,395,405,415,425);
				
			
				private var Foreground:FlxSprite ;
						
		
		public function Map102Elements() 
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

			


// ganze kleine
	for ( x= 0; x < XYElement3.length; x++) {
 



Foreground = new FlxSprite(0,0,ImgElement103);
Foreground.moves = true;
		Foreground.solid = false;
	Foreground.scale.x = 1;
Foreground.scale.y = 1;
				Foreground.scrollFactor.x = 1.000000;
Foreground.scrollFactor.y = 1.000000;
Foreground.y = 580+4*tilesize;
Foreground.x = XYElement3[x]*tilesize;

			
			FlxG.state.add(Foreground);	

}

	for ( x= 0; x < XYElement4.length; x++) {
 



Foreground = new FlxSprite(0,0,ImgElement104);
Foreground.moves = true;
		Foreground.solid = false;
	Foreground.scale.x = 1;
Foreground.scale.y = 1;
				Foreground.scrollFactor.x = 1.000000;
Foreground.scrollFactor.y = 1.000000;
Foreground.y = 580+4*tilesize;
Foreground.x = XYElement4[x]*tilesize;

			
			FlxG.state.add(Foreground);	

}
	// Ellemente ENDE	
			
												
		

}

			



	
			
									
			
			
	
			
		
	
	}}
		
	

