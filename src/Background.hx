package ;
import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;

/**
 * ...
 * @author Me
 */
class Background extends Entity{

	public function new() {
		super(0, 0, new Image("graphics/Background.png"));
		layer = 1000;
	}
	
}