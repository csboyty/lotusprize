<?php
    $mainMenuId=2;
    $newsId=5;
    $judgeId=6;
    $ruleId=7;
    $worksId=8;
?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title><?php wp_title("|",true,"right"); ?></title>
    <link type="text/css" rel="stylesheet" href="<?php echo get_template_directory_uri(); ?>/css/frontend/src/all.css">
    <script src="<?php echo get_template_directory_uri(); ?>/js/frontend/lib/jquery-1.7.2.min.js"></script>
    <script src="<?php echo get_template_directory_uri(); ?>/js/frontend/src/googleAnalytics.js"></script>
    <!--[if lt IE 9]>

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
    <h1>
        <a href="<?php echo home_url(); ?>">logo</a>
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
            }else if(is_category($ruleId)||is_category($judgeId)||$currentCat[0]->cat_ID==$ruleId){
                $currentCatId=$ruleId;
            }else if(is_category($worksId)||$currentCat[0]->cat_ID==$worksId){
                $currentCatId=$worksId;
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
            <li><a href="<?php echo substr(home_url(),0,-2); ?>">中文</a></li>
            <li><a href="<?php echo home_url(); ?>" class="active">English</a></li>
        </ul>
    </div>
</div>