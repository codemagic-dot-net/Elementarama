package layers
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Marcel Flaig
	 */
	public class Map101Background extends FlxSprite	{
		
[Embed(source='../data/Images/ImgBackground101.png')]		private var ImgBG:Class;		// Background
[Embed(source='../data/Images/ImgBgWires.png')]		private var ImgBgWires:Class;		// Background
[Embed(source='../data/Images/ImgGreen.png')]		private var ImgGreen:Class;		// Background

[Embed(source = '../data/Images/ImgCloud2.png')] 			private var ImgFront301:Class;	

	public var tilesize:uint = 32;
				private var i:uint;
				private var decoration:FlxSprite;
		
				private var neuy:uint=0//tilesize*20;// gibt an wieivel tiles nach unten verschoben werden soll im vergleichzu map101 vom 09-08-10
				
				
				
				public function Map101Background() 
		
		
		{
									
	FlxState.bgColor = 0x00000000;

	// Wires in the Background
	decoration = new FlxSprite(0,550,ImgBgWires);
	decoration.moves = true;
	decoration.solid = false;
	decoration.scale.x = -1;
	decoration.scale.y = 1;
	decoration.scrollFactor.x = 0.200000;
	decoration.scrollFactor.y = 0.000000;
	
	decoration.scale.x = FlxG.ResolutionScaleX;
	decoration.scale.y = FlxG.ResolutionScaleY;	
	decoration.width = 	decoration.width * FlxG.ResolutionScaleX;
		decoration.height = 	decoration.height * FlxG.ResolutionScaleY;
		decoration.offset.y = 	decoration.offset.y * FlxG.ResolutionScaleY;
	decoration.offset.x = 	decoration.offset.x * FlxG.ResolutionScaleY;
		decoration.x = decoration.x * FlxG.ResolutionScaleX;
		decoration.y = decoration.y * FlxG.ResolutionScaleY;
	
		FlxG.state.add(decoration);
		decoration = new FlxSprite(600,450,ImgBgWires);
	decoration.moves = true;
	decoration.solid = false;
	decoration.scale.x = -1;
	decoration.scale.y = 1;
	decoration.scrollFactor.x = 0.200000;
	decoration.scrollFactor.y = 0.000000;
	decoration.scale.x = FlxG.ResolutionScaleX;
	decoration.scale.y = FlxG.ResolutionScaleY;	
	decoration.width = 	decoration.width * FlxG.ResolutionScaleX;
		decoration.height = 	decoration.height * FlxG.ResolutionScaleY;
		decoration.offset.y = 	decoration.offset.y * FlxG.ResolutionScaleY;
	decoration.offset.x = 	decoration.offset.x * FlxG.ResolutionScaleY;
		decoration.x = decoration.x * FlxG.ResolutionScaleX;
		decoration.y = decoration.y * FlxG.ResolutionScaleY;
	
		FlxG.state.add(decoration);	

	
	
	// Wires end
	
	
	//& Green
	
		decoration = new FlxSprite(1000,0,ImgGreen);
	decoration.moves = true;
	decoration.solid = false;
	decoration.scale.x = -1;
	decoration.scale.y = 1;
	decoration.scrollFactor.x = 0.200000;
	decoration.scrollFactor.y = -0.200000;
	
	
	decoration.scale.x = FlxG.ResolutionScaleX;
	decoration.scale.y = FlxG.ResolutionScaleY;	
	decoration.width = 	decoration.width * FlxG.ResolutionScaleX;
		decoration.height = 	decoration.height * FlxG.ResolutionScaleY;
		decoration.offset.y = 	decoration.offset.y * FlxG.ResolutionScaleY;
	decoration.offset.x = 	decoration.offset.x * FlxG.ResolutionScaleY;
		decoration.x = decoration.x * FlxG.ResolutionScaleX;
		decoration.y = decoration.y * FlxG.ResolutionScaleY;
	
	FlxG.state.add(decoration);
	
	
	//animated
		decoration = new FlxSprite(0, 0);
		decoration.loadGraphic(ImgGreen, true, true,1024,768);
decoration.addAnimation("normal", [0,1, 2], 5, true);
decoration.play("normal");	
decoration.moves = true;
	decoration.solid = false;
	decoration.scale.x = -1;
	decoration.scale.y = 1;
	decoration.scrollFactor.x = 0.200000;
	decoration.scrollFactor.y = -0.200000;
	
	
	decoration.scale.x = FlxG.ResolutionScaleX;
	decoration.scale.y = FlxG.ResolutionScaleY;	
	decoration.width = 	decoration.width * FlxG.ResolutionScaleX;
		decoration.height = 	decoration.height * FlxG.ResolutionScaleY;
		decoration.offset.y = 	decoration.offset.y * FlxG.ResolutionScaleY;
	decoration.offset.x = 	decoration.offset.x * FlxG.ResolutionScaleY;
		decoration.x = decoration.x * FlxG.ResolutionScaleX;
		decoration.y = decoration.y * FlxG.ResolutionScaleY;
	
	
	FlxG.state.add(decoration);
		

	
	
	//Green End
	
	//
	decoration = new FlxSprite(10*tilesize,neuy+200,ImgBG);
	decoration.moves = true;
	decoration.solid = false;
	decoration.scale.x = -1;
	decoration.scale.y = 1;
				decoration.scrollFactor.x = 0.200000;
			decoration.scrollFactor.y = -0.000000;
			
			
			decoration.scale.x = FlxG.ResolutionScaleX;
	decoration.scale.y = FlxG.ResolutionScaleY;	
	decoration.width = 	decoration.width * FlxG.ResolutionScaleX;
		decoration.height = 	decoration.height * FlxG.ResolutionScaleY;
		decoration.offset.y = 	decoration.offset.y * FlxG.ResolutionScaleY;
	decoration.offset.x = 	decoration.offset.x * FlxG.ResolutionScaleY;
		decoration.x = decoration.x * FlxG.ResolutionScaleX;
		decoration.y = decoration.y * FlxG.ResolutionScaleY;
	
		FlxG.state.add(decoration);
		

			
	

	 
		 decoration = new FlxSprite(35*tilesize,neuy+200,ImgBG);
	decoration.moves = true;
		decoration.solid = false;
		decoration.scale.x = 1;
		decoration.scale.y = 1;
				decoration.scrollFactor.x = 0.200000;
			decoration.scrollFactor.y = -0.000000;

			decoration.scale.x = FlxG.ResolutionScaleX;
	decoration.scale.y = FlxG.ResolutionScaleY;	
	decoration.width = 	decoration.width * FlxG.ResolutionScaleX;
		decoration.height = 	decoration.height * FlxG.ResolutionScaleY;
		decoration.offset.y = 	decoration.offset.y * FlxG.ResolutionScaleY;
	decoration.offset.x = 	decoration.offset.x * FlxG.ResolutionScaleY;
		decoration.x = decoration.x * FlxG.ResolutionScaleX;
		decoration.y = decoration.y * FlxG.ResolutionScaleY;
	
			
		FlxG.state.add(decoration);
		

			

			
			
		 decoration = new FlxSprite(75*tilesize,neuy+500,ImgBG);
	decoration.moves = true;
		decoration.solid = false;

				decoration.scrollFactor.x = 0.200000;
			decoration.scrollFactor.y = 0.200000;
				decoration.scale.y = 0.000000;
				decoration.scale.x = -0.200000;
				decoration.facing = RIGHT;
	
				decoration.scale.x = FlxG.ResolutionScaleX;
	decoration.scale.y = FlxG.ResolutionScaleY;	
	decoration.width = 	decoration.width * FlxG.ResolutionScaleX;
		decoration.height = 	decoration.height * FlxG.ResolutionScaleY;
		decoration.offset.y = 	decoration.offset.y * FlxG.ResolutionScaleY;
	decoration.offset.x = 	decoration.offset.x * FlxG.ResolutionScaleY;
		decoration.x = decoration.x * FlxG.ResolutionScaleX;
		decoration.y = decoration.y * FlxG.ResolutionScaleY;
	
				
			FlxG.state.add(decoration);
		
		
					 decoration = new FlxSprite(40 * tilesize, neuy+200, ImgBG);
					 
					 decoration.facing =RIGHT; 
	decoration.moves = true;
		decoration.solid = false;
		decoration.scale.x = -0.5;
		decoration.scale.y = -0.5;
				decoration.scrollFactor.x = 0.001000;
				decoration.facing  = decoration.left;
				decoration.scrollFactor.y = -0.000000;
				
				
				decoration.scale.x = FlxG.ResolutionScaleX;
	decoration.scale.y = FlxG.ResolutionScaleY;	
	decoration.width = 	decoration.width * FlxG.ResolutionScaleX;
		decoration.height = 	decoration.height * FlxG.ResolutionScaleY;
		decoration.offset.y = 	decoration.offset.y * FlxG.ResolutionScaleY;
	decoration.offset.x = 	decoration.offset.x * FlxG.ResolutionScaleY;
		decoration.x = decoration.x * FlxG.ResolutionScaleX;
		decoration.y = decoration.y * FlxG.ResolutionScaleY;
	
				FlxG.state.add(decoration);
		

	 
		// WOlken
		
		
		for (i = 0; i < 8; i++) {	 
		decoration = new FlxSprite(40*i*tilesize,neuy+0,ImgFront301);
	decoration.moves = true;
		decoration.solid = false;
		decoration.scale.x = 1;
		decoration.scale.y = 1;
				decoration.scrollFactor.x = 0.600000;
			decoration.scrollFactor.y = 0.600000;
			
			decoration.scale.x = FlxG.ResolutionScaleX;
	decoration.scale.y = FlxG.ResolutionScaleY;	
	decoration.width = 	decoration.width * FlxG.ResolutionScaleX;
		decoration.height = 	decoration.height * FlxG.ResolutionScaleY;
		decoration.offset.y = 	decoration.offset.y * FlxG.ResolutionScaleY;
	decoration.offset.x = 	decoration.offset.x * FlxG.ResolutionScaleY;
		decoration.x = decoration.x * FlxG.ResolutionScaleX;
		decoration.y = decoration.y * FlxG.ResolutionScaleY;
	
				FlxG.state.add(decoration);}

						for (i = 0; i < 8; i++) {	 
		decoration = new FlxSprite(60*i*tilesize,neuy+50,ImgFront301);
	decoration.moves = true;
		decoration.solid = false;
		decoration.scale.x = 1.5;
		decoration.scale.y = 1.5;
				decoration.scrollFactor.x = -0.650000;
			decoration.scrollFactor.y = -0.000000;
			
			decoration.scale.x = FlxG.ResolutionScaleX;
	decoration.scale.y = FlxG.ResolutionScaleY;	
	decoration.width = 	decoration.width * FlxG.ResolutionScaleX;
		decoration.height = 	decoration.height * FlxG.ResolutionScaleY;
		decoration.offset.y = 	decoration.offset.y * FlxG.ResolutionScaleY;
	decoration.offset.x = 	decoration.offset.x * FlxG.ResolutionScaleY;
		decoration.x = decoration.x * FlxG.ResolutionScaleX;
		decoration.y = decoration.y * FlxG.ResolutionScaleY;
	
				FlxG.state.add(decoration);}
}

			

			
			
			



			
			
												
		


	
			
									
			
			
	
			
		
	
	}}
		
	

