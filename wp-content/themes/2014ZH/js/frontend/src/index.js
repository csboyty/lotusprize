/**
 * Created with JetBrains WebStorm.
 * User: ty
 * Date: 14-3-19
 * Time: 下午4:43
 * To change this template use File | Settings | File Templates.
 */
var index=(function(){
    var currentNumber=2;//目前的滚动数字，首次进入的滚动应该是2
    var liCount=5;//总共的图片数量,灵活一点的话是在页面初始化后获取
    var interVal=null;//记录setInterval的返回值
    var status={
        1:"2014/04/30",
        2:"2014/07/07",
        3:"2014/08/12",
        4:"2014/09/20",
        5:"2014/10/10"
    };
    return {
        roll:function(){
            interVal=setInterval(function(){
                if(currentNumber>liCount){
                    currentNumber=1;
                }

                $("#rollImgList").animate({
                    "left":-(currentNumber-1)*100+"%"
                },800,function(){
                    $("#rollNumberList li").removeClass("active");
                    $("#rollNumberList li[num='"+currentNumber+"']").addClass("active");
                    currentNumber++;
                })
            },5000);
        },
        rollAdvertise:function(){
            var count= 2,current= 2,currentEl=null;
            setInterval(function(){
                if(current>count){
                    current=1;
                }
                currentEl=$(".advertise").eq(current-1);
                $(".advertise").hide(400);
                currentEl.show(800);
                current++;

            },5000);
        },
        numberClickHandler:function(el){
            var rollImgEl=$("#rollImgList");

            this.stopRoll(true);

            //清除其他页面数字的活动页类
            $("#rollNumberList li").removeClass("active");

            currentNumber=el.attr("num");//目标的数字，要跳到第几张图片

            rollImgEl.animate({
                "left":-(currentNumber-1)*100+"%"
            },2000);


            el.addClass("active");

            //重新绑定interVal
            //this.roll();
        },
        stopRoll:function(stopFlag){
            if(interVal){

                //清除原来的自动滚动，下面再绑定
                clearInterval(interVal);
            }

            if(stopFlag){
                $("#rollImgList").stop();//停止当前动画
            }
        },
        setContentHeight:function(){
            if($("body").height()<=$(window).height()){
                $(".content").css("minHeight",$(window).height()-305);
            }
        },
        windowScroll:function(){
            var lis=$("#newsList .hidden");
            if(lis.length!=0){
                if(lis.length>10){
                    $("#newsList .hidden").slice(0,10).removeClass("hidden");
                }else{
                    $("#newsList .hidden").slice(0,lis.length).removeClass("hidden");
                }
            }
        },
        checkLogin:function(){
            $.getJSON("http://www.lotusprize.com/lp/s/authenticateStatus?callback=?",function(data){
                var rightMenu= $("#optMenu");
                if(data.authenticated){
                    rightMenu.find(".itemLogin").remove();
                    rightMenu.find("li").removeClass("hidden");

                    rightMenu.find(".itemHome a").attr("href",function(index,href){
                        return href.replace("{roleName}",data.roleName);
                    })

                }else{
                    rightMenu.find(".itemLogin").removeClass('hidden');
                    rightMenu.find("li").not(".itemLogin").remove();
                }
            });
        },
        setDeadLine:function(){
            var deadLineTime=new Date(status["2"]).getTime()+1000*60*60*24;
            var currentTime=new Date().getTime();
            var time = Math.ceil((deadLineTime-currentTime) / (1000 * 60 * 60 * 24));
            $("#deadLine").text(time);
        },
        initStatus:function(){
            for(var i in status){
                if(new Date().getTime()<new Date(status[i]).getTime()+1000*60*60*24){
                    $("#rollNumberList li[num='"+i+"'] ").addClass("active");
                    $("#rollImgList").css("left",-(i-1)*100+"%");
                    break;
                }
            }
        },
        init:function(){
            //this.setDeadLine();
            this.setContentHeight();
            this.windowScroll();
            //this.rollAdvertise();
            this.checkLogin();
            this.initStatus();
        }
    }
})();
$(document).ready(function(){

    index.init();
    //index.setContentHeight();

    //index.initStatus();

    $(window).resize(function() {
        index.setContentHeight();
    });

    //index.windowScroll();

    //滚动事件
    $(window).scroll(function(){
        if($(document).height()-$(window).height()<=$(window).scrollTop()){
            index.windowScroll();
        }
    });

    //执行一次,这样interVal就有值
    //index.roll();
    //index.rollAdvertise();


    //点击事件
    $("#rollNumberList li").click(function(){
        index.numberClickHandler($(this));
    });

    //鼠标浮动停止滚动
    /*$("#rollImgList li").hover(function(){
        index.stopRoll(false);
    },function(){
        index.roll();
    });*/

    //点击新闻
    /*$("#newsList a").click(function(){
        var url=$(this).attr("href");
        $("#blackout").show();
        $("#article").load(url,function(){
            $("#newsContainer").css("overflow","visible");
            $("#blackout").hide();
            $("#newsPanel").animate({
                "left":"-100%",
                "backgroundPositionX":"70%",
                "backgroundPositionY":"20px"
            },1000,function(){
                $("#newsContainer").width("115%");
            });
        });

        return false;
    });*/
    $(".return").click(function(){
        $("#newsPanel").animate({
            "left":"0%",
            "backgroundPositionX":"20%",
            "backgroundPositionY":"20px"
        },1000,function(){
            $("#article").html("");
            $("#newsContainer").css("overflow","hidden").width("117.5%");
        });
    });

    $(".judgeItem").click(function(){
        var href=$(this).attr("href");

        $("#blackout").show();
        $("#popContent").load(href,function(){
            $("#popWindow").removeClass("hidden");
        });

        return false;
    });

    $("#closePopWindow").click(function(){
        $("#popWindow").addClass("hidden");
        $("#blackout").hide();
        return false;
    });
});