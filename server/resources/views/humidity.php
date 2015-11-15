<!DOCTYPE html>
<html>
<head>
    <title>Humidity</title>
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
            }],
            latestTime = 0,
            time;
        for (var i = 0; i < models.length; i++) {
            time = parseInt(models[i].time);
            if (time > latestTime) {
                latestTime = time;
            }
            chartData[0].values.push({
                time: time,
                y: models[i].hum,
            });
        }

        $(function() {
            var chart = $('#chart').epoch({
                type: 'time.line',
                data: chartData,
                axes: ['left', 'bottom', 'right']
            });

            window.setInterval(function() {
                $.get('/api/v1/temp_hum/latest/' + latestTime, function(data) {
                    if (typeof data === 'object' && Object.keys(data).length > 0) {
                        time = parseInt(data.time);
                        chart.push([{
                            time: time,
                            y: data.hum,
                        }]);
                        latestTime = time;
                    }
                });
            }, 1000);
        });
    </script>
</body>
</html>
