$(document).ready(function(){

	//图片简介弹出
	$(".picbox a").hover(function () {
		$(this).find('p').slideDown(300);
	}, function () {
		$(this).find('p').slideUp(300);
	});
	
	$(".workbox a").hover(function () {
		$(this).find('div.W').slideDown(300);
	}, function () {
		$(this).find('div.W').slideUp(300);
	});
	
		$(".Fright a").hover(function () {
		$(this).find('div.OH').slideDown(300);
	}, function () {
		$(this).find('div.OH').slideUp(300);
	});
	
 //workboxD open
	$(".workbox a").click(function () {
		var url =  $(this).attr('href') ; 
		$(".workshow").show();
		art.dialog.open( url , {title: $(this).attr('title') || '芙蓉杯,国际工业设计创新大赛' ,width:860, height:450,fixed: true,resize: false,lock: true, background: '#999', 
    opacity: 0.87,	});
		return false;
	});

//bm切换
	
 $("#bm").mouseenter(function(){
  	$("#bm").hide()
	$("#bmc").show();
  });
  $("#bmc").mouseleave(function(){
$("#bmc").hide();
	$("#bm").animate({width:64},"slow");
	$("#bm").show();
  });
  



 
});

