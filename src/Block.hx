package ;
import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;

/**
 * ...
 * @author Me
 */
class Block extends Entity{

	
	var particles:Particles;
	public function new(x:Int, y:Int, part:Particles) {
		super(x, y, new Image("graphics/Block.png"));
		setHitbox(32, 36, 0, 0);
		type = "block";
		layer = -1 * Std.int(y);
		
		particles = part;
	}
	
	public function hit(x:Float, y:Float ) {
		particles.wallhit(x, y);
	}
	
}