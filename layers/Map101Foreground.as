package  layers
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Marcel Flaig
	 */
	public class Map101Foreground extends FlxObject	{
		
		
[Embed(source='../data/Images/ImgFg101.png')] private var 			ImgFront1:Class;
[Embed(source = '../data/Images/ImgFg102.png')] private var		ImgFront2:Class;
[Embed(source='../data/Images/ImgFg103.png')] private var 			ImgFront3:Class;
[Embed(source = '../data/Images/ImgFg104.png')] private var 		ImgFront4:Class;


/*[Embed(source='data/Images/Ele1halb.png')] private var 				Imgelement101:Class;
[Embed(source = 'data/Images/Ele2halb.png')] private var 			ImgElement102:Class;
[Embed(source='data/Images/ImgElement2_kleinalt.png')]	private var ImgElement103:Class;
[Embed(source='data/Images/ImgElement1_kleinalt.png')] private var 	ImgElement104:Class;
	
*/


				private var tilesize:uint = 32;
												private var neuy:uint=tilesize*20;// gibt an wieivel tiles nach unten verschoben werden soll im vergleichzu map101 vom 09-08-10

				private		var XYForeground1:Array = new Array( -3 , 10, 50,288,293,296,300,305,308,311,314,317);
				private		var XYForeground2:Array = new Array( 60,70,80,85,110,130,155,175,200);
				private		var XYForeground3:Array = new Array( 215,220,230,235,237,250,260,262,269,2720,275,281,285);
				private		var XYForeground4:Array = new Array(496,492,488,483,480,475,470,465, 463, 461, 457, 455, 452);
				
			/*	private		var XYElement1:Array = new Array( -3 ,28,98);
				private		var XYElement2:Array = new Array( 59,72);
				private		var XYElement3:Array = new Array(117,132,147,162,177,192,207,222,237,252,267,282,297,312,327,342,357,372,387,402,417,432,447,462,477,492,507);
				private		var XYElement4:Array = new Array(110,125,140,155,170,185,200,215,230, 245, 260, 275, 290,305,320,335,350,365,380,395,410,425,440,455,470,485);
			*/	
				private var Foreground:FlxSprite ;
						
		
		public function Map101Foreground() 
		{

	/*					
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
												
		
*/
	
for (x = 0; x < XYForeground1.length; x++) {
 



Foreground = new FlxSprite(0,0,ImgFront1);
Foreground.moves = true;
		Foreground.solid = false;
	Foreground.scale.x = 1;
Foreground.scale.y = 1;
				Foreground.scrollFactor.x = 1.620000;
Foreground.scrollFactor.y = 1.200000;
Foreground.y = 5800+neuy;
Foreground.x = XYForeground1[x]*tilesize;
				// :)
	Foreground.scale.x = FlxG.ResolutionScaleX;
	Foreground.scale.y = FlxG.ResolutionScaleY;	
	Foreground.width = 	Foreground.width * FlxG.ResolutionScaleX;
		Foreground.height = 	Foreground.height * FlxG.ResolutionScaleY;
		Foreground.offset.y = 	Foreground.offset.y * FlxG.ResolutionScaleY;
	Foreground.offset.x = 	Foreground.offset.x * FlxG.ResolutionScaleY;
		Foreground.x = Foreground.x * FlxG.ResolutionScaleX;
		Foreground.y = Foreground.y * FlxG.ResolutionScaleY;
	
			
			FlxG.state.add(Foreground);	

}



for (x = 0; x < XYForeground2.length; x++) {
 



Foreground = new FlxSprite(0,0,ImgFront2);
Foreground.moves = true;
		Foreground.solid = false;
	Foreground.scale.x = 1;
Foreground.scale.y = 1;
				Foreground.scrollFactor.x = 1.640000;
Foreground.scrollFactor.y = 1.200000;
Foreground.y = 5800+neuy;
Foreground.x = XYForeground2[x]*tilesize;
				// :)
	Foreground.scale.x = FlxG.ResolutionScaleX;
	Foreground.scale.y = FlxG.ResolutionScaleY;	
	Foreground.width = 	Foreground.width * FlxG.ResolutionScaleX;
		Foreground.height = 	Foreground.height * FlxG.ResolutionScaleY;
		Foreground.offset.y = 	Foreground.offset.y * FlxG.ResolutionScaleY;
	Foreground.offset.x = 	Foreground.offset.x * FlxG.ResolutionScaleY;
		Foreground.x = Foreground.x * FlxG.ResolutionScaleX;
		Foreground.y = Foreground.y * FlxG.ResolutionScaleY;
	
			
			FlxG.state.add(Foreground);	

}
for ( x = 0; x < XYForeground3.length; x++) {
 



Foreground = new FlxSprite(0,0,ImgFront3);
Foreground.moves = true;
		Foreground.solid = false;
	Foreground.scale.x = 1;
Foreground.scale.y = 1;
				Foreground.scrollFactor.x = 1.6300000;
Foreground.scrollFactor.y = 1.200000;
Foreground.y = 5900+neuy;
Foreground.x = XYForeground3[x]*tilesize;
				// :)
	Foreground.scale.x = FlxG.ResolutionScaleX;
	Foreground.scale.y = FlxG.ResolutionScaleY;	
	Foreground.width = 	Foreground.width * FlxG.ResolutionScaleX;
		Foreground.height = 	Foreground.height * FlxG.ResolutionScaleY;
		Foreground.offset.y = 	Foreground.offset.y * FlxG.ResolutionScaleY;
	Foreground.offset.x = 	Foreground.offset.x * FlxG.ResolutionScaleY;
		Foreground.x = Foreground.x * FlxG.ResolutionScaleX;
		Foreground.y = Foreground.y * FlxG.ResolutionScaleY;
	
			
			FlxG.state.add(Foreground);	

}


for (x = 0; x < XYForeground4.length; x++) {
 



Foreground = new FlxSprite(0,0,ImgFront4);
Foreground.moves = true;
		Foreground.solid = false;
	Foreground.scale.x = 1;
Foreground.scale.y = 1;
				Foreground.scrollFactor.x = 1.610000;
Foreground.scrollFactor.y = 1.200000;
Foreground.y = 5700+neuy;
Foreground.x = XYForeground4[x]*tilesize;
				// :)
	Foreground.scale.x = FlxG.ResolutionScaleX;
	Foreground.scale.y = FlxG.ResolutionScaleY;	
	Foreground.width = 	Foreground.width * FlxG.ResolutionScaleX;
		Foreground.height = 	Foreground.height * FlxG.ResolutionScaleY;
		Foreground.offset.y = 	Foreground.offset.y * FlxG.ResolutionScaleY;
	Foreground.offset.x = 	Foreground.offset.x * FlxG.ResolutionScaleY;
		Foreground.x = Foreground.x * FlxG.ResolutionScaleX;
		Foreground.y = Foreground.y * FlxG.ResolutionScaleY;
	
			
			FlxG.state.add(Foreground);	

}

			



	
			
									
			
			
	
			
		
	
	}}
		
	

}