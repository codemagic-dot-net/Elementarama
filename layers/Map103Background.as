package layers 
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Marcel Flaig
	 */
	public class Map103Background extends FlxObject	{
		
[Embed(source='../data/Images/ImgBackground101.png')]		private var ImgBG:Class;		// Background
[Embed(source='../data/Images/ImgCloud2.png')] private var ImgFront301:Class;	
	public var tilesize:uint = 32;
				private var i:uint;
				
		public function Map103Background() 
		{
									
	FlxState.bgColor = 0x00000000;
	
	var decoration:FlxSprite = new FlxSprite(50*tilesize,200,ImgBG);
	decoration.moves = true;
		decoration.solid = false;
		decoration.scale.x = 1;
		decoration.scale.y = 1;
				decoration.scrollFactor.x = 0.200000;
			decoration.scrollFactor.y = 0.200000;
		FlxG.state.add(decoration);
		

			
	

	 
		 decoration = new FlxSprite(65*tilesize,200,ImgBG);
	decoration.moves = true;
		decoration.solid = false;
		decoration.scale.x = 1;
		decoration.scale.y = 1;
				decoration.scrollFactor.x = 0.200000;
			decoration.scrollFactor.y = 0.200000;
			//		decoration.facing = left;
		FlxG.state.add(decoration);
		

			
		 decoration = new FlxSprite(35*tilesize,200,ImgBG);
	decoration.moves = true;
		decoration.solid = false;
		decoration.scale.x = 1;
		decoration.scale.y = 1;
				decoration.scrollFactor.x = 0.200000;
			decoration.scrollFactor.y = 0.200000;
			//		decoration.facing = left;
		FlxG.state.add(decoration);
		

			
			
	
		
		
					 decoration = new FlxSprite(40 * tilesize, 200, ImgBG);
					 
					 decoration.loadGraphic(ImgBG, false, true); 
	decoration.moves = true;
		decoration.solid = false;
		decoration.scale.x = 0.5;
		decoration.scale.y = 0.5;
				decoration.scrollFactor.x = 0.001000;
				decoration.facing  = decoration.left;
				decoration.scrollFactor.y = 0.001000;
				FlxG.state.add(decoration);
		

	 
		// WOlken
		
		
		for (i = 0; i < 8; i++) {	 
		decoration = new FlxSprite(30*i*tilesize,0,ImgFront301);
	decoration.moves = true;
		decoration.solid = false;
		decoration.scale.x = 1;
		decoration.scale.y = 1;
				decoration.scrollFactor.x = 0.600000;
			decoration.scrollFactor.y = 0.600000;
				FlxG.state.add(decoration);}

						for (i = 0; i < 8; i++) {	 
		decoration = new FlxSprite(75*i*tilesize,50,ImgFront301);
	decoration.moves = true;
		decoration.solid = false;
		decoration.scale.x = 1.5;
		decoration.scale.y = 1.5;
				decoration.scrollFactor.x = 0.650000;
			decoration.scrollFactor.y = 0.650000;
				FlxG.state.add(decoration);}
}

			

			
			
			



			
			
												
		


	
			
									
			
			
	
			
		
	
	}}
		
	

