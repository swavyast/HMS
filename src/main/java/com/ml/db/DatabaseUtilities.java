package com.ml.db;

import java.util.Optional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import ch.qos.logback.classic.Level;

public class DatabaseUtilities {

	private static final Logger LOG = configureLogger(DatabaseUtilities.class, Level.WARN);

	private DatabaseUtilities() {
		// private default constructor.
	}

	public static <T> Logger getLogger(Class<T> cls) {
		try {
			return LoggerFactory.getLogger(cls);
		} catch (Exception e) {
			DatabaseUtilities.getDetailedStackTrace(e);
			return null;
		}
	}

	public static void getDetailedStackTrace(Throwable t) {
		changeLoggingLevel(LOG, Level.ALL);
		Optional.ofNullable(t).ifPresent(ex -> {
			Throwable cause = ex.getCause();
			StringBuilder msg = new StringBuilder(ex.getMessage());
			while (cause != null) {
				cause = cause.getCause();
				msg = msg.append(cause.getMessage());
			}
			LOG.error(msg.toString());
		});
	}

	public static void changeLoggingLevel(Logger log, Level level) {
		if (log instanceof ch.qos.logback.classic.Logger logbackLogger)
			logbackLogger.setLevel(level);
	}

	public static <T> Logger configureLogger(Class<T> cls, Level level) {
		Logger logger = null;
		try {
			logger = LoggerFactory.getLogger(cls);
		} catch (Exception e) {
			DatabaseUtilities.getDetailedStackTrace(e);
		}
		try {
			if (logger instanceof ch.qos.logback.classic.Logger logbackLogger) {
				logbackLogger.setLevel(level);
			}
		} catch (Exception e) {
			DatabaseUtilities.getDetailedStackTrace(e);
		}
		return logger;
	}

}
