<?php
/**
 * Created by JetBrains PhpStorm.
 * User: ty
 * Date: 14-3-20
 * Time: 上午11:46
 * To change this template use File | Settings | File Templates.
 */
$judgeId=6;
$judgeChildren=get_categories(array("parent"=>$judgeId,"hide_empty"=>false,'orderby'=>'id'));
//print_r($judgeChildren);
//get_template_part( 'column', "left" );
get_header();

?>
    <ul class="judgeList">
        <?php
        $showDir="";
        foreach($judgeChildren as $key=>$value){
            $posts=get_posts(array('posts_per_page' => -1,  'category' => $value->term_id ));

        ?>
        <h3 class="title"><?php echo $value->cat_name; ?></h3>
        <?php
            foreach($posts as $post){

                if(has_post_thumbnail($post->ID)){
                    $thumbnail_id=get_post_thumbnail_id($post_id);
                    $showDir= wp_get_attachment_image_src($thumbnail_id,"post-thumbnail");
                    $showDir=$showDir[0];
                }
                ?>

                <li>
                    <a class="judgeItem" href="<?php echo get_permalink($post->ID); ?>">
                        <div class="thumb">
                            <img src="<?php echo $showDir; ?>">
                        </div>
                        <div class="infoContainer">
                            <div class="info">
                                <h4><?php echo $post->post_title; ?></h4>
                                <p><?php /*echo $post->post_excerpt; */?></p>
                            </div>
                        </div>
                    </a>
                </li>

            <?php  };  ?>
        <?php }; ?>
    </ul>
<?php get_footer(); ?>
</body>
</html>