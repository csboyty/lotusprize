package action_script{
	import flash.display.MovieClip;
	import flash.geom.ColorTransform;
	import flash.events.Event;

	//定义类
	public class MainMenu extends MovieClip {
		//私有变量

		//公共变量
		//构造器函数
		function MainMenu() {
			init();
		}
		//私有方法
		private function init() {
			logohotspot.addEventListener("click",logoHandler)
			focusOnBtn(1);
			for (var i:int=1; i<=5; i++) {
				this["btn" + i].buttonMode=true; 
				this["btn" + i].useHandCursor=true
				this["btn" + i].addEventListener("click" ,this["btn"+i+"Handler"]);
			}
		}
		private function logoHandler(e:Event){
			MovieClip(this.parent).showWelcome();
			}
		private function btn1Handler(e:Event) {
			var theRoot:MovieClip=MovieClip(this.parent);
			theRoot.gotoScreen(1) 
			focusOnBtn(1);
		}
		private function btn2Handler(e:Event) {
			var theRoot:MovieClip=MovieClip(this.parent);
			theRoot.gotoScreen(2) 
			focusOnBtn(2);
		}
		private function btn3Handler(e:Event) {
			var theRoot:MovieClip=MovieClip(this.parent);
			theRoot.gotoScreen(3) 
			focusOnBtn(3);
		}
		private function btn4Handler(e:Event) {
			var theRoot:MovieClip=MovieClip(this.parent);
			theRoot.gotoScreen(4) 
			focusOnBtn(4);
		}
		private function btn5Handler(e:Event) {
			var theRoot:MovieClip=MovieClip(this.parent);
			theRoot.gotoScreen(5) 
			focusOnBtn(5);
		}
		private function focusOnBtn(btnID:int):void {
			for (var i:int=1; i<=5; i++) {
				if (i!=btnID) {
					focusOffBtn(i);
				}
			}
			if (this["btn" + btnID].hasEventListener("enterFrame")) {
				this["btn" + btnID].removeEventListener("enterFrame",whiteOut);
				this["btn" + btnID].removeEventListener("enterFrame",whiteIn);
			}
			this["btn" + btnID].addEventListener("enterFrame",whiteIn);
			this.addEventListener("enterFrame",castLight);
			//this["btn"+btnID].whitebox.y=20;

		}
		private function focusOffBtn(btnID:int):void {
			if (this["btn" + btnID].hasEventListener("enterFrame")) {
				this["btn" + btnID].removeEventListener("enterFrame",whiteIn);
				this["btn" + btnID].removeEventListener("enterFrame",whiteOut);
			}
			this["btn" + btnID].addEventListener("enterFrame",whiteOut);
		}
		private function castLight(e:Event) {
			var activeBtnID:int=MovieClip(this.parent).currentScreenID;
			bglight.x+=(this["btn"+activeBtnID].x-bglight.x)/4;
			bglight.width+=(this["btn"+activeBtnID].width-bglight.width)/4;
			if (Math.abs(this["btn"+activeBtnID].x-bglight.x)<2) {
				bglight.x=this["btn"+activeBtnID].x;
				bglight.width=this["btn"+activeBtnID].width;
				e.target.removeEventListener("enterFrame", castLight);
			}
		}
		private function whiteIn(e:Event) {
			var wb:MovieClip=e.target.whitebox;
			wb.y+=(20-wb.y)/4;
			if (wb.y<=21) {
				wb.y=20;
				e.target.removeEventListener("enterFrame", whiteIn);
			}
		}
		private function whiteOut(e:Event) {
			var wb:MovieClip=e.target.whitebox;
			wb.y+=(60-wb.y)/4;
			if (wb.y>=59) {
				wb.y=60;
				e.target.removeEventListener("enterFrame", whiteOut);
			}
		}
		
		//公共方法
	}
}