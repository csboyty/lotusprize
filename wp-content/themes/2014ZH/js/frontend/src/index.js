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
            this.roll();
        },
        stopRoll:function(stopFlag){
            if(interVal){

                //清除原来的自动滚动，下面再绑定
                clearInterval(interVal);
            }

            if(stopFlag){
                $("#rollImgList").stop();//停止当前动画
            }
        }
    }
})();
$(document).ready(function(){

    //执行一次,这样interVal就有值
    index.roll();

    //点击事件
    $("#rollNumberList li").click(function(){
        index.numberClickHandler($(this));
    });

    //鼠标浮动停止滚动
    $("#rollImgList li").hover(function(){
        index.stopRoll(false);
    },function(){
        index.roll();
    });

    //点击新闻
    $("#newsList a").click(function(){
        var url=$(this).attr("href");
        $("#blackout").show();
        $("#article").load(url,function(){
            $("#newsContainer").css("overflow","visible");
            $("#blackout").hide();
            $("#newsPanel").animate({
                "left":"-100%",
                "backgroundPositionX":"70%",
                "backgroundPositionY":"20px"
            },1000);
        });

        return false;
    });
    $(".return").click(function(){
        $("#newsPanel").animate({
            "left":"0%",
            "backgroundPositionX":"20%",
            "backgroundPositionY":"20px"
        },1000,function(){
            $("#article").html("");
            $("#newsContainer").css("overflow","hidden");
        });
    });
});