package ;

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
	
	public var bulletCount:Int;
	

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
		
		w.damage = 35;
		w.accuracy = 100;
		w.ammo = 8;
		w.reloadDelay = 60;
		w.fireDelay = 20;
		w.bulletCount = 1;
		w.penetration = 2;
		
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
		
		w.damage = 6;
		w.damage = 6;
		w.accuracy = 50;
		w.ammo = 2;
		w.reloadDelay = 120;
		w.fireDelay = 10;
		w.bulletCount = 10;
		w.penetration = 1;
		
		return w;
	}
	
}