$(document).ready(function(){

	//图片简介弹出
$(".picbox a").hover(function () {
	$(this).find('p').slideDown(200);
}, function () {
	$(this).find('p').slideUp(200);
});

$(".workbox a").hover(function () {
	$(this).find('div').slideDown(200);
}, function () {
	$(this).find('div').slideUp(200);
});
    
	$(".Fright a").hover(function () {
	$(this).find('div.OH').slideDown(200);
}, function () {
	$(this).find('div.OH').slideUp(200);
});

//赛事内容切换
	
$("#FR1").click(function(){	
	$(".Fhover").removeClass("Fhover");
	$("#FR1").addClass("Fhover");
	$(".Fright div").css("display","none");
	$(".fr1").css("display","block");
	$("li.Fhover a").css("color","#999");
});

$("#FR2").click(function(){	
	$(".Fhover").removeClass("Fhover");
	$(".second").addClass("Fhover");
	$(".Fright div").css("display","none");
	$(".fr2").css("display","block");
	$("li.Fhover a").css("color","#999");
    $("#FR2").css("color","#3F8158");
});

$("#FR3").click(function(){	
	$(".Fhover").removeClass("Fhover");
	$(".second").addClass("Fhover");
	$(".Fright div").css("display","none");
	$(".fr3").css("display","block");
	$("li.Fhover a").css("color","#999");
	$("#FR3").css("color","#3F8158");
});

$("#FR4").click(function(){	
	$(".Fhover").removeClass("Fhover");
	$("#FR4").addClass("Fhover");
	$(".Fright div").css("display","none");
	$(".fr4").css("display","block");
	$("li.Fhover a").css("color","#999");
});





//报名须知切换

$("#N1").click(function(){	
	$(".Fhover").removeClass("Fhover");
	$("#N1").addClass("Fhover");
	$(".Fright div").css("display","none");
	$(".N1_m").css("display","block");	
});

$("#N2").click(function(){	
	$(".Fhover").removeClass("Fhover");
	$("#N2").addClass("Fhover");	
	$(".Fright div").css("display","none");
	$(".N2_m").css("display","block");
});

$("#N3").click(function(){	
	$(".Fhover").removeClass("Fhover");
	$("#N3").addClass("Fhover");	
	$(".Fright div").css("display","none");
	$(".N3_m").css("display","block");
	
	
});

$("#N4").click(function(){	
	$(".Fhover").removeClass("Fhover");
	$("#N4").addClass("Fhover");	
	$(".Fright div").css("display","none");
	$(".N4_m").css("display","block");
	
});

//bm切换
	
 $("#bm").mouseenter(function(){
  	$("#bm").css("display","none");
	//$("#bmc").animate({width:141},"slow");
	$("#bmc").css("display","block");
  });
  $("#bmc").mouseleave(function(){
$("#bmc").css("display","none");
	$("#bm").animate({width:64},"slow");
	$("#bm").css("display","block");
  });






//登入注册状态切换
/*document.getElementById('registbtn').onclick=function(){
	$("#loginbox").css("display","none");
	$("#loginoverbox").css("display","none");
	$("#registoverbox").css("display","none");
	$("#FGpasspordbox").css("display","none");
	$("#registbox").slideDown(500);
	$("#registbox").css("display","block");
	}   

document.getElementById('loginbtn').onclick=function(){
	$(".Fhover").removeClass("Fhover");
	$("#D4").addClass("Fhover");
	$(".Fright div").css("display","none");
	$(".N4_m").show(500);	
	}   	
	
	document.getElementById('gologinbtn3').onclick=function(){
	$("#loginoverbox").css("display","none");
	$("#loginbox").css("display","none");
	$("#registbox").css("display","none");
	$("#registoverbox").slideDown(500);
	$("#FGpasspordbox").css("display","none");
	$("#registoverbox").css("display","block");
	}   	
	 	
	//FGpasspord忘记密码
	document.getElementById('FGpasspord').onclick=function(){
	$("#loginoverbox").css("display","none");
	$("#loginbox").css("display","none");
	$("#registbox").css("display","none");
	$("#registoverbox").css("display","none");
	$("#FGpasspordbox").slideDown(500);
	$("#FGpasspordbox").css("display","block");
	}   	
	
	//个人资料状态切换
	
	document.getElementById('GRbtn').onclick=function(){
	$("#GRbox").css("display","none");
	$("#GRoverbox").slideDown(500);
	$("#GRoverbox").css("display","block");
	} 
	
	document.getElementById('GRoverbtn').onclick=function(){
	$("#GRoverbox").css("display","none");
	$("#GRbox").slideDown(500);
	$("#GRbox").css("display","block");
	} 
	
	
	//LOGIN
$("#D1").click(function(){	
	$(".Fhover").removeClass("Fhover");
	$("#D1").addClass("Fhover");
	$(".Fright div").css("display","none");
	$(".N1_m").css("display","block");	
	$("#loginoverbox").css("display","none");
	$("#registbox").css("display","none");
	$("#registoverbox").css("display","none");
	$("#FGpasspordbox").css("display","none");
	$("#loginbox").slideDown(500);
	$("#loginbox").css("display","block");
});

$("#D2").click(function(){	
	$(".Fhover").removeClass("Fhover");
	$("#D2").addClass("Fhover");
	$(".Fright div").css("display","none");
	$(".N2_m").css("display","block");	
	$("#tab1").css("display","block");
});

$("#D3").click(function(){	
	$(".Fhover").removeClass("Fhover");
	$("#D3").addClass("Fhover");
	$(".Fright div").css("display","none");
	$(".N3_m").css("display","block");	
});

$("#D4").click(function(){	
	$(".Fhover").removeClass("Fhover");
	$("#D4").addClass("Fhover");
	$(".Fright div").css("display","none");
	$(".N4_m").css("display","block");	
});

$("#D5").click(function(){	
	$(".Fhover").removeClass("Fhover");
	$("#D5").addClass("Fhover");
	$(".Fright div").css("display","none");
	$(".N5_m").css("display","block");
});
$("#D6").click(function(){	
	$(".Fhover").removeClass("Fhover");
	$("this").addClass("Fhover");
	$(".N6_m").css("display","block");
});


		
//tab
$("#tab1btn").click(function(){	
	$("this").addClass("tabhover");
	$("#tab2").css("display","none");
	$("#tab3").css("display","none");
	$("#tab1").css("display","block");
});

$("#tab2btn").click(function(){	
	$("#tab2btn").addClass("tabhover");
	$("#tab3btn").removeClass("tabhover");
	$("#tab1").css("display","none");
	$("#tab3").css("display","none");
	$("#tab2").css("display","block");	
	$(".Fright #tab2 div").css("display","inherit");
});

$("#tab3btn").click(function(){	
	$("#tab3btn").addClass("tabhover");
	$("#tab2").css("display","none");
	$("#tab1").css("display","none");
	$("#tab3").css("display","block");
	$(".Fright #tab3 div").css("display","inherit");
});*/


//BJbtn
$(".BJbtn").click(function(){	
    $(".Fhover").removeClass("Fhover");
	$("this").addClass("Fhover");
	$(".Fright div").css("display","none");
	$(".N2_m").css("display","block");	
});
//exitno
$("#exitno").click(function(){	
	$(".N6_m").css("display","none");	
});


//moreW1

$("#ok2").click(function(){	
	alert(22);	
});


});

