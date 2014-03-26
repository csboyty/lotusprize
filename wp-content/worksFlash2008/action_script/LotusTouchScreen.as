package action_script{
	import flash.display.MovieClip;
	import flash.display.StageDisplayState
	import flash.display.StageScaleMode
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.media.Sound;
	import flash.media.SoundChannel


	import action_script.MainMenu;
	import action_script.Thumbnail;
	import action_script.Popout;
	import action_script.Welcome;
	import action_script.Navbar
	
	
	//定义类
	public class LotusTouchScreen extends MovieClip {
		//私有变量
		private var list1:XML=new XML();
		private var list2:XML=new XML();
		private var list3:XML=new XML();
		private var list4:XML=new XML();
		private var list5:XML=new XML();

		private var url1:String="xml/finallist.xml";
		private var url2:String="xml/groupA.xml";
		private var url3:String="xml/groupB.xml";
		private var url4:String="xml/groupC.xml";
		private var url5:String="xml/groupD.xml";

		private var bgMusic:Sound=new Sound();
		private var bgChannel:SoundChannel= new SoundChannel();
		private var thumbnailScreen:MovieClip;
		private var welcomeScreen:Welcome;
		private var popout:Popout;
		private var mainmenu:MainMenu
		private var navbar:Navbar

		//公共变量
		public var currentScreenID:int;
		public var currentPage:int;
		public var totalPage:int;
		//构造器函数
		function LotusTouchScreen() {
			init();
		}
		//私有方法
		private function init() {
			navbar=new Navbar()
			addChild(navbar)
			navbar.x=240
			navbar.y=660
			
			mainmenu=new MainMenu()
			addChild(mainmenu)
			mainmenu.x=24
			mainmenu.y=28			
			
			thumbnailScreen=new MovieClip()
			addChild(thumbnailScreen);
			
			popout=new Popout()
			addChild(popout);
			popout.x=23;
			popout.y=23;
			
			loadList1();
			loadList2();
			loadList3();
			loadList4();
			loadList5();
			
			currentScreenID=1;
			currentPage=1;
			
			showTitle(1);
			showTitle(2);
			showTitle(3);
			
			bgMusic.addEventListener(Event.COMPLETE, musicLoaded)
			bgMusic.load(new URLRequest("music/stars.mp3"))
			//playMusic()
			
			if(stage){
				stage.displayState = StageDisplayState.FULL_SCREEN
				}
			
			//stage.scaleMode = StageScaleMode.NO_SCALE
		}
     
		private function musicLoaded(e:Event) {
			var theMusic:Sound =e.target as Sound;
			bgChannel=theMusic.play(999);

		}
		private function loadList1() {
			var loader:URLLoader=new URLLoader();
			loader.load(new URLRequest(url1));
			loader.addEventListener(Event.COMPLETE,list1Loaded);
		}
		private function list1Loaded(e:Event) {
			list1=XML(e.target.data);
			renderScreen1();
		}
		private function loadList2() {
			var loader:URLLoader=new URLLoader();
			loader.load(new URLRequest(url2));
			loader.addEventListener(Event.COMPLETE,list2Loaded);
		}
		private function list2Loaded(e:Event) {
			list2=XML(e.target.data);
		}
		private function loadList3() {
			var loader:URLLoader=new URLLoader();
			loader.load(new URLRequest(url3));
			loader.addEventListener(Event.COMPLETE,list3Loaded);
		}
		private function list3Loaded(e:Event) {
			list3=XML(e.target.data);
		}
		private function loadList4() {
			var loader:URLLoader=new URLLoader();
			loader.load(new URLRequest(url4));
			loader.addEventListener(Event.COMPLETE,list4Loaded);
		}
		private function list4Loaded(e:Event) {
			list4=XML(e.target.data);
		}
		private function loadList5() {
			var loader:URLLoader=new URLLoader();
			loader.load(new URLRequest(url5));
			loader.addEventListener(Event.COMPLETE,list5Loaded);
		}
		private function list5Loaded(e:Event) {
			list5=XML(e.target.data);
		}
		private function fadeIn(e:Event) {
			var mc:MovieClip=MovieClip(e.target);

			mc.alpha+= 0.044;
			if (mc.alpha >= 0.98) {
				mc.alpha=1;
				e.target.removeEventListener("enterFrame",fadeIn);
			}
		}
		private function fadeOut(e:Event) {
			var mc:MovieClip=MovieClip(e.target);
			mc.alpha-= 0.04;
			if (mc.alpha <= 0.02) {
				mc.alpha=0;
				mc.visible=false;
				e.target.removeEventListener("enterFrame",fadeOut);
				//trace("removelistener")
			}
		}
		private function hideTitle(titleID) {
			var theTitle=this["title" + titleID];
			theTitle.removeEventListener("enterFrame",fadeIn);
			theTitle.addEventListener("enterFrame",fadeOut);
		}
		private function showTitle(titleID) {
			var theTitle=this["title" + titleID];
			theTitle.visible=true;
			theTitle.removeEventListener("enterFrame",fadeOut);
			theTitle.addEventListener("enterFrame",fadeIn);
		}
		private function navibarUp(e:Event) {
			navbar.y+=(475-navbar.y)/4;

			if (navbar.y<=477) {
				navbar.y=475;
				e.target.removeEventListener("enterFrame",navibarUp);
			}
		}
		private function navibarDown(e:Event) {
			navbar.y+=(700-navbar.y)/4;
			if (navbar.y>=698) {
				navbar.y=700;
				e.target.removeEventListener("enterFrame",navibarDown);
			}
		}
		private function showNaviBar() {
			//navbar.visible=true;
			navbar.removeEventListener("enterFrame",navibarDown);
			navbar.addEventListener("enterFrame",navibarUp);
			navbar.generatePageBall(totalPage);
			navbar.updateBtnState();
		}
		private function hideNaviBar() {
			//navbar.visible=false;
			navbar.removeEventListener("enterFrame",navibarUp);
			navbar.addEventListener("enterFrame",navibarDown);
		}
		private function listThumbnails() {
			var theList:XML=XML(this["list" + currentScreenID]);

			var j:int=theList.entry.length() - 18 * currentPage;
			if (j < 0) {
				j=theList.entry.length() - 18 *( currentPage - 1);
			} else {
				j=18;
			}
			for (var i:int=0; i <= j - 1; i++) {
				var entryXML:XML=new XML(theList.entry[i + (currentPage - 1) * 18].toXMLString());
				var thumbnail:Thumbnail=new Thumbnail();
				thumbnail.loadData(entryXML,1);
				thumbnailScreen.addChild(thumbnail);
				thumbnail.x=100;
				thumbnail.y=100;
				var targetX:int=title1.x + (i % 6 ) * 150;
				//trace(targetX);
				var targetY:int=title1.y + 30 + Math.floor(i / 6) * 100;
				thumbnail.moveTo(targetX,targetY);
			}
		}
		private function refreshScreen() {
			removeChild(thumbnailScreen);
			thumbnailScreen=new MovieClip()  ;
			addChild(thumbnailScreen);
		}
		private function renderScreen1() {
			refreshScreen();
			for (var i:int=0; i <= list1.groupA.entry.length() - 1; i++) {
				var entryXML1:XML=new XML(list1.groupA.entry[i].toXMLString());
				var thumbnail1:Thumbnail=new Thumbnail();
				thumbnail1.loadData(entryXML1,1);
				
				thumbnailScreen.addChild(thumbnail1);
				thumbnail1.x=100;
				thumbnail1.y=100;
				thumbnail1.moveTo(title1.x + i * 150,title1.y + 30);
			}
			for (var j:int=0; j <= list1.groupB.entry.length() - 1; j++) {
				var entryXML2:XML=new XML(list1.groupB.entry[j].toXMLString());
				var thumbnail2:Thumbnail=new Thumbnail();
				thumbnail2.loadData(entryXML2,1);
				
				thumbnailScreen.addChild(thumbnail2);
				thumbnail2.x=100;
				thumbnail2.y=100;
				thumbnail2.moveTo(title2.x + j * 150,title2.y + 30);
			}
			for (var k:int=0; k <= list1.groupC.entry.length() - 1; k++) {
				var entryXML3:XML=new XML(list1.groupC.entry[k].toXMLString());
				var thumbnail3:Thumbnail=new Thumbnail();
				thumbnail3.loadData(entryXML3,1);
				
				thumbnailScreen.addChild(thumbnail3);
				thumbnail3.x=100;
				thumbnail3.y=100;
				thumbnail3.moveTo(title3.x + k * 150,title3.y + 30);
			}
		}
		private function renderScreen() {
			refreshScreen();
			currentPage=1;
			var theList:XML=XML(this["list" + currentScreenID]);
			totalPage=Math.ceil(theList.entry.length()/18);
			showNaviBar();
			listThumbnails();
		}
		
		
		
		//公共方法
		public function stopMusic(){
			bgChannel.stop()
			}
		public function playMusic(){
			bgChannel=bgMusic.play(999)
			
			}
		
		public function showWelcome() {
			welcomeScreen= new Welcome();
			this.addChild(welcomeScreen);
		}
		public function hideWelcome() {
			removeChild(welcomeScreen);

			//trace(welcomeScreen)
		}
		public function showPopout() {

			popout.visible=true;

			this.addChild(popout);
		}
		public function hidePopout() {
			popout.visible=false;
		}
		public function showDetail(entry:XML,imgID:int) {
			if (popout.visible==false) {
				showPopout();
				popout.loadData(entry,imgID);
			} else {
				this.addChild(popout);
				popout.updateBigIMG(entry,imgID);
			}
		}
		public function nextPage() {
			if (currentPage+1<=totalPage) {
				currentPage+=1;
				refreshScreen();
				listThumbnails();
				navbar.updateBtnState();
				navbar.updatePageIndicator();
			}
		}
		public function previousPage() {
			if (currentPage-1>=1) {
				currentPage-=1;
				refreshScreen();
				listThumbnails();
				navbar.updateBtnState();
				navbar.updatePageIndicator();
			}
		}
		public function gotoScreen(screenID:int) {
			if (screenID != currentScreenID) {
				switch (screenID) {
					case 1 :
						//第1屏
						currentScreenID=1;
						currentPage=1;
						showTitle(1);
						showTitle(2);
						showTitle(3);
						hideTitle(4);
						hideTitle(5);
						hideTitle(6);
						hideTitle(7);
						hideNaviBar();
						renderScreen1();
						break;
					case 2 :
						//第2屏
						currentScreenID=2;
						currentPage=1;
						hideTitle(1);
						hideTitle(2);
						hideTitle(3);
						showTitle(4);
						hideTitle(5);
						hideTitle(6);
						hideTitle(7);
						renderScreen();
						break;
					case 3 :
						//第3屏
						currentScreenID=3;
						hideTitle(1);
						hideTitle(2);
						hideTitle(3);
						hideTitle(4);
						showTitle(5);
						hideTitle(6);
						hideTitle(7);

						renderScreen();
						break;
					case 4 :
						//第4屏
						currentScreenID=4;
						hideTitle(1);
						hideTitle(2);
						hideTitle(3);
						hideTitle(4);
						hideTitle(5);
						showTitle(6);
						hideTitle(7);
						renderScreen();
						break;
					case 5 :
						//第5屏
						currentScreenID=5;
						hideTitle(1);
						hideTitle(2);
						hideTitle(3);
						hideTitle(4);
						hideTitle(5);
						hideTitle(6);
						showTitle(7);
						renderScreen();
						break;
				}
			}
		}
	}
}