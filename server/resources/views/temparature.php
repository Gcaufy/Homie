<!DOCTYPE html>
<html>
<head>
    <title>Temparature</title>
    <style src="/assets/css/epoch.min.css"></style>
    <style type="text/css">
        .wrapper { width: 5%; }
        .epoch { width: 100%; min-height: 300px; height: auto; }
    </style>
</head>
<body>
    <div class="wrapper"></div>
    <div id="chart" class="epoch"></div>
    <div class="wrapper"></div>
    <script src="/assets/js/jquery-2.1.4.min.js"></script>
    <script src="/assets/js/d3.min.js"></script>
    <script src="/assets/js/epoch.min.js"></script>
    <script type="text/javascript">
        var models = JSON.parse('<?= json_encode($models) ?>'),
            chartData = [{
                values: []
            }];
        for (var i = 0; i < models.length; i++) {
            chartData[0].values.push({
                time: models[i].time,
                y: models[i].temp,
            });
        }

        $(function() {
            var chart = $('#chart').epoch({
                    type: 'time.line',
                    data: chartData,
                    axes: ['left', 'bottom', 'right']
                }),
                interval = 5 * 60 * 1000;

            window.setInterval(function() {
                $.get('temp_hum/latest', function(data) {
                    var length = chartData[0].values.length;
                    lastTime = chartData[0].values[length - 1];
                    if (data && data.time > lastTime) {
                        chart.push([{
                            time: data.time,
                            y: data.temp,
                        }]);
                    }
                });
            }, interval);
        });
    </script>
</body>
</html>
