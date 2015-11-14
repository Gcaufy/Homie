<!DOCTYPE html>
<html>
<head>
    <title>Camera</title>
    <style type="text/css">
        .full { height: 100%; width: 100%; }
    </style>
</head>
<body class="full">
    <img class="full" src="http://<?= env('CAMERA_IP') ?>:8081/">
</body>
</html>
