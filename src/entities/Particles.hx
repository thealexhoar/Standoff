package entities;

import com.haxepunk.graphics.Emitter;
import com.haxepunk.utils.Ease;
import com.haxepunk.Entity;

class Particles extends Entity
{
	private var _emitter:Emitter;

	public function new()
	{
		super();
        _emitter = new Emitter("graphics/basepixel.png", 1, 1);
        _emitter.newType("explode", [0]);
        _emitter.setMotion("explode",  		// name
		        	0, 				// angle
		        	100, 			// distance
		        	1, 			// duration
		        	360, 			// ? angle range
		        	-40, 			// ? distance range
		        	1, 				// ? Duration range
		        	Ease.quadOut
		        	);
		_emitter.setColor("explode", 0xff9944, 0x550011);
        _emitter.setAlpha("explode", 20, 0.1);
		
		_emitter.newType("blood", [0]);
        _emitter.setMotion("blood",  		// name
		        	0, 				// angle
		        	100, 			// distance
		        	0.5, 			// duration
		        	360, 			// ? angle range
		        	-40, 			// ? distance range
		        	1, 				// ? Duration range
		        	Ease.quadOut
		        	);
		_emitter.setColor("blood", 0xff2222, 0x550000);
        _emitter.setAlpha("blood", 20, 0.1);
		
		_emitter.newType("death", [0]);
        _emitter.setMotion("death",  		// name
		        	0, 				// angle
		        	60, 			// distance
		        	1, 			// duration
		        	360, 			// ? angle range
		        	-40, 			// ? distance range
		        	1, 				// ? Duration range
		        	Ease.quadOut
		        	);
		_emitter.setColor("death", 0xff2222, 0x550000);
        _emitter.setAlpha("death", 20, 0.1);
        _emitter.setGravity("death", 0.3, 0);
		
		_emitter.newType("wallhit", [0]);
        _emitter.setMotion("wallhit",  		// name
		        	0, 				// angle
		        	20, 			// distance
		        	0.5, 			// duration
		        	360, 			// ? angle range
		        	-17, 			// ? distance range
		        	1, 				// ? Duration range
		        	Ease.quadOut
		        	);
		_emitter.setColor("wallhit", 0x007F0E, 0x007F0E);
        _emitter.setAlpha("wallhit", 20, 0.1);
        _emitter.setGravity("wallhit", 0.3, 0);
		
		_emitter.newType("gunshot", [0]);
        _emitter.setMotion("gunshot",  		// name
		        	0, 				// angle
		        	30, 			// distance
		        	0.5, 			// duration
		        	360, 			// ? angle range
		        	-9, 			// ? distance range
		        	1, 				// ? Duration range
		        	Ease.quadOut
		        	);
		_emitter.setColor("gunshot", 0xFFCC00, 0xFFCC00, Ease.quartIn);
        _emitter.setAlpha("gunshot");
		
        graphic = _emitter;
        layer = -1;
		name = "particles";
	}

	public function explode(x:Float, y:Float)
	{
		for (i in 0...20)
		{
			_emitter.emit("explode", x, y);
		}
	}
	
	public function bloodSpatter(x:Float, y:Float, angle:Float)
	{
		for (i in 0...20)
		{ _emitter.setMotion("blood",  		// name
		        	angle + 50, 				// angle
		        	40, 			// distance
		        	0.3, 			// duration
		        	-100, 			// ? angle range
		        	-20, 			// ? distance range
		        	1, 				// ? Duration range
		        	Ease.cubeOut
		        	);
			_emitter.emit("blood", x, y);
		}
	}
	public function gunShot(x:Float, y:Float, angle:Float)
	{
		for (i in 0...40)
		{ _emitter.setMotion("gunshot",  		// name
		        	angle + 20, 				// angle
		        	20, 			// distance
		        	0.2, 			// duration
		        	-40, 			// ? angle range
		        	-10, 			// ? distance range
		        	0.1, 				// ? Duration range
		        	Ease.quadOut
		        	);
			_emitter.emit("gunshot", x, y);
		}
	}
	public function death(x:Float, y:Float, width:Float, height:Float)
	{
		for (i in 0...200)
		{ 
			_emitter.emitInRectangle("death", x, y, width, height);
		}
	}
	
	public function wallhit(x:Float, y:Float) {
		for (i in 0...10)
		{ 
			_emitter.emit("wallhit", x, y);
		}
	}
	
	public override function update() {
		super.update();
	}


}
