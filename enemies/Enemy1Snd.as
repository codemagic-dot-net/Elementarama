package enemies
{
	import org.flixel.*;

public class Enemy1Snd extends FlxSound 
{
	
	
		[Embed(source = '../data/Sound/SndEnemy1.mp3')] protected var Snd1:Class;
		
		
	public function Enemy1Snd ()
	{
		loadEmbedded(Snd1, false);	
	}

	override public function play(): void 
	{
		if(!playing)
		{
			super.play();
		}
	}
}}