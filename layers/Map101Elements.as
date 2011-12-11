package layers
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Marcel Flaig
	 */
	public class Map101Elements extends FlxObject	{
		


[Embed(source='../data/Images/Ele1halb.png')] private var 				Imgelement101:Class;
[Embed(source = '../data/Images/Ele2halb.png')] private var 			ImgElement102:Class;
[Embed(source='../data/Images/ImgElement2_kleinalt.png')]	private var ImgElement103:Class;
[Embed(source='../data/Images/ImgElements1.png')] private var 	ImgElement104:Class;
	



				private var tilesize:uint = 32;
								private var neuy:uint=tilesize*20;// gibt an wieivel tiles nach unten verschoben werden soll im vergleichzu map101 vom 09-08-10

				
				private		var XYElement1:Array = new Array( );
				private		var XYElement2:Array = new Array( );
				private		var XYElement3:Array = new Array();
				private		var XYElement4:Array = new Array(-3,20,40,60,80,100,120);
				
				private var Foreground:FlxSprite ;
						
		
		public function Map101Elements() 
		{

						
	// ELEMENTE
	for (var x:uint = 0; x < XYElement1.length; x++) {
 



Foreground = new FlxSprite(0,0+neuy,Imgelement101);
Foreground.moves = true;
		Foreground.solid = false;
	Foreground.scale.x = 1;
Foreground.scale.y = 1;
				Foreground.scrollFactor.x = 1.000000;
Foreground.scrollFactor.y = 1.000000;
Foreground.y = 580+0+neuy;
Foreground.x = XYElement1[x]*tilesize;

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


			


	for ( x= 0; x < XYElement2.length; x++) {
 



Foreground = new FlxSprite(0,0+neuy,ImgElement102);
Foreground.moves = true;
		Foreground.solid = false;
	Foreground.scale.x = 1;
Foreground.scale.y = 1;
				Foreground.scrollFactor.x = 1.000000;
Foreground.scrollFactor.y = 1.000000;
Foreground.y = 580+0+neuy;
Foreground.x = XYElement2[x]*tilesize;
					if(FlxG.Resolution=="640x480"){
	Foreground.scale.x = FlxG.ResolutionScaleX;
	Foreground.scale.y = FlxG.ResolutionScaleY;	
	Foreground.width = 	Foreground.width * FlxG.ResolutionScaleX;
		Foreground.height = 	Foreground.height * FlxG.ResolutionScaleY;
		Foreground.offset.y = 	Foreground.offset.y * FlxG.ResolutionScaleY;
	Foreground.offset.x = 	Foreground.offset.x * FlxG.ResolutionScaleY;
		Foreground.x = Foreground.x * FlxG.ResolutionScaleX;
		Foreground.y = Foreground.y * FlxG.ResolutionScaleY;
}		
			
			FlxG.state.add(Foreground);	

}

			


// ganze kleine
	for ( x= 0; x < XYElement3.length; x++) {
 



Foreground = new FlxSprite(0,00+neuy,ImgElement103);
Foreground.moves = true;
		Foreground.solid = false;
	Foreground.scale.x = 1;
Foreground.scale.y = 1;
				Foreground.scrollFactor.x = 1.000000;
Foreground.scrollFactor.y = 1.000000;
Foreground.y = 580+neuy;
Foreground.x = XYElement3[x]*tilesize;
					if(FlxG.Resolution=="640x480"){
	Foreground.scale.x = FlxG.ResolutionScaleX;
	Foreground.scale.y = FlxG.ResolutionScaleY;	
	Foreground.width = 	Foreground.width * FlxG.ResolutionScaleX;
		Foreground.height = 	Foreground.height * FlxG.ResolutionScaleY;
		Foreground.offset.y = 	Foreground.offset.y * FlxG.ResolutionScaleY;
	Foreground.offset.x = 	Foreground.offset.x * FlxG.ResolutionScaleY;
		Foreground.x = Foreground.x * FlxG.ResolutionScaleX;
		Foreground.y = Foreground.y * FlxG.ResolutionScaleY;
}		
			
			FlxG.state.add(Foreground);	

}

	for ( x= 0; x < XYElement4.length; x++) {
 



Foreground = new FlxSprite(0,00+neuy,ImgElement104);
Foreground.moves = true;
		Foreground.solid = false;
	Foreground.scale.x = 1;
Foreground.scale.y = 1;
				Foreground.scrollFactor.x = 1.000000;
Foreground.scrollFactor.y = 1.000000;
Foreground.y = 575 + neuy;
Foreground.x = XYElement4[x]*tilesize;

					if(FlxG.Resolution=="640x480"){
	Foreground.scale.x = FlxG.ResolutionScaleX;
	Foreground.scale.y = FlxG.ResolutionScaleY;	
	Foreground.width = 	Foreground.width * FlxG.ResolutionScaleX;
		Foreground.height = 	Foreground.height * FlxG.ResolutionScaleY;
		Foreground.offset.y = 	Foreground.offset.y * FlxG.ResolutionScaleY;
	Foreground.offset.x = 	Foreground.offset.x * FlxG.ResolutionScaleY;
	Foreground.x = Foreground.x * FlxG.ResolutionScaleX;
		Foreground.y = Foreground.y * FlxG.ResolutionScaleY;
}		
			FlxG.state.add(Foreground);	

}
	// Ellemente ENDE	
												
		

}

			



	
			
									
			
			
	
			
		
	
	}}
		
	

