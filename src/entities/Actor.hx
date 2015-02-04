package entities ;
import com.haxepunk.debug.Console;
import com.haxepunk.Entity;
import com.haxepunk.Graphic.TileType;
import com.haxepunk.graphics.Graphiclist;
import com.haxepunk.graphics.Image;
import com.haxepunk.graphics.Spritemap;
import com.haxepunk.math.Vector;
import com.haxepunk.Sfx;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;
import com.haxepunk.Graphic;
import com.haxepunk.HXP;

import globals.InputBuffer;
import globals.Weapon;

/**
 * ...
 * @author Me
 */
class Actor extends Entity {
	
	var actorType:String;
	var player:String;
	
	var flipped:Bool;
	var sprite:Spritemap;
	var images:Graphiclist;
	var directionVector:Vector;
	var directionMagnitude:Float = 0.9;
	var velocityVector:Vector;
	
	var shooting:Bool = false;
	
	var weaponImage:Image;
	var healthBar:Image; 
	var ammoBar:Image;
	var ammoCount:Int;
	
	var timeSinceLastShot:Int = 0;
	var reloading:Bool = false;
	var reloadDelay:Int;
	
	var aim:Image;
	var aimAngle:Float;
	var aimPos:Vector;
	
	var aimFrames:Int = 0;
	
	var weapon:Weapon;
	public var armored:Bool;
	
	var health:Float = 100;
	
	var dead:Bool = false;
	var particles:Particles;
	
	var shootSound:Sfx;

	public function new(posX:Int, posY:Int, faction:String, initialDirectionLeft:Bool, input:String, gun:Weapon, armor:Bool, part:Particles) {
		
		player = input;
		actorType = faction;
		flipped = initialDirectionLeft;
		
		sprite = new Spritemap("graphics/"+faction+".png", 15, 30);
		sprite.add("idle", [0]);
		sprite.add("walking", [0, 1, 1, 0, 2, 2], 6, true);
		
		sprite.play("idle");
		
		
		aim = new Image("graphics/"+faction+"aim.png");
		aim.visible = false;
		aim.relative = true;
		aim.x = 8;
		aim.y = 20;
		aim.scaleX = gun.accuracy / 200.0;
		
		armored = armor;
		
		shootSound = new Sfx("audio/" +gun.name+".wav");
		
		weapon = gun;
		weaponImage = new Image("graphics/"+gun.name+".png");
		weaponImage.relative = true;
		weaponImage.originX = gun.originX;
		weaponImage.originY = gun.originY;
		
		
		healthBar = new Image("graphics/basepixel.png");
		healthBar.scaleY = 4;
		healthBar.scaleX = 25;
		healthBar.x = -5;
		healthBar.y = -7;
		healthBar.color = 0x00ff00;
		
		ammoBar = new Image("graphics/basepixel.png");
		ammoBar.scaleY = 2;
		ammoBar.scaleX = 25;
		ammoBar.x = -5;
		ammoBar.y = -1;
		ammoBar.color = 0xdddd11;
		
		ammoCount = weapon.ammo;
		
		
		var g:Array<Graphic> = new Array<Graphic>();
		g.push(sprite);
		g.push(aim);
		g.push(weaponImage);
		g.push(healthBar);
		g.push(ammoBar);
		images = new Graphiclist(g);
		directionVector = new Vector(0, 0);
		super(posX, posY, images);
		setHitbox(11, 23, -2, -7);
		type = faction;
		
		flip();
		
		particles = part;
		
		layer = -1000;
		
	}
	
	public function hit(damage:Float, bulletX:Float, bulletY:Float, angle:Float) {
		if(armored){
			health -= damage * 0.7;
			scene.add(new Bloodstain(bulletX, bulletY, angle, damage * 0.3, false)); 
		}
		else {
			health -= damage;
			scene.add(new Bloodstain(bulletX, bulletY + 8, angle, damage, false)); 
		}
		healthBar.scaleX = health / 4.0;
		particles.bloodSpatter(bulletX, bulletY, angle);
		if (health <= 0 && !dead) {
			dead = true;
			particles.death(x + 2, y + 7, 11, 23);
			scene.add(new Bloodstain(bulletX, y + 24 + Math.random() * 10, angle, 20, true, actorType));
			destroy();
		}
	}
	
	private function handleInput():Void {
		directionVector = new Vector(0, 0);
		timeSinceLastShot++;
		ammoBar.scaleX = (1.0 * ammoCount / weapon.ammo) * 25;
		if (reloading) {
			reloadDelay--;
			ammoBar.scaleX =  (weapon.reloadDelay - reloadDelay) * 1.0 / weapon.reloadDelay * 25;
			if (reloadDelay == 0) {
				reloading = false;
				ammoCount = weapon.ammo;
			}
		}
		else if (shooting) {
			adjustAim();
			if (InputBuffer.pressed(player, "btn2")) {
				shooting = false;
				aim.visible = false;
			}
			if (InputBuffer.down(player, "btn1")) {
				if (ammoCount == 0) {
					reloading = true;
				}
				else if (timeSinceLastShot >= weapon.fireDelay) {
					timeSinceLastShot = 0;
					shoot();
					ammoCount--;
					reloadDelay = weapon.reloadDelay;
				}
			}
		}
		else {
			//adjustAim(true);
			if (InputBuffer.down(player, "up")) {
				directionVector.y -= 1;
			}
			if (InputBuffer.down(player, "down")) {
				directionVector.y += 1;
			}
			if (InputBuffer.down(player, "left")) {
				directionVector.x -= 1;
			}
			if (InputBuffer.down(player, "right")) {
				directionVector.x += 1;
			}
			if (directionVector.x != 0 && directionVector.y != 0) {
				directionVector = directionVector * 0.7;
			}
			
			if (InputBuffer.pressed(player, "btn2")) {
				shooting = true;
				aim.visible = true;
				aimPos = new Vector(x + 8, y + 22);
			}
			if(directionVector.x != 0 || directionVector.y != 0){
				if (directionVector.x > 0) {
					aimAngle = (Math.asin(directionVector.y) * -180 / Math.PI);
				}
				else if (directionVector.x <= 0){
					aimAngle = (Math.asin(directionVector.y) * 180 / Math.PI + 180);
				}
			}
			adjustAim(true);
			
			if (InputBuffer.down(player, "btn1")) {
				if (ammoCount == 0) {
					reloading = true;
				}
				else if (timeSinceLastShot >= weapon.fireDelay) {
					timeSinceLastShot = 0;
					shoot(0.6);
					ammoCount--;
					reloadDelay = weapon.reloadDelay;
				}
			}
		}
	}
	
	private function movePlayer():Void {
		velocityVector = directionVector * directionMagnitude;
		moveBy(velocityVector.x, velocityVector.y, "block");
	}
	
	private function updateAnimation():Void {
		//weaponImage.angle = 0;
		if (velocityVector.length == 0) {
			sprite.play("idle");
		}
		else {
			sprite.play("walking");
		}
		if (!sprite.flipped && velocityVector.x > 0) {
			flip();
		}
		else if (sprite.flipped && velocityVector.x < 0) {
			flip();
		}
	}
	
	private function adjustAim(moving:Bool = false) {
		if(!moving){
			if (InputBuffer.down(player, "left")) {
				aimAngle += (400.0 / weapon.accuracy);
			}
			if (InputBuffer.down(player, "right")) {
				aimAngle -= (400.0 / weapon.accuracy);
			}
		}
		aimAngle %= 360;
		aim.angle = aimAngle;
		
		if (aimAngle > 90 && aimAngle < 270) {
			
			sprite.flipped = false;
			weaponImage.flipped = false;
			flipped = false;
			weaponImage.angle = 180 + aimAngle;
		}
		else {
			sprite.flipped = true;
			weaponImage.flipped = true;
			flipped = true;
			weaponImage.angle = aimAngle;
		}
	}
	
	
	private function shoot(accuracy:Float = 1.0) {
		var bulletX:Float;
		var bulletY:Float;
		if (flipped) {
			bulletX = weapon.rightPosX + x;
			bulletY = weapon.rightPosY + y;
		}
		else {
			bulletX = weapon.leftPosX + x;
			bulletY = weapon.leftPosY + y;
		}
		for (i in 0... weapon.bulletCount) {
			var angleAdjust:Float = Math.random();
			var angleRads:Float = Math.atan(5 / (weapon.accuracy * accuracy));
			angleAdjust *= 2;
			angleAdjust -= 1;
			angleAdjust *= 360 * (angleRads / Math.PI) ;
			scene.add(new Bullet(bulletX, bulletY, aimAngle + angleAdjust, 10, weapon.damage, weapon.penetration, this,weapon.accuracy));
			particles.gunShot(bulletX, bulletY, aimAngle);
			shootSound.play();
		}
	}
	
	private function flip() {
		if (flipped) {
			sprite.flipped = false;
			weaponImage.flipped = false;
			flipped = false;
		}
		else {
			sprite.flipped = true;
			weaponImage.flipped = true;
			flipped = true;
		}
	}
	private function setWeaponPos() {
		if (sprite.flipped) {
			weaponImage.x = weapon.rightPosX;
			weaponImage.y = weapon.rightPosY;
		}
		else{
			weaponImage.x = weapon.leftPosX;
			weaponImage.y = weapon.leftPosY;
		}
		
		if ((aimAngle % 360 == 0) && sprite.flipped) {
			weaponImage.x = weapon.rightPosX+ weapon.originX / 2;
		}
	}
	
	public override function update():Void {
		super.update();
		
		sprite.update();
		handleInput();
		if(!shooting){
			movePlayer();
			updateAnimation();
		}
		else {
			sprite.play("idle");
		}
		setWeaponPos();
		//layer = -1 * Std.int(y);
	}
	
	public override function render() {
		super.render();
	}
	
	public function destroy() {
		HXP.scene.remove(this);
	}
	
}