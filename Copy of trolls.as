package 
{
    import org.flixel.*;
	import com.greensock.*;
import com.greensock.easing.*;
	
    public class trolls extends FlxState
    {
	
		[Embed(source = 'SprNinja.png')] private var SprNinja:Class;
		[Embed(source = 'PrincessPeach.png')] private var SprPrincess:Class;
		 [Embed(source='arrow-sprite.png')] private var SprArrows:Class;


public var counter:Number = 0;
			public var score:FlxText;		// Score 

        override public function trolls():void
	{
		
		
		
		
		
		
		

		
        }
        override public function update():void
        {





counter += FlxG.elapsed;

score.text = "" + slowtext("A", "R"," S", "c","H","Ir" );
		
				     if (FlxG.keys.pressed("SPACE"))
            {                 FlxG.flash.start(0xffffffff, 1.75);
                FlxG.fade.start(0xff000000, 2, onFade);

			
				
				
            }
			
			
	
			
			
            super.update();
				
           
			
			
	
			
			
            super.update();
        }
  
		
		        private function onFade():void
        {
				
			FlxG.state = new PlayState();
        }
		
		
		
		 override public function create():void
{
			score = new FlxText(122,0,FlxG.width);
			score.shadow = 0xff000000;
			score.text = "SCORE: ";
			score.scrollFactor.x = score.scrollFactor.y = 0;

			add(score);

}

 public function slowtext(Letter1:String,Letter2:String,Letter3:String,Letter4:String,Letter5:String,Letter6:String):String
{

var tex:String = "";
	 
	  
	  
	  
	  

if (counter >= 2)
	{
	//	counter = 0;
	tex = "" + (Letter1);
	}

if (counter >= 2.5)
	{
	tex = "" + (Letter1)+ (Letter2);
	}

if (counter >= 3)
	{
	tex = "" + (Letter1)+ (Letter2)+ (Letter3);
	}
if (counter >= 3.5)
	{
	tex = "" + (Letter1)+ (Letter2)+ (Letter3)+ (Letter4);
	}
if (counter >= 4)
	{
counter = 0;
	tex = "" + (Letter1)+ (Letter2)+ (Letter3)+ (Letter4)+ (Letter5);
	}
	
 return tex;






	
	
	
}		
		
}}














