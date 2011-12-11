package 
{
   	import org.flixel.*;
	import com.greensock.*;
	import com.greensock.easing.*;
	
    public class Supertext extends FlxState
    {
	
	


		public var counter:Number = 0;
		private var supertext:FlxText; 
		public var buchstaben:Array;

        override public function Supertext(buchstaben:Array):void
	{
		
		
		
		
		
	

		
        }       override public function update():void
        {



counter += FlxG.elapsed;

supertext.text = "" + storietex(buchstaben,1,0.5);
		
				
			
            super.update();
				

		
        }
  
		

		
		 override public function create():void
{
		supertext = new FlxText(122,0,FlxG.width);
		supertext.shadow = 0xff000000;
			supertext.text = "";
			supertext.scrollFactor.x = supertext.scrollFactor.y = 0;

			add(supertext);


}






public function storietex(buchstaben:Array,starttime:uint,txtspeed:uint):String
{

var storietex:String = "";
//var _counter:Number=_counter;
var _counter:Number;
	  
_counter = starttime;

var i:uint;
for (i=0;i < (buchstaben.length);i++)
{

if (counter >= _counter )
	{
	
	//	counter = 0;
	storietex = storietex + (buchstaben[i]);
	_counter = _counter +0.25;
	
	}

}


 return storietex;

	
}		
	
		
}}





