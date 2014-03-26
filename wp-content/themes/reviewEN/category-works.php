<?php
/**
 * Created by JetBrains PhpStorm.
 * User: ty
 * Date: 14-3-21
 * Time: 上午10:50
 * To change this template use File | Settings | File Templates.
 */
$homeUrl=home_url();
$src="";
$class="worksContent";
if(strpos($homeUrl,"2012")){
    $src=content_url()."/worksFlash2012/works_english.html";
    $class="works2012Content";
}else if(strpos($homeUrl,"2010")){
    $src=content_url()."/worksFlash2010/LotusWebShell.html";
}else if(strpos($homeUrl,"2008")){
    $src=content_url()."/worksFlash2008/LotusWebShell.html";
}

get_header();
?>

<div class="content <?php echo $class; ?>">
    <iframe frameBorder="0" src="<?php echo $src; ?>"></iframe>
</div>
<?php get_footer(); ?>
</body>
</html>