package entities;
import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;

/**
 * ...
 * @author Me
 */
class Background extends Entity{

	public function new(name:String) {
		super(0, 0, new Image("graphics/" + name + ".png"));
		layer = 1000;
	}
	
}