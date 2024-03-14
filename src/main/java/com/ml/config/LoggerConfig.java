package com.ml.config;

import org.slf4j.LoggerFactory;

import ch.qos.logback.classic.Level;
import ch.qos.logback.classic.Logger;
import ch.qos.logback.classic.LoggerContext;
import ch.qos.logback.classic.encoder.PatternLayoutEncoder;
import ch.qos.logback.classic.spi.ILoggingEvent;
import ch.qos.logback.core.ConsoleAppender;

public class LoggerConfig {

	private LoggerConfig() {
		// private default constructor
	}

	public static Logger configureLogger(Level l, Class<?> c) {
		LoggerContext loggerCtx = (LoggerContext) LoggerFactory.getILoggerFactory();
		ConsoleAppender<ILoggingEvent> consoleAppender = new ConsoleAppender<>();
		consoleAppender.setContext(loggerCtx);
		consoleAppender.setName("CONSOLE");
		PatternLayoutEncoder encoder = new PatternLayoutEncoder();
		encoder.setContext(loggerCtx);
		encoder.setPattern("%d{HH:mm:ss.SSS} [%thread] %-5level %logger{36} - %msg%n");
		encoder.start();
		consoleAppender.setEncoder(encoder);
		consoleAppender.start();
		Logger rootLogger = loggerCtx.getLogger(org.slf4j.Logger.ROOT_LOGGER_NAME);
		rootLogger.addAppender(consoleAppender);
		rootLogger.setLevel(l);

		return loggerCtx.getLogger(c);
	}
}
