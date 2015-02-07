package entities ;
import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;

/**
 * ...
 * @author Me
 */
class QuarterBlock extends Entity{

	
	var particles:Particles;
	public function new(x:Int, y:Int, part:Particles) {
		super(x, y, new Image("graphics/BlockQuarter.png"));
		setHitbox(8,12, 0, 0);
		type = "quarterblock";
		layer = -1 * Std.int(y);
		
		particles = part;
	}
	
	public function hit(x:Float, y:Float ) {
		particles.wallhit(x, y);
	}
	
}