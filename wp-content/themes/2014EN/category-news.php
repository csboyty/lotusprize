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
                <img src="<?php echo get_template_directory_uri(); ?>/data/status/status1.jpg">
            </li>
            <li>
                <a class="topicLink" href="http://www.lotusprize.com/2014en/archives/631">
                    Days Till Deadline:<span id="deadLine" class="deadLine">0</span>
                </a>
                <img class="advertise" num="1" src="<?php echo get_template_directory_uri(); ?>/data/status/status2.jpg">
                <img class="advertise" num="2" src="<?php echo get_template_directory_uri(); ?>/data/advertise/1.jpg">
            </li>
            <li>
                <img src="<?php echo get_template_directory_uri(); ?>/data/status/status3.jpg">
            </li>
            <li>
                <img src="<?php echo get_template_directory_uri(); ?>/data/status/status4.jpg">
            </li>
            <li>
                <img src="<?php echo get_template_directory_uri(); ?>/data/status/status5.jpg">
            </li>
        </ul>
        <ul id="rollNumberList" class="rollNumberList">
            <li  num="1">
                <span>Design Discovery</span>
                <p>3.10-4.30</p>
            </li>
            <li num="2">
                <span>Call for Entries</span>
                <p>5.10-6.30</p>
            </li>
            <li num="3">
                <span>Preliminary Assessment</span>
                <p>7.10-8.1</p>
            </li>
            <li num="4">
                <span>Incubation Assessment and Workshop</span>
                <p>8.5-8.15</p>
            </li>
            <li num="5">
                <span>Final Adjudication</span>
                <p>10.8-10.10</p>
            </li>
        </ul>
    </div>
    <div class="content">
        <h3>News</h3>
        <div class="newsContainer" id="newsContainer">
            <div class="newsPanel" id="newsPanel">
                <div class="column">
                    <ul id="newsList" class="newsList">
                        <?php while (have_posts()) : the_post();?>

                            <li class="hidden">
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