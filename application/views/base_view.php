<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="content-type" content="text/html;charset=UTF-8" />
    <meta charset="utf-8" />
    <title>RMA - Admin</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no, shrink-to-fit=no" />
    <script src="../../../../cdn-cgi/apps/head/fo9YPCqcjBazcqFmSokXapoL5xU.js"></script>
    <link rel="apple-touch-icon" href="pages/ico/60.png">
    <link rel="apple-touch-icon" sizes="76x76" href="pages/ico/76.png">
    <link rel="apple-touch-icon" sizes="120x120" href="pages/ico/120.png">
    <link rel="apple-touch-icon" sizes="152x152" href="pages/ico/152.png">
    <link rel="icon" type="image/x-icon" href="favicon.ico" />
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-touch-fullscreen" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="default">
    <meta content="" name="description" />
    <meta content="" name="author" />
    <link href="<?php echo assets_url()?>plugins/pace/pace-theme-flash.css" rel="stylesheet" type="text/css" />
    <link href="<?php echo assets_url()?>plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="<?php echo assets_url()?>plugins/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css" />
    <link href="<?php echo assets_url()?>plugins/jquery-scrollbar/jquery.scrollbar.css" rel="stylesheet" type="text/css" media="screen" />
    <link href="<?php echo assets_url()?>plugins/select2/css/select2.min.css" rel="stylesheet" type="text/css" media="screen" />
    <link href="<?php echo assets_url()?>plugins/switchery/css/switchery.min.css" rel="stylesheet" type="text/css" media="screen" />
    <link href="<?php echo assets_url()?>css/pages-icons.css" rel="stylesheet" type="text/css">
    <link class="main-stylesheet" href="<?php echo assets_url()?>css/themes/corporate.css" rel="stylesheet" type="text/css" />
    <?php echo $plugin_css; ?>
    <script type="text/javascript">
        window.onload = function() {
            // fix for windows 8
            if (navigator.appVersion.indexOf("Windows NT 6.2") != -1)
                document.head.innerHTML += '<link rel="stylesheet" type="text/css" href="<?php echo assets_url()?>css/windows.chrome.fix.css" />'
        }
    </script>
</head>

  <body class="fixed-header  windows desktop menu-pin pace-done">
    <?php echo $body; ?>
    <script type="text/javascript">
      var base_url = "<?=base_url()?>"
    </script>
    
    <script src="<?php echo assets_url()?>plugins/pace/pace.min.js" type="text/javascript"></script>
    <script src="<?php echo assets_url()?>plugins/jquery/jquery-3.2.1.min.js" type="text/javascript"></script>
    <script src="<?php echo assets_url()?>plugins/modernizr.custom.js" type="text/javascript"></script>
    <script src="<?php echo assets_url()?>plugins/jquery-ui/jquery-ui.min.js" type="text/javascript"></script>
    <script src="<?php echo assets_url()?>plugins/popper/umd/popper.min.js" type="text/javascript"></script>
    <script src="<?php echo assets_url()?>plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="<?php echo assets_url()?>plugins/jquery/jquery-easy.js" type="text/javascript"></script>
    <script src="<?php echo assets_url()?>plugins/jquery-unveil/jquery.unveil.min.js" type="text/javascript"></script>
    <script src="<?php echo assets_url()?>plugins/jquery-ios-list/jquery.ioslist.min.js" type="text/javascript"></script>
    <script src="<?php echo assets_url()?>plugins/jquery-actual/jquery.actual.min.js"></script>
    <script src="<?php echo assets_url()?>plugins/jquery-scrollbar/jquery.scrollbar.min.js"></script>
    <script type="text/javascript" src="<?php echo assets_url()?>plugins/select2/js/select2.full.min.js"></script>
    <script type="text/javascript" src="<?php echo assets_url()?>plugins/classie/classie.js"></script>
    <script src="<?php echo assets_url()?>plugins/switchery/js/switchery.min.js" type="text/javascript"></script>

    <script src="<?php echo assets_url()?>js/pages.js"></script>

    <script src="<?php echo assets_url()?>js/scripts.js" type="text/javascript"></script>
    <?php echo $plugin_js; ?>
    <?php echo $js; ?>
  </body>
</html>