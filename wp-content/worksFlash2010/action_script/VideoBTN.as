package action_script{
	import flash.display.MovieClip;
	import flash.events.Event;
	public class VideoBTN extends MovieClip {
		private var targetX:int=0;
		private var targetY:int=0;
		function VideoBTN() {
			init();
		}
		private function init() {
			this.buttonMode =true;
			this.useHandCursor=true;
			this.addEventListener("mouseDown", videobtnPressed);
			this.addEventListener("mouseUp", videobtnMouseUp);
			this.addEventListener("mouseOut", videobtnMouseUp);
			
		}
		private function videobtnMouseUp(e:Event) {
			e.currentTarget.alpha=1;
		}
		
		private function videobtnPressed(e:Event) {
			e.currentTarget.alpha=0.3;
		}
		private function fadeIn(e:Event):void {
			this.alpha+=0.04;
			if (this.alpha>=0.98) {
				this.alpha=1;
				e.target.removeEventListener("enterFrame", fadeIn);
			}
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
		//public function
		public function moveTo(tgtX:int,tgtY:int) {
			targetX=tgtX;
			targetY=tgtY;
			this.alpha=0;
			addEventListener("enterFrame", fadeIn);
			this.addEventListener("enterFrame",running);
		}
	}
}