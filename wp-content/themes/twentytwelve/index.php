<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit">
    <title><?php wp_title("|",true,"right"); ?></title>
    <link rel="shortcut icon" href="<?php echo get_template_directory_uri(); ?>/images/frontend/app/favicon.png"
          mce_href="<?php echo get_template_directory_uri(); ?>/images/frontend/app/favicon.png" type="image/x-png">

    <link href="<?php echo get_template_directory_uri(); ?>/css/frontend/src/index.css" rel="stylesheet" type="text/css">
    <script src="<?php echo get_template_directory_uri(); ?>/js/frontend/src/baiduAnalytics.js"></script>

</head>
<body>
    <!--<div class="bgImgContainer">
        <img class="bgImg" src="<?php /*echo get_template_directory_uri(); */?>/images/frontend/app/index.jpg">
    </div>-->

    <div class="content indexContent">
        <h1 class="logo">
            <!--<object width="100%" height="300" data="<?php /*echo get_template_directory_uri(); */?>/images/frontend/app/logo.swf">
                <embed width="100%" height="300"  src="<?php /*echo get_template_directory_uri(); */?>/images/frontend/app/logo.swf"></embed>
            </object>-->
            <a href="<?php echo home_url(); ?>">logo</a>
        </h1>
        <ul class="links">
            <li>
                <a href="<?php
                $mainBlog=get_blog_details(2);
                echo $mainBlog->siteurl;
                ?>" class="current">2014</a>
            </li>
            <li>
                <a href="<?php
                $mainBlog=get_blog_details(4);
                echo $mainBlog->siteurl;
                ?>">2012</a>
            </li>
            <li>
                <a href="<?php
                $mainBlog=get_blog_details(6);
                echo $mainBlog->siteurl;
                ?>">2010</a>
            </li>
            <li>
                <a href="<?php
                $mainBlog=get_blog_details(8);
                echo $mainBlog->siteurl;
                ?>">2008</a>
            </li>
        </ul>
    </div>

</body>
</html>