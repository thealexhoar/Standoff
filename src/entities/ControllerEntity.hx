package entities;
import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import globals.InputBuffer;
import globals.Weapon;
import com.haxepunk.graphics.Graphiclist;

/**
 * ...
 * @author Me
 */
class ControllerEntity extends Entity {
	
	var sprite:Image;
	var weaponSprite:Image;
	var leftSide:Bool;
	var team:String = "";
	public var player:PlayerProfile;
	var g:Graphiclist;

	public function new(x:Float, y:Float, player:PlayerProfile, left:Bool) {
		if (left) {
			sprite = new Image("graphics/controllerleft.png");
		}
		else {
			sprite = new Image("graphics/controllerright.png");
		}
		leftSide = left;
		sprite.color = player.color;
		this.player = player;
		this.player.weapon = Weapon.pistol();
		weaponSprite = new Image("graphics/" + this.player.weapon.name+".png");
		weaponSprite.x = -50;
			if (!leftSide) {
				weaponSprite.x += 100;
			}
			weaponSprite.y = 20;
			weaponSprite.scale = 3;
		
		weaponSprite.visible = false;
		
		g = new Graphiclist();
		g.add(sprite);
		g.add(weaponSprite);
		super(x, y, g);
	}
	
	
	public override function update() {
		super.update();
		if (InputBuffer.down(player.inputString, "left")) {
			team = "Police";
			player.faction = "Police";
			x = 80;
			if (!leftSide) {
				x += 40;
			}
		}
		else if (InputBuffer.down(player.inputString, "right")) {
			team = "Suspect";
			player.faction = "Suspect";
			x = 480;
			if (!leftSide) {
				x += 40;
			}
			
		}
		
		if (InputBuffer.pressed(player.inputString, "btn2")) {
			switch this.player.weapon.name {
				case "Pistol":
					this.player.weapon = Weapon.sawnoff();
					g.remove(weaponSprite);
					weaponSprite = new Image("graphics/" + this.player.weapon.name+".png");
					g.add(weaponSprite);
				case "Sawnoff":
					this.player.weapon = Weapon.rifle();
					g.remove(weaponSprite);
					weaponSprite = new Image("graphics/" + this.player.weapon.name+".png");
					g.add(weaponSprite);
				case "Rifle":	
					this.player.weapon = Weapon.pistol();
					g.remove(weaponSprite);
					weaponSprite = new Image("graphics/" + this.player.weapon.name+".png");
					g.add(weaponSprite);
			}
			
			weaponSprite.x = -50;
			if (!leftSide) {
				weaponSprite.x += 100;
			}
			weaponSprite.y = 20;
			weaponSprite.scale = 3;
		}
		
		if (team != "") {
			weaponSprite.visible = true;
		}
	}
	
}