function saveURL() {
    //如果路径中含有注册或者修改密码的信息就不注册
    var URL = $("#rootEnglishIframe").attr("src");
    if(URL.indexOf("web/valid_reset_password")==-1&&URL.indexOf("web/register/validate")==-1){
        var expiration = new Date((new Date()).getTime() + 15 * 60000);//设置时间
        $.cookie("EnglishURL", URL, { expires: expiration }); // 存储一个带15分钟期限的 cookie
    }
}
$(document).ready(function(){
    document.domain="lotusprize.com";
    var oldIframeURL="";
    var currentURL=null;
    //设置iframe的url
    if(location.href.indexOf("targetURL")!=-1){
        var urlPos=location.href.indexOf("targetURL");
        $("#rootEnglishIframe").attr("src",location.href.substring(urlPos+10));
    }else  if($.cookie("EnglishURL")){
        $("#rootEnglishIframe").attr("src",$.cookie("EnglishURL"));
    }
    //去监听iframe的url是否改变
    setInterval(function(){
        currentURL=$("#rootEnglishIframe").attr("src");
        if(oldIframeURL!=currentURL){
            saveURL();
            oldIframeURL=currentURL;
        }
    },500);
});
