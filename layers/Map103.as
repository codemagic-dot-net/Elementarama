//Code generated by Flan. http://www.tbam.com.ar/utility--flan.php

package layers {
	import org.flixel.*;
	
	public class Map103 extends MapBase {
		//Media content declarations
//[Embed(source='data/Maps/MapCSV_101_Foreground.txt', mimeType = "application/octet-stream")]  public var CSV_Foreground:Class;
//[Embed(source='data/Images/nurTreppen64Unsichtbar.png')]   public var Img_Foreground:Class;
//[Embed(source='data/Maps/MapCSV_101_Background.txt', mimeType = "application/octet-stream")] public var CSV_Background:Class;
//[Embed(source='data/Images/nurTreppen64Unsichtbar.png')]   public var Img_Background:Class;
[Embed(source='../data/Maps/MapCSV_103_Map.txt', mimeType = "application/octet-stream")] public var CSV_Map:Class;
[Embed(source='../data/Images/nurTreppen64Unsichtbar.png')]   public var Img_Map:Class;
//[Embed(source='data/Maps/MapCSV_101_Faraway.txt', mimeType = "application/octet-stream")]  public var CSV_Faraway:Class;
//[Embed(source='data/Images/nurTreppen64Unsichtbar.png')]    public var Img_Faraway:Class;
		
		
		public function Map103() {

	_setCustomValues();

			//bgColor = 0xff464646;

			//layerForeground = new FlxTilemap(new CSV_Foreground, Img_Foreground,1,1);

			
	/*		
layerForeground = new FlxTilemap()
layerForeground.startingIndex = 1  // It might be this by default but I threw it in
layerForeground.collideIndex = 1    // 5 from the previous code
layerForeground.drawIndex = 0      // 0 from the previous code
layerForeground.loadMap(new CSV_Foreground, Img_Foreground, 32, 32);     // 26x26 is my tile size 32x32 meine

// :) 
			
			
			layerForeground.x = 0;
			layerForeground.y = 0;
			layerForeground.scrollFactor.x = 1.000000;
			layerForeground.scrollFactor.y = 1.000000;
			
	
			
			//layerBackground = new FlxTilemap(new CSV_Background, Img_Background,1,1);
		
				layerBackground = new FlxTilemap()
			
			
			layerBackground.startingIndex = 0  // It might be this by default but I threw it in
layerBackground.collideIndex = 1000    // 5 from the previous code
layerBackground.drawIndex = 1      // 0 from the previous code
layerBackground.loadMap(new CSV_Background, Img_Background, 32,32);     // 26x26 is my tile size

			
			
			layerBackground.x = 0;
			layerBackground.y = 0;
			layerBackground.scrollFactor.x = 0.600000;
			layerBackground.scrollFactor.y = 1.000000;
			
		
			//layerBackground = new FlxTilemap(new CSV_Background, Img_Background,1,1);
		
				layerFaraway = new FlxTilemap()
			
			
			//layerFaraway.startingIndex = 0  // It might be this by default but I threw it in
layerFaraway.collideIndex = 1000    // 5 from the previous code
layerFaraway.drawIndex = 9   // 0 from the previous code
layerFaraway.loadMap(new CSV_Faraway, Img_Faraway, 32,32);     // 26x26 is my tile size

			
			
			layerFaraway.x = 0;
			layerFaraway.y = 0;
			layerFaraway.scrollFactor.x = 0.600000;
			layerFaraway.scrollFactor.y = 0.600000;
						
	*/
			layerMap = new FlxTilemap()
		
			layerMap.startingIndex = 0  // It might be this by default but I threw it in
layerMap.collideIndex = 1    // 5 from the previous code
layerMap.drawIndex = 2
// 0 from the previous code
layerMap.loadMap(new CSV_Map, Img_Map, 32, 32);     // 26x26 is my tile size

			
			
			
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
		}

		override public function customFunction(param:* = null):* {

		}

		private function _setCustomValues():void {
		}

	}
}
