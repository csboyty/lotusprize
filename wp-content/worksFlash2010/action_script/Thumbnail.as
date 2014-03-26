package action_script{
	import flash.display.MovieClip;
	import flash.display.Loader;
	//import flash.display.Stage;
	import flash.geom.Transform;
	import flash.geom.ColorTransform;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import action_script.Loadingmonitor;


	//定义类
	public class Thumbnail extends MovieClip {
		//私有变量
		private var thumbnailLoader:Loader;
		private var targetX:int=0;
		private var targetY:int=0;
		private var entryInfo:XML;
		private var thumbnailID:int=1;
		private var loadingMonitor:Loadingmonitor=new Loadingmonitor();
		//公共变量


		//构造器
		function Thumbnail() {
			init();
		}
		//私有方法
		private function init() {					
			this.buttonMode=true;
			this.useHandCursor=true;
			
			goldmedal.visible=false;
			silvermedal.visible=false;
			coppermedal.visible=false;
			innomedal.visible=false;
			
			this.addChild(loadingMonitor);
			loadingMonitor.x=60;
			loadingMonitor.y=45;
			
			thumbnailLoader=new Loader();
			thumbnailLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, thumbnailLoaded);
			thumbnailLoader.contentLoaderInfo.addEventListener(Event.UNLOAD, thumbnailUnloaded);
			thumbnailLoader.addEventListener("click", thumbnailClicked);

			thumbnailLoader.addEventListener("mouseDown", btnPressed);
			thumbnailLoader.addEventListener("mouseUp", btnMouseUp);
			thumbnailLoader.addEventListener("mouseOut", btnMouseUp);
		}
		private function btnPressed(e:Event) {
			e.currentTarget.alpha=0.3;
		}
		private function btnMouseUp(e:Event) {
			e.currentTarget.alpha=1;

		}
		private function thumbnailLoaded(e:Event):void {
			addChild(thumbnailLoader);
			showMedal();
			thumbnailLoader.mask=themask;
			this.alpha=0;
			addEventListener("enterFrame", fadeIn);
			hideLoadingMonitor()
		}
		private function thumbnailUnloaded(e:Event):void {
			removeEventListener("enterFrame", fadeIn);
			this.alpha=0;
		}
		private function thumbnailClicked(e:Event):void {
			MovieClip(this.root).showDetail(entryInfo,thumbnailID);
			//this.alpha=0;
			//unloadData()
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
		private function callLoadingMonitor() {
			this.addChild(loadingMonitor);
			loadingMonitor.visible=true
		}
		private function hideLoadingMonitor() {
			loadingMonitor.visible=false;
			
		}
		//公共方法
		public function loadData(XMLData:XML,theID:int) {
			entryInfo=XMLData;
			thumbnailID=theID;
			var thumbnailURL:String="images/small/"+entryInfo.entryid.toString()+"/"+thumbnailID+".jpg";
			thumbnailLoader.load(new URLRequest(thumbnailURL));
			callLoadingMonitor();
		}
		public function unloadData() {
			entryInfo=new XML();
			thumbnailLoader.unload();
		}
		public function moveTo(tgtX:int,tgtY:int) {
			targetX=tgtX;
			targetY=tgtY;
			this.alpha=0;
			addEventListener("enterFrame", fadeIn);
			this.addEventListener("enterFrame",running);
		}
		public function showMedal() {
			if (entryInfo.entrymedal!=null) {
				if (entryInfo.entrymedal.toString()=="gold") {
					goldmedal.visible=true;
					this.addChild(goldmedal);
				} else if (entryInfo.entrymedal.toString()=="silver") {
					silvermedal.visible=true;
					this.addChild(silvermedal);
				} else if (entryInfo.entrymedal.toString()=="copper") {
					coppermedal.visible=true;
					this.addChild(coppermedal);
				}else if (entryInfo.entrymedal.toString()=="inno") {
					innomedal.visible=true;
					this.addChild(innomedal);
				}
			}
		}
	}
}