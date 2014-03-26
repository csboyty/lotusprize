function saveURL() {
    //如果路径中含有注册或者修改密码的信息就不注册
        var URL = $("#rootIframe").attr("src");
    if(URL.indexOf("web/valid_reset_password")==-1&&URL.indexOf("web/register/validate")==-1){
        var expiration = new Date((new Date()).getTime() + 15 * 60000);//设置时间
        $.cookie("URL", URL, { expires: expiration }); // 存储一个带15分钟期限的 cookie
    }
}
$(document).ready(function(){
    document.domain="lotusprize.com";
    var oldIframeURL="";
    var currentURL=null;
    //设置iframe的url
   if(location.href.indexOf("targetURL")!=-1){
        var urlPos=location.href.indexOf("targetURL");
        $("#rootIframe").attr("src",location.href.substring(urlPos+10));
    }else  if($.cookie("URL")){
        $("#rootIframe").attr("src",$.cookie("URL"));
   }
    //去监听iframe的url是否改变
    setInterval(function(){
         currentURL=$("#rootIframe").attr("src");
         if(oldIframeURL!=currentURL){
                 saveURL();
             oldIframeURL=currentURL;
         }
    },500);
});
