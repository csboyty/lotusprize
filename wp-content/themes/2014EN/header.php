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
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <title><?php wp_title("|",true,"right"); ?></title>
    <link type="text/css" rel="stylesheet" href="<?php echo get_template_directory_uri(); ?>/css/frontend/src/all.css">
    <link rel="shortcut icon" href="<?php echo get_template_directory_uri(); ?>/images/frontend/app/favicon.png"
          mce_href="<?php echo get_template_directory_uri(); ?>/images/frontend/app/favicon.png" type="image/x-png">
    <script src="<?php echo get_template_directory_uri(); ?>/js/frontend/lib/jquery-1.7.2.min.js"></script>
    <script src="<?php echo get_template_directory_uri(); ?>/js/frontend/src/baiduAnalytics.js"></script>
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
    <h1 class="logo">
        <a href="<?php echo home_url(); ?>">
            <img src="<?php echo get_template_directory_uri(); ?>/images/frontend/app/rotate.gif">
        </a>
    </h1>
    <ul class="links headerMenu">
        <li class="linkItem icsidItem">
            <a target="_blank" href="http://www.icsid.org/events/events/calendar1307.htm">
                <img src="<?php echo get_template_directory_uri(); ?>/images/frontend/app/iconIcsid.png">
            </a>
        </li>
        <li class="linkItem cumulItem"><a target="_blank" href="http://www.cumulusassociation.org/component/content/1921-call-for-entries-the-4th-lotusprize-international-design-competition/152">
                <img src="<?php echo get_template_directory_uri(); ?>/images/frontend/app/iconCumulus.png">
            </a></li>
    </ul>
    <div class="wpMenu">

        <ul class="mainMenu headerMenu" id="menu">
            <?php
            $main_items = wp_get_nav_menu_items($mainMenuId);
            //获取文章/分类展示页的category，is_category可以判断在当前分类页是否属于某一分类
            $currentCat=get_the_category();
            $isHome=false;
            $currentCatId=0;
            if(is_home()||is_category($newsId)){
                //$currentCatId=$newsId;
                $isHome=true;
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
                if($isHome){
                    if($key==0){
                        echo '<li><a href="' . $menu_item->url . '" class="active">' . $menu_item->title . '</a></li>';
                    }else{
                        echo '<li><a href="' . $menu_item->url . '">' . $menu_item->title . '</a></li>';
                    }
                }else{
                    if($menu_item->object_id==$currentCatId){
                        echo '<li><a href="' . $menu_item->url . '" class="active">' . $menu_item->title . '</a></li>';
                    }else{
                        echo '<li><a href="' . $menu_item->url . '">' . $menu_item->title . '</a></li>';
                    }
                }

            }
            ?>
        </ul>
        <ul class="wpLangMenu headerMenu" id="langMenu">
            <li><a href="<?php echo substr(home_url(),0,-2); ?>" >中文</a></li>
            <li><a href="<?php echo home_url(); ?>" class="active">English</a></li>
        </ul>
        <ul class="wpOptMenu headerMenu" id="optMenu">
            <li class="itemHome hidden"><a  href="/lp/s/{roleName}?_lang=en">My Lotusprize</a></li>
            <li class="itemLogout hidden"><a  href="/lp/s/logout">Logout</a></li>
            <li class="itemLogin hidden"><a  href="/lp/s/login?_lang=en">Login</a></li>
        </ul>
    </div>
</div>