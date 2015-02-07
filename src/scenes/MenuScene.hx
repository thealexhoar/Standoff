package scenes ;
import com.haxepunk.Scene;
import entities.Background;
import entities.ControllerEntity;
import globals.InputBuffer;

import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;

import com.haxepunk.HXP;

/**
 * ...
 * @author Me
 */
class MenuScene extends Scene{
	var controllers:Array<ControllerEntity>;
	public function new() {
		super();
		add(new Background("menubackground"));
		controllers = new Array<ControllerEntity>();
		var p:PlayerProfile;
		var c:ControllerEntity;
		
		p = new PlayerProfile();
		p.color = 0xff0000;
		p.inputString = "joy1";
		c = new ControllerEntity(280, 75, p, true);
		controllers.push(c);
		add(c);
		
		p = new PlayerProfile();
		p.color = 0xff6a00;
		p.inputString = "joy2";
		c = new ControllerEntity(320, 75, p, false);
		controllers.push(c);
		add(c);
		
		p = new PlayerProfile();
		p.color = 0xffd800;
		p.inputString = "joy3";
		c = new ControllerEntity(280, 150, p, true);
		controllers.push(c);
		add(c);
		
		p = new PlayerProfile();
		p.color = 0x00ffff;
		p.inputString = "joy4";
		c = new ControllerEntity(320, 150, p, false);
		controllers.push(c);
		add(c);
		
		p = new PlayerProfile();
		p.color = 0x0026ff;
		p.inputString = "joy5";
		c = new ControllerEntity(280, 225, p, true);
		controllers.push(c);
		add(c);
		
		p = new PlayerProfile();
		p.color = 0xb200ff;
		p.inputString = "joy6";
		c = new ControllerEntity(320, 225, p, false);
		controllers.push(c);
		add(c);
		
		p = new PlayerProfile();
		p.color = 0x00ff00;
		p.inputString = "joy7";
		c = new ControllerEntity(280, 300, p, true);
		controllers.push(c);
		add(c);
		
		p = new PlayerProfile();
		p.color = 0xff00dc;
		p.inputString = "joy8";
		c = new ControllerEntity(320, 300, p, false);
		controllers.push(c);
		add(c);
		
	}
	
	public override function update() {
		super.update();
		
		InputBuffer.update();
		
		if (Input.pressed(Key.SPACE)) {
			var players:Array<PlayerProfile> = new Array<PlayerProfile>();
			for (x in 0... controllers.length) {
				var c:ControllerEntity = controllers.pop();
				if (c.player.faction != "") {
					players.push(c.player);
				}
			}
			
			HXP.scene = new MainScene(players);
			
		}
	}
	
}