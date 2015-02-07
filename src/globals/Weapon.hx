package globals ;

/**
 * ...
 * @author Me
 */
class Weapon {
	
	public var name:String;
	public var originX:Int;
	public var originY:Int;
	public var leftPosX:Int;
	public var leftPosY:Int;
	public var rightPosX:Int;
	public var rightPosY:Int;
	
	public var fireDelay:Int;
	public var damage:Int;
	public var ammo:Int;
	public var reloadDelay:Int;
	public var accuracy:Int;
	public var penetration:Int;
	public var velocity:Float;
	public var bulletCount:Int;
	
	public var fireWhileMoving:Bool;
	

	public function new() {
		
	}
	
	public static function pistol():Weapon {
		var w:Weapon = new Weapon();
		w.name = "Pistol";
		w.originX = 4;
		w.originY = 2;
		w.leftPosX = 5;
		w.leftPosY = 21;
		w.rightPosX = 12;
		w.rightPosY = 21;
		
		w.velocity = 12;
		w.damage = 35;
		w.accuracy = 200;
		w.ammo = 12;
		w.reloadDelay = 60;
		w.fireDelay = 20;
		w.bulletCount = 1;
		w.penetration = 2;
		w.fireWhileMoving = true;
		
		return w;
	}
	
	public static function rifle():Weapon {
		var w:Weapon = new Weapon();
		w.name = "Rifle";
		w.originX = 9;
		w.originY = 2;
		w.leftPosX = 5;
		w.leftPosY = 21;
		w.rightPosX = 12;
		w.rightPosY = 21;
		
		w.velocity = 10;
		w.damage = 100;
		w.accuracy = 500;
		w.ammo = 1;
		w.reloadDelay = 140;
		w.fireDelay = 0;
		w.bulletCount = 1;
		w.penetration = 12;
		w.fireWhileMoving = false;
		
		return w;
	}
	
	public static function sawnoff():Weapon {
		var w:Weapon = new Weapon();
		w.name = "Sawnoff";
		w.originX = 8;
		w.originY = 2;
		w.leftPosX = 5;
		w.leftPosY = 21;
		w.rightPosX = 12;
		w.rightPosY = 21;
		
		w.velocity = 10;
		w.damage = 20;
		w.accuracy = 80;
		w.ammo = 2;
		w.reloadDelay = 90;
		w.fireDelay = 10;
		w.bulletCount = 10;
		w.penetration = 1;
		w.fireWhileMoving = true;
		
		return w;
	}
	
}