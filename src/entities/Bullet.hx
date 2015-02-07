package entities ;
import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.HXP;
import com.haxepunk.Sfx;

/**
 * ...
 * @author Me
 */
class Bullet extends Entity {
	
	var sprite:Image;
	var angle:Float;
	var velocityX:Float;
	var velocityY:Float;
	var currentLength:Int;
	var maxLength:Int;
	var penetration:Int;
	var maxPenetration:Int;
	public var damage:Int;
	
	var lengthChanging:Bool;
	var lengthDirection:Int;
	var shooter:Actor;
	
	var immunity:Array<Entity>;
	
	var lifetime:Int = 0;
	
	var deathSound:Sfx;
	var velocity:Float;
	var range:Int;
	

	public function new(initialX:Float, initialY:Float, angle:Float, velocity:Float, damage:Int, pen:Int, firingActor:Actor, range:Int) {
		sprite = new Image("graphics/basepixel.png");
		this.angle = -1 * angle;
		var angleR:Float = this.angle / 180 * Math.PI;
		velocityX = Math.cos(angleR) * velocity;
		velocityY = Math.sin(angleR) * velocity;
		sprite.color = 0xFFF3BA;
		sprite.angle = -1 * this.angle + 180;
		
		currentLength = 0;
		maxLength = Std.int(velocity * 2);
		
		this.range = range;
		
		immunity = new Array<Entity>();
		immunity.push(firingActor);
		
		this.velocity = velocity;
		
		this.damage = damage;
		
		creationCycle();
		
		penetration = pen;
		maxPenetration = pen;
		
		deathSound = new Sfx("audio/BulletDead.wav");
		
		setHitbox(1, 1);
		type = "bullet";
		super(initialX, initialY, sprite);
	}
	
	public override function update() {
		super.update();
		lifetime ++;
		if (lifetime >= 2000) {
			destroy();
		}
		else if (lifetime * velocity > range) {
			damage = Std.int(damage * range / (lifetime * velocity));
		}
		
		if (lengthChanging) {
			currentLength += 2 * lengthDirection;
			sprite.scaleX = currentLength;
			if (currentLength >= maxLength) {
				lengthChanging = false;
			}
			else if (currentLength <= 0) {
				destroy();
			}
		}
		
		
		if(lengthDirection >= 0) {
			moveBy(velocityX, velocityY);
		}
		
		if (collide("Police", x, y) != null) {
			var p:Actor = cast(collide("Police", x, y), Actor);
			if (Lambda.indexOf(immunity, p) < 0) {
				p.hit((1.0 * penetration / maxPenetration) * damage, x, y, angle);
				immunity.push(p);
				penetration--;
				if (p.armored) { penetration--; }
				if (penetration <= 0) { destroyCycle(); }
			}
		}
		if (collide("Suspect", x, y) != null) {
			var p:Actor = cast(collide("Suspect", x, y), Actor);
			if (Lambda.indexOf(immunity, p) < 0) {
				p.hit(((penetration * 1.0) / maxPenetration) * damage, x, y, angle);
				immunity.push(p);
				penetration--;
				if (p.armored) { penetration--; }
				if (penetration <= 0) { destroyCycle(); }
			}
		}
		
		if (collide("block", x, y) != null) {
			var b:Block = cast(collide("block", x, y), Block);
			if (Lambda.indexOf(immunity, b) < 0) {
				immunity.push(b);
				b.hit(x,y);
				penetration-=4;
				if (penetration <= 0) { destroyCycle(); }
			}
		}
		if (collide("quarterblock", x, y) != null) {
			var b:QuarterBlock = cast(collide("quarterblock", x, y), QuarterBlock);
			if (Lambda.indexOf(immunity, b) < 0) {
				immunity.push(b);
				b.hit(x,y);
				penetration-=2;
				if (penetration <= 0) { destroyCycle(); }
			}
		}
		
	}
	
	private function creationCycle() {
		lengthChanging = true;
		lengthDirection = 1;
	}
	
	private function destroyCycle() {
		deathSound.play();
		lengthChanging = true;
		lengthDirection = -3;
	}
	
	public function destroy() {
		HXP.scene.remove(this);
	}
	
}