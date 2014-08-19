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

    <div class="rollImg">
        <ul id="rollImgList" class="rollImgList">
            <li>
                <img src="<?php echo get_template_directory_uri(); ?>/data/status/status1.jpg">
            </li>
            <li>
                <a class="topicLink" href="http://www.lotusprize.com/2014/archives/710">全部命题汇总，请点击此处</a>
                <img class="advertise" num="1" src="<?php echo get_template_directory_uri(); ?>/data/status/status2.jpg">
                <img class="advertise" num="2" src="<?php echo get_template_directory_uri(); ?>/data/advertise/1.jpg">
            </li>
            <li>
                <img src="<?php echo get_template_directory_uri(); ?>/data/status/status3.jpg">
            </li>
            <li>
                <a class="awardsLink" href="http://www.lotusprize.com/lp/s/gallery">获奖作品详情 / 欢迎大家对获奖作品的原创性进行监督</a>
                <img src="<?php echo get_template_directory_uri(); ?>/data/status/status4.jpg">
            </li>
            <li>
                <img src="<?php echo get_template_directory_uri(); ?>/data/status/status5.jpg">
            </li>
        </ul>

    </div>
    <div class="numberListContainer">
        <ul id="rollNumberList" class="rollNumberList">
            <li num="1">
                <span>设计发现</span>
                <p class="date">3.10-4.30</p>
            </li>
            <li num="2">
                <span>作品征集</span>
                <p class="date">5.10-7.7</p>
            </li>
            <li num="3">
                <span>创新设计优秀奖评审</span>
                <p class="date">7.10-8.12</p>
            </li>
            <li num="4">
                <span>孵化项目评审及工作营</span>
                <p class="date">8.20-9.20</p>
            </li>
            <li num="5">
                <span>终评与成果推广</span>
                <p class="date">10.8-10.10</p>
            </li>
        </ul>
        <h2 class="scheduleTip">2014芙蓉杯日程安排</h2>
    </div>
    <div class="content newsContainer">
            <h3 class="newsTitle">新闻</h3>

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
<?php get_footer(); ?>