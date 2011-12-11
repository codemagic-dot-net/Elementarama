package 

{
	import org.flixel.*; //Allows you to refer to flixel objects in your code
	import scenes.*;
	
	[SWF(width="1024", height="768", backgroundColor="#464646")] //Set the size and color of the Flash file
 
	public class Preloader extends FlxGame
	{
		
		private var resx:uint;
		private var resy:uint;
		public function Preloader()
		{
			
	//	super(640,480,Logo,1);
			//super(640, 480, PlayState, 1); //Create a new FlxGame object at 320x240 with 2x pixels, then load PlayState
	//super(1024, 768, PlayState, 1); //Create a new FlxGame object at 320x240 with 2x pixels, then load PlayState
				
	
	if(FlxG.Resolution=="1024x768"){ 
	resx = 1024;
	resy = 768;
		FlxG.ResolutionScaleX = 1;		
			FlxG.ResolutionScaleY = 1;
				FlxG.tilesize = 32;
	}
			if(FlxG.Resolution=="640x480")
		{ 
	resx = 640;
	resy = 480;
	FlxG.ResolutionScaleX = 0.625;
	FlxG.ResolutionScaleY = 0.625;		}	
				FlxG.tilesize = 20;
				
				super(resx,resy,PlayState,1); 
		}
	}
}