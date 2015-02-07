package scenes;
import com.haxepunk.Scene;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;
import com.haxepunk.HXP;
import entities.Background;
import entities.Actor;
import entities.Block;
import entities.QuarterBlock;
import entities.Particles;
import globals.InputBuffer;
import globals.Weapon;
import globals.LevelGeneration;


class MainScene extends Scene
{
	var p:Particles;
	var policeCount:Int = 0;
	var suspectCount:Int = 0;
	public function new(players:Array<PlayerProfile>)
	{
		
		super();
		p = new Particles();
		add(p);
		add(new Background("Background"));
		for (profile in players) {
			if (profile.faction == "Police") {
				policeCount ++;
				add(new Actor(100,policeCount * 80,"Police", false, profile.inputString, profile.weapon,false,p));
			}
			else if (profile.faction == "Suspect") {
				suspectCount++;
				add(new Actor(560,suspectCount * 80,"Suspect", true, profile.inputString, profile.weapon,false,p));
			}
		}
		
		//loadFromArray(LevelGeneration.generateTestLevel());
		loadFromArrayQuarter(LevelGeneration.generateTestLevelQuarter());
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
	
	private function loadFromArrayQuarter(grid:Array<Array<Int>>) {
		for (x in 0... grid.length) {
			for (y in 0... grid[0].length) {
				if (grid[x][y] == 1) {
					add(new QuarterBlock(x * 8, y * 8, p));
				}
			}
		}
	}
	
	public override function update() {
		super.update();
		InputBuffer.update();
		InputBuffer.traceAxis();
		
		if(Input.pressed(Key.SPACE)){
			HXP.scene = new MenuScene();
		}
	}
	
 }