package action_script{
	import flash.display.MovieClip;
	import flash.display.Loader;
	import flash.text.*;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.AsyncErrorEvent;
	import flash.events.NetStatusEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.media.Video;
	import flash.net.NetConnection;
	import flash.net.NetStream;

	import action_script.Thumbnail;
	import action_script.Loadingmonitor;
	import action_script.VideoBTN;

	public class Popout extends MovieClip {

		private var cnname_txt:TextField=new TextField();
		private var enname_txt:TextField=new TextField();
		private var author_txt:TextField=new TextField();
		private var from_txt:TextField=new TextField();
		private var info_txt:TextField=new TextField();

		private var format1:TextFormat = new TextFormat();
		private var format2:TextFormat = new TextFormat();
		private var format3:TextFormat = new TextFormat();

		private var entryXML:XML=new XML();
		private var thumbnailGroup:MovieClip=new MovieClip();
		private var detailIMG:Loader;
		private var loadingMonitor:Loadingmonitor=new Loadingmonitor();
		private var videobtn:VideoBTN=new VideoBTN();
		private var videoURL:String;
		private var vid:Video;
		private var nc:NetConnection;
		private var ns:NetStream;

		function Popout() {
			init();
		}
		private function init() {
			this.visible=false;

			cnname_txt.x=26;
			cnname_txt.y=35;
			cnname_txt.width=260;
			enname_txt.x=26;
			enname_txt.y=60;
			enname_txt.width=260;
			author_txt.x=26;
			author_txt.y=95;
			author_txt.width=260;
			from_txt.x=26;
			from_txt.y=120;
			from_txt.width=260;
			info_txt.x=26;
			info_txt.y=150;
			info_txt.width=260
			;

			//init textfield
			cnname_txt.multiline=false;
			cnname_txt.selectable=false;
			enname_txt.multiline=false;
			enname_txt.selectable=false;
			author_txt.multiline=false;
			author_txt.selectable=false;
			from_txt.multiline=false;
			from_txt.selectable=false;
			info_txt.selectable=false;
			info_txt.multiline=true;
			info_txt.wordWrap=true;
			info_txt.autoSize=TextFieldAutoSize.LEFT;

			//init textformate
			format1.color=0x99CC00;
			format1.size=16;
			format1.bold=true;
			format1.font="_sans";
			format2.font="_sans";
			format2.color=0xffffff;
			format2.size=14;
			format2.bold=true;
			format3.font="_sans";
			format3.color=0xdddddd;
			format3.leading=4;
			format3.size=12;

			addChild(cnname_txt);
			addChild(enname_txt);
			addChild(author_txt);
			addChild(from_txt);
			addChild(info_txt);


			addChild(thumbnailGroup);

			detailIMG=new Loader();
			detailIMG.contentLoaderInfo.addEventListener(Event.INIT,detailIMGLoaded);
			detailIMG.mask=detialimgmask;
			addChild(detailIMG);

			this.addChild(loadingMonitor);
			loadingMonitor.x=624;
			loadingMonitor.y=266;
			loadingMonitor.visible=false;

			closebtn.buttonMode =true;
			closebtn.useHandCursor=true;
			closebtn.addEventListener("mouseDown", closebtnPressed);
			closebtn.addEventListener("click", closebtnClicked);
			closebtn.addEventListener("mouseUp", closebtnMouseUp);
			closebtn.addEventListener("mouseOut", closebtnMouseUp);

			videobtn.addEventListener("click",loadVideo);

			//handle video
			nc = new NetConnection();
			nc.connect(null);
			//nc.addEventListener(NetStatusEvent.NET_STATUS, statusHandler);

			ns= new NetStream(nc);
			ns.addEventListener(AsyncErrorEvent.ASYNC_ERROR, asyncErrorHandler);
			ns.addEventListener(NetStatusEvent.NET_STATUS, statusHandler);

			vid = new Video(640,480);
			vid.visible=false;
			vid.addEventListener("click", onSwitchMovie);
		}
		private function statusHandler(e:NetStatusEvent):void {
			//trace("Listener Added!");

			switch (e.info.code) {
				case "NetStream.Buffer.Empty" :
					callLoadingMonitor();
					break;
				case "NetStream.Buffer.Full" :
					hideLoadingMonitor();
					break;
				case "NetStream.Play.Start" :
				detialimgmask.x=-370;
			detialimgmask.y=-485;
			detialimgmask.addEventListener("enterFrame",swapMask);
					hideLoadingMonitor();
					MovieClip(this.parent).stopMusic();
					//trace("haha")
					break;
				case "NetStream.Play.Stop" :

					//trace("OK");
					//MovieClip(this.root).playMusic()
					updateBigIMG(entryXML,1);
					break;
			}
		}
		private function asyncErrorHandler(e:AsyncErrorEvent):void {
			// ignore error
		}
		private function onSwitchMovie(e:MouseEvent):void {
			trace("haha");
			ns.togglePause();
		}
		private function formatText() {

			cnname_txt.setTextFormat(format1);
			enname_txt.setTextFormat(format1);
			author_txt.setTextFormat(format2);
			from_txt.setTextFormat(format2);
			info_txt.setTextFormat(format3);
		}
		private function closebtnMouseUp(e:Event) {
			e.currentTarget.alpha=1;
		}
		private function closebtnClicked(e:Event) {
			//e.currentTarget.alpha=1;
			 closeVideo() ;
			MovieClip(this.parent).hidePopout();
		}
		private function closebtnPressed(e:Event) {
			e.currentTarget.alpha=0.3;
		}
		private function swapMask(e:Event) {
			detialimgmask.x+=(304-detialimgmask.x)/4;
			detialimgmask.y+=(26-detialimgmask.y)/4;
			if (Math.abs(304-detialimgmask.x)<2) {
				detialimgmask.x=304;
				detialimgmask.y=26;
				e.target.removeEventListener("enterFrame",swapMask);
			}
		}
		private function detailIMGLoaded(e:Event) {
			//trace("detailIMGLoaded")
			detialimgmask.x=-370;
			detialimgmask.y=-485;
			detialimgmask.addEventListener("enterFrame",swapMask);
			hideLoadingMonitor();
		}
		private function clearThumbnail() {
			removeChild(thumbnailGroup);
			thumbnailGroup=new MovieClip();
			addChild(thumbnailGroup);
		}
		private function callLoadingMonitor() {
			this.addChild(loadingMonitor);
			loadingMonitor.visible=true;
		}
		private function hideLoadingMonitor() {
			loadingMonitor.visible=false;
		}
		private function loadVideo(e:Event) {
			detailIMG.visible=false;
			addChild(vid);
			vid.visible=true;
			vid.x=304;
			vid.y=26;
			vid.attachNetStream(ns);
			ns.play(videoURL);
			vid.mask=detialimgmask;

			//callLoadingMonitor();
		}
		private function closeVideo() {
			ns.close();
		}
		//public function
		public function loadData(entry:XML,imgID:int) {
			videobtn.visible=false
			entryXML=entry;
			//render text
			cnname_txt.text=entry.entryname_cn.toString();
			enname_txt.text=entry.entryname_eng.toString();
			author_txt.text=entry.entryauthor.toString();
			from_txt.text=entry.entryfrom.toString();
			info_txt.text=entry.entryinfo.toString();
			formatText();
			//generate thumnail
			clearThumbnail();
			for (var i:int=0; i<=int(entry.entryimagecount.toString())-1; i++) {
				var thumbnail:Thumbnail=new Thumbnail();
				thumbnailGroup.addChild(thumbnail);
				thumbnail.x=25;
				thumbnail.y=200;
				var targetX:int=166-136*(Math.floor(i/2));
				var targetY:int=416-105*(i%2);
				thumbnail.moveTo(targetX,targetY);
				thumbnail.loadData(entry,(i+1));
			}
			//check video

			if ( (entry.entryvideo.length()>=1)) {
				videobtn.visible=true
				//trace(entry.entryvideo.toString());
				videoURL="flv/"+entry.entryvideo.toString()+".flv";
				addChild(videobtn);
				videobtn.x=25;
				videobtn.y=200;
				//trace(entry.entryvideo.length())
				if (int(entry.entryimagecount.toString())==3) {
					
					videobtn.moveTo(30,311);
				} else if (int(entry.entryimagecount.toString())<3) {
					
					videobtn.moveTo(30,416);
				}
			}
			// load big img
			updateBigIMG(entry,imgID);
		}
		public function updateBigIMG(entry:XML,imgID:int) {
			//removeChild(vid)
			if (vid.visible==true) {
				vid.visible=false;
				closeVideo();
				MovieClip(this.parent).playMusic();
			}
			detailIMG.visible=true;
			detailIMG.mask=detialimgmask;
			detailIMG.x=304;
			detailIMG.y=26;

			var url:String="images/big/"+entry.entryid.toString()+"/"+imgID+".jpg";
			detailIMG.load(new URLRequest(url));
			callLoadingMonitor();
		}
	}
}