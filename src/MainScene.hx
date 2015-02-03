import com.haxepunk.Scene;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;
import com.haxepunk.HXP;

class MainScene extends Scene
{
	var p:Particles;
	public function new()
	{
		
		super();
		p = new Particles();
		add(p);
		add(new Background());
		add(new Actor(100,100,"Police", false, "keyboard1", Weapon.pistol(),false,p));
		add(new Actor(100,200,"Police", false, "joy1", Weapon.sawnoff(),false,p));
		add(new Actor(100,300,"Police", false, "joy5", Weapon.sawnoff(),false,p));
		add(new Actor(560, 100, "Suspect", true, "joy2", Weapon.sawnoff(), false,p));
		add(new Actor(560, 200, "Suspect", true, "joy4", Weapon.sawnoff(), false,p));
		add(new Actor(560, 300, "Suspect", true, "joy6", Weapon.sawnoff(), false,p));
		loadFromArray(LevelGeneration.generateTestLevel());
	}
	 
	private function loadFromArray(grid:Array<Array<Int>>) {
		for (x in 0... grid.length) {
			for (y in 0... grid[0].length) {
				if (grid[x][y] == 1) {
					add(new Block(x * 32, y * 32, p));
				}
			}
		}
	}
	
	public override function update() {
		super.update();
		InputBuffer.update();
		InputBuffer.traceAxis();
		
		if(Input.pressed(Key.SPACE)){
			HXP.scene = new MainScene();
		}
	}
	
 }