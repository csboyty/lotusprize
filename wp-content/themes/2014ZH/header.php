<?php
    $mainMenuId=2;
    $newsId=5;
    $judgeId=6;
    $ruleId=7;
    $worksId=11;
?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php wp_title("|",true,"right"); ?></title>
    <link type="text/css" rel="stylesheet" href="<?php echo get_template_directory_uri(); ?>/css/frontend/src/all.css">
    <link rel="shortcut icon" href="<?php echo get_template_directory_uri(); ?>/images/frontend/app/favicon.png"
          mce_href="<?php echo get_template_directory_uri(); ?>/images/frontend/app/favicon.png" type="image/x-png">
    <script src="<?php echo get_template_directory_uri(); ?>/js/frontend/lib/jquery-1.7.2.min.js"></script>
    <script src="<?php echo get_template_directory_uri(); ?>/js/frontend/src/googleAnalytics.js"></script>
    <!--[if lt IE 9]>
        <script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script>
        <style type="text/css">
            .article img,.article video,.article object,.article embed{
                margin: auto;
                display: block;
                border: none;
            }
            .article video,.article object,.article embed{
                width:592px;
                height:333px;
            }
        </style>
    <![endif]-->
    <script src="<?php echo get_template_directory_uri(); ?>/js/frontend/src/index.js"></script>
</head>
<body>
<div class="wpHeader">
    <h1 class="logo">
        <a href="<?php echo home_url(); ?>">
            <img src="<?php echo get_template_directory_uri(); ?>/images/frontend/app/rotate.gif">
        </a>
    </h1>
    <ul class="rightMenu">
        <!--<li><a href="#">登录</a></li>-->
    </ul>
    <div class="wpMenu">

        <ul class="mainMenu" id="menu">
            <?php
            $main_items = wp_get_nav_menu_items($mainMenuId);
            //获取文章/分类展示页的category，is_category可以判断在当前分类页是否属于某一分类
            $currentCat=get_the_category();
            $currentCatId=0;
            if(is_home()||is_category($newsId)){
                $currentCatId=$newsId;
            }else if(is_category($ruleId)||$currentCat[0]->cat_ID==$ruleId){
                $currentCatId=$ruleId;
            }else if(is_category($worksId)||$currentCat[0]->cat_ID==$worksId){
                $currentCatId=$worksId;
            }else if(is_category($judgeId)){
                $currentCatId=$judgeId;
            }

            //print_r($currentCatId);
            //print_r($main_items);
            foreach ($main_items as $key => $menu_item ) {
                if($menu_item->object_id==$currentCatId){
                    echo '<li><a href="' . $menu_item->url . '" class="active">' . $menu_item->title . '</a></li>';
                }else{
                    echo '<li><a href="' . $menu_item->url . '">' . $menu_item->title . '</a></li>';
                }

            }
            ?>
        </ul>
        <ul class="langMenu" id="langMenu">
            <li><a href="<?php echo home_url(); ?>" class="active">中文</a></li>
            <li><a href="<?php echo home_url()."en"; ?>" >English</a></li>
        </ul>
    </div>
</div>