import com.haxepunk.Engine;
import com.haxepunk.HXP;
import scenes.MenuScene;
import globals.InputBuffer;
class Main extends Engine
{

	override public function init()
	{
#if debug
		HXP.console.enable();
#end
		HXP.scene = new MenuScene();
		InputBuffer.init();
		
	}

	public static function main() {	new Main(); }

}