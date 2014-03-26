<?php
    get_template_part( 'column', "left" );
?>

<div class="rightColumn">
    <!--<h4 class="title">标题</h4>-->
    <div>
        <?php
            //echo get_the_ID();
            the_content();
        ?>
    </div>
</div>
</div>
<?php get_footer(); ?>
</body>
</html>