package ;

/**
 * ...
 * @author Me
 */
class LevelGeneration{

	public function new() {
		
	}
	
	
	public static function generateTestLevel():Array<Array<Int>> {
		var a:Array<Array<Int>>;
		a = new Array<Array<Int>>();
		var nextColumn:Array<Int>;
		nextColumn = new Array<Int>();
		for (i in 0... 15) {
			nextColumn.push(1);
		}
		a.push(nextColumn);
		
		for (i in 0...18) {
			nextColumn = new Array<Int>();
			nextColumn.push(1);
			for (j in 0... 13) {
				nextColumn.push(0);
			}
			nextColumn.push(1);
			a.push(nextColumn);
		}
		
		nextColumn = new Array<Int>();
		for (i in 0... 15) {
			nextColumn.push(1);
		}
		a.push(nextColumn);
		for (i in 4...8) {
			a[i][3] = 1;
		}
		for (i in 11...15) {
			a[i][3] = 1;
		}
		for (i in 5...9) {
			a[i][11] = 1;
		}
		for (i in 12...16) {
			a[i][11] = 1;
		}
		a[11][4] = 1;
		a[11][8] = 1;
		a[10][8] = 1;
		a[7][6] = 1;
		a[8][6] = 1;
		a[8][10] = 1;
		return a;
	}
	
}