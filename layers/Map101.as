//Code generated by Flan. http://www.tbam.com.ar/utility--flan.php

package  layers
{
	import org.flixel.*;
	
	public class Map101 extends MapBase {
		//Media content declarations
//[Embed(source='data/Maps/MapCSV_101_Foreground.txt', mimeType = "application/octet-stream")]  public var CSV_Foreground:Class;
//[Embed(source='data/Images/nurTreppen64Unsichtbar.png')]   public var Img_Foreground:Class;
//[Embed(source='data/Maps/MapCSV_101_Background.txt', mimeType = "application/octet-stream")] public var CSV_Background:Class;
//[Embed(source='data/Images/nurTreppen64Unsichtbar.png')]   public var Img_Background:Class;
[Embed(source='../data/Maps/MapCSV_101_Map.txt', mimeType = "application/octet-stream")] public var CSV_Map:Class;
[Embed(source = '../data/Images/nurTreppen64Unsichtbar.png')]   public var Img_Map:Class;
[Embed(source='../data/Images/nurTreppen64Unsichtbar2.png')]   public var Img_Map2:Class;

//[Embed(source='data/Maps/MapCSV_101_Faraway.txt', mimeType = "application/octet-stream")]  public var CSV_Faraway:Class;
//[Embed(source='data/Images/nurTreppen64Unsichtbar.png')]    public var Img_Faraway:Class;
		
		
		public function Map101() {

	_setCustomValues();

		
			layerMap = new FlxTilemap()
		
			layerMap.startingIndex = 0  // It might be this by default but I threw it in
layerMap.collideIndex = 1    // 5 from the previous code
layerMap.drawIndex = 2
// 0 from the previous code
if(FlxG.Resolution == "1024x768"){layerMap.loadMap(new CSV_Map, Img_Map, 32, 32);     // 26x26 is my tile size

}
	if(FlxG.Resolution == "640x480"){layerMap.loadMap(new CSV_Map, Img_Map, 20, 20);     // 26x26 is my tile size

}		
			
		layerMap.x = 0;
		layerMap.y = 0;
		layerMap.scrollFactor.x = 1.000000;
		layerMap.scrollFactor.y = 1.000000;

		allLayers = [ layerForeground, layerFaraway , layerBackground, layerMap];

		mainLayer = layerMap;

			boundsMinX = 0;
			boundsMinY = 0;
			boundsMaxX = 16000;
			boundsMaxY = 640;
			
				if(FlxG.Resolution == "640x480"){boundsMinX = 0;
			boundsMinY = 0;
			boundsMaxX = 16000*FlxG.ResolutionScaleX;
			boundsMaxY = 640*FlxG.ResolutionScaleY;    

}
		}

		override public function customFunction(param:* = null):* {

		}

		private function _setCustomValues():void {
		}

	}
}