<?php
/*$newsId=5;
$url=get_category_link($newsId);
header("HTTP/1.1 301 Moved Permanently");
header("Location:$url");
exit();*/
$newsId=5;

query_posts( "cat=$newsId" );

get_template_part( 'category', "news");
?>