package action_script{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.geom.ColorTransform;
	import action_script.Navball;

	public class Navbar extends MovieClip {
		private var leftbtn_active:Boolean=false;
		private var rightbtn_active:Boolean=true;
		private var pageIndex:int=1;
		private var pageIndicator:MovieClip=new MovieClip();
		function Navbar() {
			init();
		}
		private function init() {

			addChild(pageIndicator);
			
			leftbtn.buttonMode =true
			leftbtn.useHandCursor=true
			leftbtn.addEventListener("mouseDown",btnPressed);
			leftbtn.addEventListener("mouseUp",btnClicked);
			leftbtn.addEventListener("mouseOut",btnClicked);
			leftbtn.addEventListener("click",leftbtnClicked);
			
			rightbtn.buttonMode=true
			rightbtn.useHandCursor=true
			rightbtn.addEventListener("mouseDown",btnPressed);
			rightbtn.addEventListener("mouseUp",btnClicked);
			rightbtn.addEventListener("mouseOut",btnClicked);
			rightbtn.addEventListener("click",rightbtnClicked);
		}
		private function leftbtnClicked(e:Event) {
			MovieClip(this.parent).previousPage();
		}
		private function rightbtnClicked(e:Event) {
			MovieClip(this.parent).nextPage();
		}
		private function btnPressed(e:Event) {
			e.currentTarget.alpha=0.3;
		}
		private function btnClicked(e:Event) {
			var btnActive=this[e.currentTarget.name.toString()+"_active"];
			if (btnActive) {
				e.currentTarget.alpha=1;
			}
		}
		private function reloadPageIndicator() {
			removeChild(pageIndicator);
			pageIndicator=new MovieClip()  ;
			addChild(pageIndicator);
		}
		//公共方法

		public function generatePageBall(pageNum:int) {
			reloadPageIndicator();
			for (var i:int=1; i<=pageNum; i++) {
				var ball:Navball= new Navball();
				pageIndicator.addChild(ball);
				ball.x=270;
				ball.y=36;
				ball.alpha=0.5;
				var targetX=(540-(pageNum-1)*30)/2+(i-1)*30;
				ball.moveTo(targetX,36);
			}
			updatePageIndicator();
		}
		public function updatePageIndicator() {
			for (var i:int=0; i<=(pageIndicator.numChildren-1); i++) {
				pageIndicator.getChildAt(i).alpha=0.3;
			}
			var currentPage=MovieClip(this.parent).currentPage;
			pageIndicator.getChildAt(currentPage-1).alpha=1;
		}
		public function updateBtnState() {
			var theParent:MovieClip=MovieClip(this.parent);
			if (theParent.currentPage<=1) {
				leftbtn_active=false;
				leftbtn.alpha=0.3;
			} else {
				leftbtn_active=true;
				leftbtn.alpha=1;
			}
			if (theParent.currentPage>=theParent.totalPage) {
				rightbtn_active=false;
				rightbtn.alpha=0.3;
			} else {
				rightbtn_active=true;
				rightbtn.alpha=1;
			}
		}
	}
}