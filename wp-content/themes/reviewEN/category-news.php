<?php
/**
 * Created by JetBrains PhpStorm.
 * User: ty
 * Date: 14-3-20
 * Time: 上午10:15
 * To change this template use File | Settings | File Templates.
 */
$homeUrl=home_url();
$src="";
if(strpos($homeUrl,"2012")){
    $src=get_template_directory_uri()."/images/frontend/app/2012Complete.jpg";
}else if(strpos($homeUrl,"2010")){
    $src=get_template_directory_uri()."/images/frontend/app/2010Complete.jpg";
}else if(strpos($homeUrl,"2008")){
    $src=get_template_directory_uri()."/images/frontend/app/2008Complete.jpg";
}

get_header();
$newsId=5;
?>
<div class="main">
    <div class="rollImg">
        <img src="<?php echo $src; ?>">
    </div>

    <div class="content">
        <h3>News</h3>
        <div class="newsContainer" id="newsContainer">
            <div class="newsPanel" id="newsPanel">
                <div class="column">
                    <ul id="newsList" class="newsList">
                        <?php while (have_posts()) : the_post();?>

                            <li>
                                <a title="<?php the_title(); ?>" href="<?php the_permalink(); ?>">
                                    <?php echo get_the_date("Y-m-d"); ?>
                                    &nbsp;&nbsp;&nbsp;
                                    <?php the_title(); ?></a>
                            </li>
                        <?php
                        endwhile;
                        ?>
                    </ul>

                </div>
                <div class="column" id="articleColumn">
                    <span class="return" >return</span>
                    <div class="article" id="article">

                    </div>
                    <span class="return" >return</span>
                </div>
            </div>
        </div>

    </div>
</div>
<?php get_footer(); ?>
</body>
</html>