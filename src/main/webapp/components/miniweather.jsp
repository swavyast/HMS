<%@page import="com.ml.config.WeatherWidget"%>
<%
    String key = WeatherWidget.getWeatherApiKey();
    // Escape single quotes in the API key to prevent JavaScript syntax errors
    key = key != null ? key.replace("'", "\\'") : null;
%>
<div id="openweathermap-widget-9"></div>
<script>
var myKey = '<%= key %>';
	window.myWidgetParam ? window.myWidgetParam : window.myWidgetParam = [];
	window.myWidgetParam.push({
		id : 9,
		cityid : '7279746',
		appid : myKey,
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