package action_script{
	import flash.display.MovieClip;
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.net.URLRequest;
	import flash.events.Event
	import flash.events.ProgressEvent
	import flash.display.StageDisplayState;
	import flash.display.StageScaleMode;
	
	import action_script.Loadingmonitor
	
	public class LotusWebShell extends MovieClip{

		private var main:Loader=new Loader();
		private var monitor:Loadingmonitor=new Loadingmonitor()
		
		function LotusWebShell() {
			init();
		}
		private function init() {

			//stage.displayState = StageDisplayState.FULL_SCREEN;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			addChild(main)
			main.x=-8
			main.load(new URLRequest("LotusTouchScreen.swf"))
			main.contentLoaderInfo.addEventListener(Event.COMPLETE, mainLoaded)
			main.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, mainProgress)
			
			addChild(monitor)
			monitor.visible=true
			monitor.x=512
			monitor.y=288
			
		}
		private function mainLoaded(e:Event){
			monitor.visible=false
			}
		private function mainProgress(e:Event){
			 var m_info:LoaderInfo = e.target as LoaderInfo;
            var m_percent:uint = (m_info.bytesLoaded/m_info.bytesTotal)*100;
			monitor.thesun.y=(1-m_percent/100)*15
			}
	}
}