<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="refresh" content="3;url=<?php echo home_url(); ?>">
    <title><?php wp_title("|",true,"right"); ?></title>
    <link rel="shortcut icon" href="<?php echo get_template_directory_uri(); ?>/images/frontend/app/favicon.png"
          mce_href="<?php echo get_template_directory_uri(); ?>/images/frontend/app/favicon.png" type="image/x-png">
    <link type="text/css" rel="stylesheet" href="<?php echo get_template_directory_uri(); ?>/css/frontend/src/all.css">

</head>
<body>

<div class="wpHeader">
    <h1 class="logo">
       <a href="<?php echo home_url(); ?>">logo</a>
    </h1>
</div>

<div class="_404Content">
    Oops!The page is not found,back to<a href="<?php echo home_url(); ?>" class="backHome">home</a>
</div>
</body>