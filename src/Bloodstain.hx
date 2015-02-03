package ;
import com.haxepunk.Entity;
import com.haxepunk.graphics.Graphiclist;
import com.haxepunk.graphics.Image;

/**
 * ...
 * @author Me
 */
class Bloodstain extends Entity{

	public function new(x:Float, y:Float, angle:Float, magnitude:Float, death:Bool, deadType:String = "") {
		var image:Image;
		var list:Graphiclist = new Graphiclist();
		var count:Int = 10;
		if (death) {
			count = 20;
		}
		for (i in 0... count) {
			image = new Image("graphics/basepixel.png");
			image.color = 0xaa1111;
			image.scaleY = 1;
			image.scaleX = Math.random() * magnitude;
			
			var angleAdjust:Float = Math.random();
			var angleRads:Float = Math.atan(5 / (magnitude * 8));
			angleAdjust *= 2;
			angleAdjust -= 1;
			angleAdjust *= 360 * (angleRads / Math.PI) ;
			
			image.angle = -(angle + angleAdjust);
			var imageAngleRads:Float = image.angle * Math.PI / 180;
			
			image.x = Math.cos(imageAngleRads) * 5 + Math.random() * 5;
			image.y = Math.sin(imageAngleRads) * 5 + Math.random() * 5;
			list.add(image);
		}
		/*if (death) {
			image = new Image("graphics/Dead" + deadType + ".png");
			if (angle > 90 && angle < 270) {
				image.flipped = true;
				image.x = -30;
				image.y = -10;
			}
			else {
				image.flipped = false;
				image.x = 20;
				image.y = -10;
			}
			list.add(image);
		}*/
		super(x, y, list);
		layer = 999;
	}
	
}