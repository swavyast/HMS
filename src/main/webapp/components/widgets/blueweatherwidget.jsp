<div id="openweathermap-widget-9"></div>
<script>
	window.myWidgetParam ? window.myWidgetParam : window.myWidgetParam = [];
	window.myWidgetParam.push({
		id : 9,
		cityid : '2643743',
		appid : '0cac0036fcb241c38f444fa9d04b029b',
		units : 'metric',
		containerid : 'openweathermap-widget-9',
	});
	(function() {
		var script = document.createElement('script');
		script.async = true;
		script.charset = "utf-8";
		script.src = "//openweathermap.org/themes/openweathermap/assets/vendor/owm/js/weather-widget-generator.js";
		var s = document.getElementsByTagName('script')[0];
		s.parentNode.insertBefore(script, s);
	})();
</script>