<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="refresh" content="3;url=<?php echo home_url(); ?>">

    <title><?php wp_title("|",true,"right"); ?></title>
    <link rel="shortcut icon" href="<?php echo get_template_directory_uri(); ?>/images/frontend/app/favicon.png"
          mce_href="<?php echo get_template_directory_uri(); ?>/images/frontend/app/favicon.png" type="image/x-png">
    <link href="<?php echo get_template_directory_uri(); ?>/css/frontend/src/index.css" rel="stylesheet" type="text/css">

</head>
<body>
<div class="bgImgContainer">
    <img class="bgImg" src="<?php echo get_template_directory_uri(); ?>/images/frontend/app/404.jpg">
</div>
<div class="content">
    <a href="<?php echo home_url(); ?>" class="backHome">
        <img src="<?php echo get_template_directory_uri(); ?>/images/frontend/app/404Content.png">
    </a>
</div>
</body>
