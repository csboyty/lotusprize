package action_script{
	import flash.events.Event;
	import flash.geom.*;
	import flash.display.*
	public class Welcome extends MovieClip {
		
		private var theN:int=0;
		function Welcome() {
			init();
		}
		private function init()  {
			//gradientbg.width=this.stage.stageWidth
			//gradientbg.height=this.stage.stageHeight
			this.addEventListener("mouseDown",onTouch);
			this.addEventListener("enterFrame",drawBG);
		}
		private function onTouch(e:Event) {

			MovieClip(this.root).hideWelcome();

		}
		private function refreshBG(){			
			gradientbg2.removeChildAt(0)
			}
		private function drawBG(e:Event) {
			theN+=1
			var type:String = GradientType.LINEAR;
			var colors:Array = [0xc9de1b,0x005043];
			var alphas:Array = [1, 0];
			var ratios:Array = [0, 255];
			var spreadMethod:String = SpreadMethod.PAD;
			var interp:String = InterpolationMethod.LINEAR_RGB;
			var focalPtRatio:Number = 1;

			var matrix:Matrix = new Matrix();
			var boxWidth:Number = 400;
			var boxHeight:Number =1000;
			var boxRotation:Number = theN/40;// 90˚
			var tx:Number =1;
			var ty:Number = 0;
			matrix.createGradientBox(boxWidth, boxHeight, boxRotation, tx, ty);

			var square:Shape = new Shape();
			square.graphics.beginGradientFill(type, 
			                            colors,
			                            alphas,
			                            ratios, 
			                            matrix, 
			                            spreadMethod, 
			                            interp, 
			                            focalPtRatio);
			square.graphics.drawRect(0, 0, 1024, 576);
			
			

			//removeChild()
			ovalmask.rotation-=1
			//ovalmask2.rotation-=1
			refreshBG()
			gradientbg2.addChild(square);
			//gradientbg3.addChild(square2);


		}
	}
}