package globals ;
import haxe.ds.StringMap;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;
import com.haxepunk.utils.Joystick;
/**
 * ...
 * @author Me
 */
class InputBuffer {

	static var playerKeysDown:StringMap<StringMap<Bool>>;
	static var playerKeysPressed:StringMap<StringMap<Bool>>;
	static var playerKeysReleased:StringMap<StringMap<Bool>>;
	
	public static function init() {
		playerKeysDown = new StringMap<StringMap<Bool>>();
		playerKeysPressed = new StringMap<StringMap<Bool>>();
		playerKeysReleased = new StringMap<StringMap<Bool>>();
		
		
		
		playerKeysDown.set("keyboard1", newStringMap());
		playerKeysDown.set("keyboard2", newStringMap());
		playerKeysDown.set("joy1", newStringMap());
		playerKeysDown.set("joy2", newStringMap());
		playerKeysDown.set("joy3", newStringMap());
		playerKeysDown.set("joy4", newStringMap());
		playerKeysDown.set("joy5", newStringMap());
		playerKeysDown.set("joy6", newStringMap());
		playerKeysDown.set("joy7", newStringMap());
		playerKeysDown.set("joy8", newStringMap());
		
		playerKeysPressed.set("keyboard1", newStringMap());
		playerKeysPressed.set("keyboard2", newStringMap());
		playerKeysPressed.set("joy1", newStringMap());
		playerKeysPressed.set("joy2", newStringMap());
		playerKeysPressed.set("joy3", newStringMap());
		playerKeysPressed.set("joy4", newStringMap());
		playerKeysPressed.set("joy5", newStringMap());
		playerKeysPressed.set("joy6", newStringMap());
		playerKeysPressed.set("joy7", newStringMap());
		playerKeysPressed.set("joy8", newStringMap());
		
		playerKeysReleased.set("keyboard1", newStringMap());
		playerKeysReleased.set("keyboard2", newStringMap());
		playerKeysReleased.set("joy1", newStringMap());
		playerKeysReleased.set("joy2", newStringMap());
		playerKeysReleased.set("joy3", newStringMap());
		playerKeysReleased.set("joy4", newStringMap());
		playerKeysReleased.set("joy5", newStringMap());
		playerKeysReleased.set("joy6", newStringMap());
		playerKeysReleased.set("joy7", newStringMap());
		playerKeysReleased.set("joy8", newStringMap());
	}
		
	public static function update() {
		
		for (i in playerKeysDown.keys()) {
			playerKeysDown.set(i, updateDown(playerKeysDown.get(i), i));
		}
		
		for (i in playerKeysPressed.keys()) {
			playerKeysPressed.set(i, updatePressed(playerKeysPressed.get(i), i));
		}
		
		for (i in playerKeysReleased.keys()) {
			playerKeysReleased.set(i, updateReleased(playerKeysReleased.get(i), i));
		}
	
	}
	public static function down(player:String, control:String):Bool {
		var map:StringMap<Bool> = playerKeysDown.get(player);
		return map.get(control);
	}
	
	public static function released(player:String, control:String):Bool {
		var map:StringMap<Bool> = playerKeysReleased.get(player);
		return map.get(control);
	}
	
	public static function pressed(player:String, control:String):Bool {
		var map:StringMap<Bool> = playerKeysPressed.get(player);
		return map.get(control);
	}
	

	
	private static function updateDown(map:StringMap<Bool>, player:String):StringMap<Bool> {
		switch player {
			case "keyboard2":
				map.set("up", Input.check(Key.I));
				map.set("down", Input.check(Key.K));
				map.set("left", Input.check(Key.J));
				map.set("right", Input.check(Key.L));
				map.set("btn1", Input.check(Key.U));
				map.set("btn2", Input.check(Key.O));
				map.set("btn3", Input.check(Key.P));
				
			case "keyboard1":
				map.set("up", Input.check(Key.W));
				map.set("down", Input.check(Key.S));
				map.set("left", Input.check(Key.A));
				map.set("right", Input.check(Key.D));
				map.set("btn1", Input.check(Key.Q));
				map.set("btn2", Input.check(Key.E));
				map.set("btn3", Input.check(Key.R));
				
			case "joy1":
				map.set("up", Input.joystick(0).getAxis(XBOX_GAMEPAD.LEFT_ANALOGUE_Y) < -0.6);
				map.set("down", Input.joystick(0).getAxis(XBOX_GAMEPAD.LEFT_ANALOGUE_Y) > 0.6);
				map.set("left", Input.joystick(0).getAxis(XBOX_GAMEPAD.LEFT_ANALOGUE_X) < -0.6);
				map.set("right", Input.joystick(0).getAxis(XBOX_GAMEPAD.LEFT_ANALOGUE_X) > 0.6);
				map.set("btn1", Input.joystick(0).getAxis(XBOX_GAMEPAD.LEFT_TRIGGER) > 0.5);
				map.set("btn2", Input.joystick(0).check(XBOX_GAMEPAD.LB_BUTTON));
				map.set("btn3", Input.joystick(0).check(XBOX_GAMEPAD.LEFT_ANALOGUE_BUTTON));
			
			case "joy2":
				map.set("up", Input.joystick(0).getAxis(XBOX_GAMEPAD.RIGHT_ANALOGUE_Y) < -0.6);
				map.set("down", Input.joystick(0).getAxis(XBOX_GAMEPAD.RIGHT_ANALOGUE_Y) > 0.6);
				map.set("left", Input.joystick(0).getAxis(XBOX_GAMEPAD.RIGHT_ANALOGUE_X) < -0.6);
				map.set("right", Input.joystick(0).getAxis(XBOX_GAMEPAD.RIGHT_ANALOGUE_X) > 0.6);
				map.set("btn1", Input.joystick(0).getAxis(XBOX_GAMEPAD.RIGHT_TRIGGER) > 0.5);
				map.set("btn2", Input.joystick(0).check(XBOX_GAMEPAD.RB_BUTTON));
				map.set("btn3", Input.joystick(0).check(XBOX_GAMEPAD.RIGHT_ANALOGUE_BUTTON));
			
			case "joy3":
				map.set("up", Input.joystick(1).getAxis(XBOX_GAMEPAD.LEFT_ANALOGUE_Y) < -0.6);
				map.set("down", Input.joystick(1).getAxis(XBOX_GAMEPAD.LEFT_ANALOGUE_Y) > 0.6);
				map.set("left", Input.joystick(1).getAxis(XBOX_GAMEPAD.LEFT_ANALOGUE_X) < -0.6);
				map.set("right", Input.joystick(1).getAxis(XBOX_GAMEPAD.LEFT_ANALOGUE_X) > 0.6);
				map.set("btn1", Input.joystick(1).getAxis(XBOX_GAMEPAD.LEFT_TRIGGER) > 0.5);
				map.set("btn2", Input.joystick(1).check(XBOX_GAMEPAD.LB_BUTTON));
				map.set("btn3", Input.joystick(1).check(XBOX_GAMEPAD.LEFT_ANALOGUE_BUTTON));
			
			case "joy4":
				map.set("up", Input.joystick(1).getAxis(XBOX_GAMEPAD.RIGHT_ANALOGUE_Y) < -0.6);
				map.set("down", Input.joystick(1).getAxis(XBOX_GAMEPAD.RIGHT_ANALOGUE_Y) > 0.6);
				map.set("left", Input.joystick(1).getAxis(XBOX_GAMEPAD.RIGHT_ANALOGUE_X) < -0.6);
				map.set("right", Input.joystick(1).getAxis(XBOX_GAMEPAD.RIGHT_ANALOGUE_X) > 0.6);
				map.set("btn1", Input.joystick(1).getAxis(XBOX_GAMEPAD.RIGHT_TRIGGER) > 0.5);
				map.set("btn2", Input.joystick(1).check(XBOX_GAMEPAD.RB_BUTTON));
				map.set("btn3", Input.joystick(1).check(XBOX_GAMEPAD.RIGHT_ANALOGUE_BUTTON));
				
			case "joy5":
				map.set("up", Input.joystick(2).getAxis(XBOX_GAMEPAD.LEFT_ANALOGUE_Y) < -0.6);
				map.set("down", Input.joystick(2).getAxis(XBOX_GAMEPAD.LEFT_ANALOGUE_Y) > 0.6);
				map.set("left", Input.joystick(2).getAxis(XBOX_GAMEPAD.LEFT_ANALOGUE_X) < -0.6);
				map.set("right", Input.joystick(2).getAxis(XBOX_GAMEPAD.LEFT_ANALOGUE_X) > 0.6);
				map.set("btn1", Input.joystick(2).getAxis(XBOX_GAMEPAD.LEFT_TRIGGER) > 0.5);
				map.set("btn2", Input.joystick(2).check(XBOX_GAMEPAD.LB_BUTTON));
				map.set("btn3", Input.joystick(2).check(XBOX_GAMEPAD.LEFT_ANALOGUE_BUTTON));
			
			case "joy6":
				map.set("up", Input.joystick(2).getAxis(XBOX_GAMEPAD.RIGHT_ANALOGUE_Y) < -0.6);
				map.set("down", Input.joystick(2).getAxis(XBOX_GAMEPAD.RIGHT_ANALOGUE_Y) > 0.6);
				map.set("left", Input.joystick(2).getAxis(XBOX_GAMEPAD.RIGHT_ANALOGUE_X) < -0.6);
				map.set("right", Input.joystick(2).getAxis(XBOX_GAMEPAD.RIGHT_ANALOGUE_X) > 0.6);
				map.set("btn1", Input.joystick(2).getAxis(XBOX_GAMEPAD.RIGHT_TRIGGER) > 0.5);
				map.set("btn2", Input.joystick(2).check(XBOX_GAMEPAD.RB_BUTTON));
				map.set("btn3", Input.joystick(2).check(XBOX_GAMEPAD.RIGHT_ANALOGUE_BUTTON));
				
			case "joy7":
				map.set("up", Input.joystick(3).getAxis(XBOX_GAMEPAD.LEFT_ANALOGUE_Y) < -0.6);
				map.set("down", Input.joystick(3).getAxis(XBOX_GAMEPAD.LEFT_ANALOGUE_Y) > 0.6);
				map.set("left", Input.joystick(3).getAxis(XBOX_GAMEPAD.LEFT_ANALOGUE_X) < -0.6);
				map.set("right", Input.joystick(3).getAxis(XBOX_GAMEPAD.LEFT_ANALOGUE_X) > 0.6);
				map.set("btn1", Input.joystick(3).getAxis(XBOX_GAMEPAD.LEFT_TRIGGER) > 0.5);
				map.set("btn2", Input.joystick(3).check(XBOX_GAMEPAD.LB_BUTTON));
				map.set("btn3", Input.joystick(3).check(XBOX_GAMEPAD.LEFT_ANALOGUE_BUTTON));
			
			case "joy8":
				map.set("up", Input.joystick(3).getAxis(XBOX_GAMEPAD.RIGHT_ANALOGUE_Y) < -0.6);
				map.set("down", Input.joystick(3).getAxis(XBOX_GAMEPAD.RIGHT_ANALOGUE_Y) > 0.6);
				map.set("left", Input.joystick(3).getAxis(XBOX_GAMEPAD.RIGHT_ANALOGUE_X) < -0.6);
				map.set("right", Input.joystick(3).getAxis(XBOX_GAMEPAD.RIGHT_ANALOGUE_X) > 0.6);
				map.set("btn1", Input.joystick(3).getAxis(XBOX_GAMEPAD.RIGHT_TRIGGER) > 0.5);
				map.set("btn2", Input.joystick(3).check(XBOX_GAMEPAD.RB_BUTTON));
				map.set("btn3", Input.joystick(3).check(XBOX_GAMEPAD.RIGHT_ANALOGUE_BUTTON));
				
		}
		return map;
	}
	
	private static function updatePressed(map:StringMap<Bool>, player):StringMap<Bool> {
		switch player {
			case "keyboard2":
				map.set("up", Input.pressed(Key.I));
				map.set("down", Input.pressed(Key.K));
				map.set("left", Input.pressed(Key.J));
				map.set("right", Input.pressed(Key.L));
				map.set("btn1", Input.pressed(Key.U));
				map.set("btn2", Input.pressed(Key.O));
				map.set("btn3", Input.pressed(Key.P));
				
			case "keyboard1":
				map.set("up", Input.pressed(Key.W));
				map.set("down", Input.pressed(Key.S));
				map.set("left", Input.pressed(Key.A));
				map.set("right", Input.pressed(Key.D));
				map.set("btn1", Input.pressed(Key.Q));
				map.set("btn2", Input.pressed(Key.E));
				map.set("btn3", Input.pressed(Key.R));
				
			case "joy1":
				map.set("up", Input.joystick(0).getAxis(XBOX_GAMEPAD.LEFT_ANALOGUE_Y) < -0.6 && !map.get("up"));
				map.set("down", Input.joystick(0).getAxis(XBOX_GAMEPAD.LEFT_ANALOGUE_Y) > 0.6 && !map.get("down"));
				map.set("left", Input.joystick(0).getAxis(XBOX_GAMEPAD.LEFT_ANALOGUE_X) < -0.6 && !map.get("left"));
				map.set("right", Input.joystick(0).getAxis(XBOX_GAMEPAD.LEFT_ANALOGUE_X) > 0.6 && !map.get("right"));
				map.set("btn1", Input.joystick(0).getAxis(XBOX_GAMEPAD.LEFT_TRIGGER) > 0.5);
				map.set("btn2", Input.joystick(0).pressed(XBOX_GAMEPAD.LB_BUTTON));
				map.set("btn3", Input.joystick(0).pressed(XBOX_GAMEPAD.LEFT_ANALOGUE_BUTTON));
			
			case "joy2":
				map.set("up", Input.joystick(0).getAxis(XBOX_GAMEPAD.RIGHT_ANALOGUE_Y) < -0.6 && !map.get("up"));
				map.set("down", Input.joystick(0).getAxis(XBOX_GAMEPAD.RIGHT_ANALOGUE_Y) > 0.6 && !map.get("down"));
				map.set("left", Input.joystick(0).getAxis(XBOX_GAMEPAD.RIGHT_ANALOGUE_X) < -0.6 && !map.get("left"));
				map.set("right", Input.joystick(0).getAxis(XBOX_GAMEPAD.RIGHT_ANALOGUE_X) > 0.6 && !map.get("right"));
				map.set("btn1", Input.joystick(0).getAxis(XBOX_GAMEPAD.RIGHT_TRIGGER) > 0.5);
				map.set("btn2", Input.joystick(0).pressed(XBOX_GAMEPAD.RB_BUTTON));
				map.set("btn3", Input.joystick(0).pressed(XBOX_GAMEPAD.RIGHT_ANALOGUE_BUTTON));
				
			case "joy3":
				map.set("up", Input.joystick(1).getAxis(XBOX_GAMEPAD.LEFT_ANALOGUE_Y) < -0.6 && !map.get("up"));
				map.set("down", Input.joystick(1).getAxis(XBOX_GAMEPAD.LEFT_ANALOGUE_Y) > 0.6 && !map.get("down"));
				map.set("left", Input.joystick(1).getAxis(XBOX_GAMEPAD.LEFT_ANALOGUE_X) < -0.6 && !map.get("left"));
				map.set("right", Input.joystick(1).getAxis(XBOX_GAMEPAD.LEFT_ANALOGUE_X) > 0.6 && !map.get("right"));
				map.set("btn1", Input.joystick(1).getAxis(XBOX_GAMEPAD.LEFT_TRIGGER) > 0.5);
				map.set("btn2", Input.joystick(1).pressed(XBOX_GAMEPAD.LB_BUTTON));
				map.set("btn3", Input.joystick(1).pressed(XBOX_GAMEPAD.LEFT_ANALOGUE_BUTTON));
			
			case "joy4":
				map.set("up", Input.joystick(1).getAxis(XBOX_GAMEPAD.RIGHT_ANALOGUE_Y) < -0.6 && !map.get("up"));
				map.set("down", Input.joystick(1).getAxis(XBOX_GAMEPAD.RIGHT_ANALOGUE_Y) > 0.6 && !map.get("down"));
				map.set("left", Input.joystick(1).getAxis(XBOX_GAMEPAD.RIGHT_ANALOGUE_X) < -0.6 && !map.get("left"));
				map.set("right", Input.joystick(1).getAxis(XBOX_GAMEPAD.RIGHT_ANALOGUE_X) > 0.6 && !map.get("right"));
				map.set("btn1", Input.joystick(1).getAxis(XBOX_GAMEPAD.RIGHT_TRIGGER) > 0.5);
				map.set("btn2", Input.joystick(1).pressed(XBOX_GAMEPAD.RB_BUTTON));
				map.set("btn3", Input.joystick(1).pressed(XBOX_GAMEPAD.RIGHT_ANALOGUE_BUTTON));
				
			case "joy5":
				map.set("up", Input.joystick(2).getAxis(XBOX_GAMEPAD.LEFT_ANALOGUE_Y) < -0.6 && !map.get("up"));
				map.set("down", Input.joystick(2).getAxis(XBOX_GAMEPAD.LEFT_ANALOGUE_Y) > 0.6 && !map.get("down"));
				map.set("left", Input.joystick(2).getAxis(XBOX_GAMEPAD.LEFT_ANALOGUE_X) < -0.6 && !map.get("left"));
				map.set("right", Input.joystick(2).getAxis(XBOX_GAMEPAD.LEFT_ANALOGUE_X) > 0.6 && !map.get("right"));
				map.set("btn1", Input.joystick(2).getAxis(XBOX_GAMEPAD.LEFT_TRIGGER) > 0.5);
				map.set("btn2", Input.joystick(2).pressed(XBOX_GAMEPAD.LB_BUTTON));
				map.set("btn3", Input.joystick(2).pressed(XBOX_GAMEPAD.LEFT_ANALOGUE_BUTTON));
			
			case "joy6":
				map.set("up", Input.joystick(2).getAxis(XBOX_GAMEPAD.RIGHT_ANALOGUE_Y) < -0.6 && !map.get("up"));
				map.set("down", Input.joystick(2).getAxis(XBOX_GAMEPAD.RIGHT_ANALOGUE_Y) > 0.6 && !map.get("down"));
				map.set("left", Input.joystick(2).getAxis(XBOX_GAMEPAD.RIGHT_ANALOGUE_X) < -0.6 && !map.get("left"));
				map.set("right", Input.joystick(2).getAxis(XBOX_GAMEPAD.RIGHT_ANALOGUE_X) > 0.6 && !map.get("right"));
				map.set("btn1", Input.joystick(2).getAxis(XBOX_GAMEPAD.RIGHT_TRIGGER) > 0.5);
				map.set("btn2", Input.joystick(2).pressed(XBOX_GAMEPAD.RB_BUTTON));
				
			case "joy7":
				map.set("up", Input.joystick(3).getAxis(XBOX_GAMEPAD.LEFT_ANALOGUE_Y) < -0.6 && !map.get("up"));
				map.set("down", Input.joystick(3).getAxis(XBOX_GAMEPAD.LEFT_ANALOGUE_Y) > 0.6 && !map.get("down"));
				map.set("left", Input.joystick(3).getAxis(XBOX_GAMEPAD.LEFT_ANALOGUE_X) < -0.6 && !map.get("left"));
				map.set("right", Input.joystick(3).getAxis(XBOX_GAMEPAD.LEFT_ANALOGUE_X) > 0.6 && !map.get("right"));
				map.set("btn1", Input.joystick(3).getAxis(XBOX_GAMEPAD.LEFT_TRIGGER) > 0.5);
				map.set("btn2", Input.joystick(3).pressed(XBOX_GAMEPAD.LB_BUTTON));
				map.set("btn3", Input.joystick(3).pressed(XBOX_GAMEPAD.LEFT_ANALOGUE_BUTTON));
			
			case "joy8":
				map.set("up", Input.joystick(3).getAxis(XBOX_GAMEPAD.RIGHT_ANALOGUE_Y) < -0.6 && !map.get("up"));
				map.set("down", Input.joystick(3).getAxis(XBOX_GAMEPAD.RIGHT_ANALOGUE_Y) > 0.6 && !map.get("down"));
				map.set("left", Input.joystick(3).getAxis(XBOX_GAMEPAD.RIGHT_ANALOGUE_X) < -0.6 && !map.get("left"));
				map.set("right", Input.joystick(3).getAxis(XBOX_GAMEPAD.RIGHT_ANALOGUE_X) > 0.6 && !map.get("right"));
				map.set("btn1", Input.joystick(3).getAxis(XBOX_GAMEPAD.RIGHT_TRIGGER) > 0.5);
				map.set("btn2", Input.joystick(3).pressed(XBOX_GAMEPAD.RB_BUTTON));
				map.set("btn3", Input.joystick(3).pressed(XBOX_GAMEPAD.RIGHT_ANALOGUE_BUTTON));
		}
		return map;
	}
	
	private static function updateReleased(map:StringMap<Bool>, player):StringMap<Bool> {
		switch player {
			case "keyboard2":
				map.set("up", Input.released(Key.I));
				map.set("down", Input.released(Key.K));
				map.set("left", Input.released(Key.J));
				map.set("right", Input.released(Key.L));
				map.set("btn1", Input.released(Key.U));
				map.set("btn2", Input.released(Key.O));
				map.set("btn3", Input.released(Key.P));
				
			case "keyboard1":
				map.set("up", Input.released(Key.W));
				map.set("down", Input.released(Key.S));
				map.set("left", Input.released(Key.A));
				map.set("right", Input.released(Key.D));
				map.set("btn1", Input.released(Key.Q));
				map.set("btn2", Input.released(Key.E));
				map.set("btn3", Input.released(Key.R));
				
			case "joy1":
				map.set("up", Input.joystick(0).getAxis(XBOX_GAMEPAD.LEFT_ANALOGUE_Y) > -0.6 && map.get("up"));
				map.set("down", Input.joystick(0).getAxis(XBOX_GAMEPAD.LEFT_ANALOGUE_Y) < 0.6 && map.get("down"));
				map.set("left", Input.joystick(0).getAxis(XBOX_GAMEPAD.LEFT_ANALOGUE_X) > -0.6 && map.get("left"));
				map.set("right", Input.joystick(0).getAxis(XBOX_GAMEPAD.LEFT_ANALOGUE_X) < 0.6 && map.get("right"));
				map.set("btn1", Input.joystick(0).getAxis(XBOX_GAMEPAD.LEFT_TRIGGER) < 0.5);
				map.set("btn2", Input.joystick(0).released(XBOX_GAMEPAD.LB_BUTTON));
				map.set("btn3", Input.joystick(0).released(XBOX_GAMEPAD.LEFT_ANALOGUE_BUTTON));
			
			case "joy2":
				map.set("up", Input.joystick(0).getAxis(XBOX_GAMEPAD.RIGHT_ANALOGUE_Y) > -0.6 && map.get("up"));
				map.set("down", Input.joystick(0).getAxis(XBOX_GAMEPAD.RIGHT_ANALOGUE_Y) < 0.6 && map.get("down"));
				map.set("left", Input.joystick(0).getAxis(XBOX_GAMEPAD.RIGHT_ANALOGUE_X) > -0.6 && map.get("left"));
				map.set("right", Input.joystick(0).getAxis(XBOX_GAMEPAD.RIGHT_ANALOGUE_X) < 0.6 && map.get("right"));
				map.set("btn1", Input.joystick(0).getAxis(XBOX_GAMEPAD.RIGHT_TRIGGER) < 0.5);
				map.set("btn2", Input.joystick(0).released(XBOX_GAMEPAD.RB_BUTTON));
				map.set("btn3", Input.joystick(0).released(XBOX_GAMEPAD.RIGHT_ANALOGUE_BUTTON));
				
			case "joy3":
				map.set("up", Input.joystick(1).getAxis(XBOX_GAMEPAD.LEFT_ANALOGUE_Y) > -0.6 && map.get("up"));
				map.set("down", Input.joystick(1).getAxis(XBOX_GAMEPAD.LEFT_ANALOGUE_Y) < 0.6 && map.get("down"));
				map.set("left", Input.joystick(1).getAxis(XBOX_GAMEPAD.LEFT_ANALOGUE_X) > -0.6 && map.get("left"));
				map.set("right", Input.joystick(1).getAxis(XBOX_GAMEPAD.LEFT_ANALOGUE_X) < 0.6 && map.get("right"));
				map.set("btn1", Input.joystick(1).getAxis(XBOX_GAMEPAD.LEFT_TRIGGER) < 0.5);
				map.set("btn2", Input.joystick(1).released(XBOX_GAMEPAD.LB_BUTTON));
				map.set("btn3", Input.joystick(1).released(XBOX_GAMEPAD.LEFT_ANALOGUE_BUTTON));
			
			case "joy4":
				map.set("up", Input.joystick(1).getAxis(XBOX_GAMEPAD.RIGHT_ANALOGUE_Y) > -0.6 && map.get("up"));
				map.set("down", Input.joystick(1).getAxis(XBOX_GAMEPAD.RIGHT_ANALOGUE_Y) < 0.6 && map.get("down"));
				map.set("left", Input.joystick(1).getAxis(XBOX_GAMEPAD.RIGHT_ANALOGUE_X) > -0.6 && map.get("left"));
				map.set("right", Input.joystick(1).getAxis(XBOX_GAMEPAD.RIGHT_ANALOGUE_X) < 0.6 && map.get("right"));
				map.set("btn1", Input.joystick(1).getAxis(XBOX_GAMEPAD.RIGHT_TRIGGER) < 0.5);
				map.set("btn2", Input.joystick(1).released(XBOX_GAMEPAD.RB_BUTTON));
				map.set("btn3", Input.joystick(1).released(XBOX_GAMEPAD.RIGHT_ANALOGUE_BUTTON));
				
			case "joy5":
				map.set("up", Input.joystick(2).getAxis(XBOX_GAMEPAD.LEFT_ANALOGUE_Y) > -0.6 && map.get("up"));
				map.set("down", Input.joystick(2).getAxis(XBOX_GAMEPAD.LEFT_ANALOGUE_Y) < 0.6 && map.get("down"));
				map.set("left", Input.joystick(2).getAxis(XBOX_GAMEPAD.LEFT_ANALOGUE_X) > -0.6 && map.get("left"));
				map.set("right", Input.joystick(2).getAxis(XBOX_GAMEPAD.LEFT_ANALOGUE_X) < 0.6 && map.get("right"));
				map.set("btn1", Input.joystick(2).getAxis(XBOX_GAMEPAD.LEFT_TRIGGER) < 0.5);
				map.set("btn2", Input.joystick(2).released(XBOX_GAMEPAD.LB_BUTTON));
				map.set("btn3", Input.joystick(2).released(XBOX_GAMEPAD.LEFT_ANALOGUE_BUTTON));
			
			case "joy6":
				map.set("up", Input.joystick(2).getAxis(XBOX_GAMEPAD.RIGHT_ANALOGUE_Y) > -0.6 && map.get("up"));
				map.set("down", Input.joystick(2).getAxis(XBOX_GAMEPAD.RIGHT_ANALOGUE_Y) < 0.6 && map.get("down"));
				map.set("left", Input.joystick(2).getAxis(XBOX_GAMEPAD.RIGHT_ANALOGUE_X) > -0.6 && map.get("left"));
				map.set("right", Input.joystick(2).getAxis(XBOX_GAMEPAD.RIGHT_ANALOGUE_X) < 0.6 && map.get("right"));
				map.set("btn1", Input.joystick(2).getAxis(XBOX_GAMEPAD.RIGHT_TRIGGER) < 0.5);
				map.set("btn2", Input.joystick(2).released(XBOX_GAMEPAD.RB_BUTTON));
				map.set("btn3", Input.joystick(2).released(XBOX_GAMEPAD.RIGHT_ANALOGUE_BUTTON));
				
			case "joy7":
				map.set("up", Input.joystick(3).getAxis(XBOX_GAMEPAD.LEFT_ANALOGUE_Y) > -0.6 && map.get("up"));
				map.set("down", Input.joystick(3).getAxis(XBOX_GAMEPAD.LEFT_ANALOGUE_Y) < 0.6 && map.get("down"));
				map.set("left", Input.joystick(3).getAxis(XBOX_GAMEPAD.LEFT_ANALOGUE_X) > -0.6 && map.get("left"));
				map.set("right", Input.joystick(3).getAxis(XBOX_GAMEPAD.LEFT_ANALOGUE_X) < 0.6 && map.get("right"));
				map.set("btn1", Input.joystick(3).getAxis(XBOX_GAMEPAD.LEFT_TRIGGER) < 0.5);
				map.set("btn2", Input.joystick(3).released(XBOX_GAMEPAD.LB_BUTTON));
				map.set("btn3", Input.joystick(3).released(XBOX_GAMEPAD.LEFT_ANALOGUE_BUTTON));
			
			case "joy8":
				map.set("up", Input.joystick(3).getAxis(XBOX_GAMEPAD.RIGHT_ANALOGUE_Y) > -0.6 && map.get("up"));
				map.set("down", Input.joystick(3).getAxis(XBOX_GAMEPAD.RIGHT_ANALOGUE_Y) < 0.6 && map.get("down"));
				map.set("left", Input.joystick(3).getAxis(XBOX_GAMEPAD.RIGHT_ANALOGUE_X) > -0.6 && map.get("left"));
				map.set("right", Input.joystick(3).getAxis(XBOX_GAMEPAD.RIGHT_ANALOGUE_X) < 0.6 && map.get("right"));
				map.set("btn1", Input.joystick(3).getAxis(XBOX_GAMEPAD.RIGHT_TRIGGER) < 0.5);
				map.set("btn2", Input.joystick(3).released(XBOX_GAMEPAD.RB_BUTTON));
				map.set("btn3", Input.joystick(3).released(XBOX_GAMEPAD.RIGHT_ANALOGUE_BUTTON));
		}
		return map;
	}
	
	public static function traceAxis() {
	}
	
	private static function newStringMap():StringMap<Bool> {
		var s:StringMap<Bool> = new StringMap<Bool>();
		s.set("up", false);
		s.set("down", false);
		s.set("left", false);
		s.set("right", false);
		s.set("btn1", false);
		s.set("btn2", false);
		s.set("btn3", false);
		return s;
	}
	
}