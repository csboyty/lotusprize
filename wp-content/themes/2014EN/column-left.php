<?php
/**
 * Created by JetBrains PhpStorm.
 * User: ty
 * Date: 14-3-20
 * Time: 上午11:47
 * 章程和评委页的左边栏
 */
$ruleMenuId=4;
$ruleId=7;
$judgeId=6;

get_header();

?>
<div class="content ruleContent">
    <div class="leftColumn">
        <ul>
            <?php
            $posts=get_posts(array('posts_per_page' => -1,  'category' => $ruleId,'order'=> 'DESC', ));
            $current_id=get_the_ID();
            //print_r(get_the_category());
            //print_r($current_id);
            foreach($posts as $post){
                if($current_id==$post->ID){
                    echo '<li><a href="' . get_permalink($post->ID) . '" class="active">' . $post->post_title . '</a></li>';
                }else{
                    echo '<li><a href="' . get_permalink($post->ID) . '">' . $post->post_title . '</a></li>';
                }

            }

            //重置上面循环对页面造成的影响,在分类页默认是最后一篇文章在主循环中
            wp_reset_postdata();
            ?>
        </ul>
        <ul class="ruleMenu">
            <?php
            $rule_items = wp_get_nav_menu_items($ruleMenuId);

            //echo $currentKey;
            foreach ($rule_items as $key => $menu_item ) {
                if(is_category($judgeId)){
                    echo '<li><a href="' . $menu_item->url . '" class="active">' . $menu_item->title . '</a></li>';
                }else{
                    if($key==1){
                        echo '<li><a target="_black" href="' . $menu_item->url . '">' . $menu_item->title . '</a></li>';
                    }else{
                        echo '<li><a href="' . $menu_item->url . '">' . $menu_item->title . '</a></li>';
                    }
                }
            }
            ?>
        </ul>
    </div>