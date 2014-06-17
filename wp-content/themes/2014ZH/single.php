<?php
$ruleId=7;
$judgeId=6;
$currentCat=get_the_category();

//print_r($currentCat);
if($currentCat[0]->cat_ID==$ruleId){
    //print_r("dddd");
    get_template_part( 'category', "rule" );
}else if($currentCat[0]->parent==$judgeId){

    //需要获取主循环的内容
    while(have_posts()):the_post();
        $post_id=get_the_ID();
        $thumbnail_id=get_post_thumbnail_id($post_id);
        $showDir= wp_get_attachment_image_src($thumbnail_id,"post-thumbnail");
        $showDir=$showDir[0];
        ?>

        <div class="left">
            <img class="thumb" src="<?php echo $showDir; ?>">
        </div>
        <div class="right">
            <div>
                <h2 class="title"><?php the_title(); ?></h2>
                <p class="excerpt"><?php echo get_the_excerpt(); ?></p>
            </div>
            <div class="contentDetail">
                <?php
                if(get_the_content()){
                    the_content();
                }else{
                    echo "暂无详细资料";
                }
                ?>
            </div>
        </div>

        <?php

    endwhile;
}else{
    //需要获取主循环的内容
    get_header();

    while(have_posts()):the_post();
        ?>
        <div class="content article">
            <h2><?php the_title(); ?></h2>

            <?php
            the_content();
            ?>
        </div>
        <?php
    endwhile;

    get_footer();
}

?>

