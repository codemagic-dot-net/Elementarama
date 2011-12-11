package scenes
{
    import org.flixel.*;
	import com.greensock.*;
import com.greensock.easing.*;
	
    public class MovControlls extends FlxState
    {
	
[Embed(source='../data/Images/ImgInstr.png')] private var ImgControlls:Class;
	
        override public function MovControlls():void
	{
		
		
		
		
		
				var x:FlxSprite;
		x = new FlxSprite();
//s.createGraphic(16, 16);
x.loadGraphic(ImgControlls, true,false,640,480);
add(x);	



TweenMax.to(x, 20, { x:2, y:2, alpha:1.7,delay:0,repeat:-1,yoyo:true});

/*
		
		var tx:FlxText;
			tx = new FlxText(2,0,FlxG.width,"Press Arrow Keys to move");
			tx.scrollFactor.x = tx.scrollFactor.y = 0;
			tx.color = 0xffffff;
			add(tx);
				tx = new FlxText(2,20,FlxG.width,"Press SPACE to jump");
			tx.scrollFactor.x = tx.scrollFactor.y = 0;
			tx.color = 0xffffff;
			add(tx);


	tx = new FlxText(2, FlxG.height - 60,FlxG.width,"Hi, I'm the princess");
			tx.scrollFactor.x = tx.scrollFactor.y = 0;
			tx.color = 0xffffff;
			
			add(tx);
			
			tx = new FlxText(2,FlxG.height-40,FlxG.width,"I love beeing rescued, so good luck!");
			tx.scrollFactor.x = tx.scrollFactor.y = 0;
			tx.color = 0xffffff;
		
			add(tx);

			tx = new FlxText(2,FlxG.height-20,FlxG.width,"Press SPACE to Start");
			tx.scrollFactor.x = tx.scrollFactor.y = 0;
			tx.color = 0xffffff;
	
			add(tx); */
		
        }
        override public function update():void
        {
              
		
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


}
		
		
}}
