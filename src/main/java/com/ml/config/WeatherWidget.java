package com.ml.config;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import org.slf4j.Logger;

import com.ml.db.DatabaseUtilities;

import ch.qos.logback.classic.Level;

public class WeatherWidget {
	private static final String CONFIG_FILE = "/app.properties"; // Note the leading '/' indicating the root of the
																	// classpath
	private static final String API_KEY_PROPERTY = "weatherApiKey";
	private static final Logger LOG = DatabaseUtilities.configureLogger(WeatherWidget.class, Level.TRACE);

	private WeatherWidget() {
		// private default constructor
	}

	public static String getWeatherApiKey() {
		try (InputStream input = WeatherWidget.class.getResourceAsStream(CONFIG_FILE)) {
			Properties prop = new Properties();
			if (input != null) {
				LOG.info("Loading properties in WeatherWidget...");
				prop.load(input);
				return prop.getProperty(API_KEY_PROPERTY);
			} else {
				LOG.error("Unable to load " + CONFIG_FILE + ". Make sure the file is in the classpath.");
				return null;
			}
		} catch (IOException e) {
			DatabaseUtilities.getDetailedStackTrace(e);
			return null;
		}
	}
}
