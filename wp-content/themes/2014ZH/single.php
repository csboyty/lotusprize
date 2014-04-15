<?php
$ruleId="7";
$currentCat=get_the_category();
//print_r($currentCat);
if($currentCat[0]->cat_ID==$ruleId){
    //print_r("dddd");
    get_template_part( 'category', "rule" );
}else{
    //需要获取主循环的内容
    while(have_posts()):the_post();
        ?>

        <h2><?php the_title(); ?></h2>

        <?php
        the_content();
    endwhile;
}

?>

