<?php
/**
 * Created by JetBrains PhpStorm.
 * User: ty
 * Date: 14-3-20
 * Time: 上午10:15
 * To change this template use File | Settings | File Templates.
 */
get_header();
$newsId=5;
?>
<div class="main">
    <div class="rollImg">
        <ul id="rollImgList" class="rollImgList">
            <li>
                <img src="<?php echo get_template_directory_uri(); ?>/images/frontend/app/status1.jpg">
            </li>
            <li>
                <img src="<?php echo get_template_directory_uri(); ?>/images/frontend/app/status2.jpg">
            </li>
            <li>
                <img src="<?php echo get_template_directory_uri(); ?>/images/frontend/app/status3.jpg">
            </li>
            <li>
                <img src="<?php echo get_template_directory_uri(); ?>/images/frontend/app/status4.jpg">
            </li>
            <li>
                <img src="<?php echo get_template_directory_uri(); ?>/images/frontend/app/status5.jpg">
            </li>
        </ul>
        <ul id="rollNumberList" class="rollNumberList">
            <li num="1">
                <span>设计发现</span>
                <p>3.10-4.30</p>
            </li>
            <li num="2">
                <span>作品征集</span>
                <p>5.1-6.30</p>
            </li>
            <li num="3">
                <span>创新设计优秀奖评审</span>
                <p>7.10-8.1</p>
            </li>
            <li num="4">
                <span>孵化项目评审及工作营</span>
                <p>8.5-8.15</p>
            </li>
            <li num="5">
                <span>终评与成果推广</span>
                <p>10.8-10.10</p>
            </li>
        </ul>
    </div>
    <div class="content">
        <h3>新闻</h3>
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
                    <span class="return" >返回</span>
                    <div class="article" id="article">

                    </div>
                    <span class="return" >返回</span>
                </div>
            </div>
        </div>

    </div>
</div>
<?php get_footer(); ?>
</body>
</html>