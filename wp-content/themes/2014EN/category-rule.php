<?php
    get_template_part( 'column', "left" );
?>

<div class="rightColumn column">
    <!--<h4 class="title">标题</h4>-->
    <?php
        //echo get_the_ID();
        the_content();
    ?>
</div>
</div>
<?php get_footer(); ?>