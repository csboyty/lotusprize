package action_script{
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class Navball extends MovieClip {
		private var targetX:int=0;
		private var targetY:int=0;
		function Navball() {

		}
		private function running(e:Event) {
			this.x+=(targetX-this.x)/4;
			this.y+=(targetY-this.y)/4;
			if ((Math.abs(targetX-this.x)<=1)&&(Math.abs(targetY-this.y)<=1)) {
				this.x=targetX;
				this.y=targetY;
				e.target.removeEventListener("enterFrame",running);
			}
		}
		public function moveTo(tgtX:int,tgtY:int) {
			targetX=tgtX;
			targetY=tgtY;
			//this.alpha=0;
			//addEventListener("enterFrame", fadeIn);
			this.addEventListener("enterFrame",running);
		}
	}
}