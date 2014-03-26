package action_script{
	import flash.display.MovieClip;
	import flash.events.Event;


	public class Loadingmonitor extends MovieClip {
		function Loadingmonitor() {
			init();
		}
		private function init() {
			greendot.mask=maskdots;
			this.addEventListener("enterFrame",rotating);
		}
		private function rotating(e:Event) {
			//trace(greendot.rotation)
			greendot.rotation+=20;
		}
	}
}