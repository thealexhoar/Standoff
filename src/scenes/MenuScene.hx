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
		p.inputString = "keyboard1";
		c = new ControllerEntity(280, 100, p, true);
		controllers.push(c);
		add(c);
		
		p = new PlayerProfile();
		p.color = 0xff6a00;
		p.inputString = "keyboard2";
		c = new ControllerEntity(320, 100, p, false);
		controllers.push(c);
		add(c);
		
		p = new PlayerProfile();
		p.color = 0xffd800;
		p.inputString = "joy3";
		c = new ControllerEntity(280, 200, p, true);
		controllers.push(c);
		add(c);
		
		p = new PlayerProfile();
		p.color = 0x00ff00;
		p.inputString = "joy4";
		c = new ControllerEntity(320, 200, p, false);
		controllers.push(c);
		add(c);
		
		p = new PlayerProfile();
		p.color = 0x0000ff;
		p.inputString = "joy5";
		c = new ControllerEntity(280, 300, p, true);
		controllers.push(c);
		add(c);
		
		p = new PlayerProfile();
		p.color = 0xb200ff;
		p.inputString = "joy6";
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
					trace(c.player.faction);
					players.push(c.player);
				}
			}
			
			HXP.scene = new MainScene(players);
			
		}
	}
	
}