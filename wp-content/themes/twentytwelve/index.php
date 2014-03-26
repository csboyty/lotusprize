<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title><?php wp_title("|",true,"right"); ?></title>
    <link href="<?php echo get_template_directory_uri(); ?>/css/frontend/src/index.css" rel="stylesheet" type="text/css">


</head>
<body>
    <!--<div class="bgImgContainer">
        <img class="bgImg" src="<?php /*echo get_template_directory_uri(); */?>/images/frontend/app/index.jpg">
    </div>-->

    <div class="content">
        <h1 class="logo">
            <img src="<?php echo get_template_directory_uri(); ?>/images/frontend/app/logo.png">
        </h1>
        <ul class="links">
            <li>
                <a href="http://www.lotusprize.com/2014/">
                    <img class="normal" src="<?php echo get_template_directory_uri(); ?>/images/frontend/app/2014.png">
                    <img class="hover" src="<?php echo get_template_directory_uri(); ?>/images/frontend/app/2014Hover.png">
                </a>
            </li>
            <li>
                <a href="http://www.lotusprize.com/2012/">
                    <img class="normal" src="<?php echo get_template_directory_uri(); ?>/images/frontend/app/2012.png">
                    <img class="hover" src="<?php echo get_template_directory_uri(); ?>/images/frontend/app/2012Hover.png">
                </a>
            </li>
            <li>
                <a href="http://www.lotusprize.com/2010/">
                    <img class="normal" src="<?php echo get_template_directory_uri(); ?>/images/frontend/app/2010.png">
                    <img class="hover" src="<?php echo get_template_directory_uri(); ?>/images/frontend/app/2010Hover.png">
                </a>
            </li>
            <li>
                <a href="http://www.lotusprize.com/2008/">
                    <img class="normal" src="<?php echo get_template_directory_uri(); ?>/images/frontend/app/2008.png">
                    <img class="hover" src="<?php echo get_template_directory_uri(); ?>/images/frontend/app/2008Hover.png">
                </a>
            </li>
        </ul>
    </div>

</body>
</html>