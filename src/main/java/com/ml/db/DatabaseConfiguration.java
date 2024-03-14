package com.ml.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLIntegrityConstraintViolationException;

import org.slf4j.Logger;
import ch.qos.logback.classic.Level;

public class DatabaseConfiguration {

	private static Logger logger;
	private static Connection con;

	private DatabaseConfiguration() {
		// private database configuration.
	}

	static {
		logger = DatabaseUtilities.configureLogger(DatabaseConfiguration.class, Level.TRACE);
		logger.info("Database configuration : static block ...");
		try {
			logger.info("Database configuration : loading Driver.class ...");
			Class.forName("com.mysql.cj.jdbc.Driver");
			if (con == null) {
				logger.info("Database configuration : assigning connection instance ...");
				con = DriverManager.getConnection("jdbc:mysql://localhost:3305/hmsDB", "root", "68921794");
			}
		} catch (SQLIntegrityConstraintViolationException icvException) {
			logger.error("Refer to your database schema for more insights : ");
			DatabaseUtilities.getDetailedStackTrace(icvException);
		} catch (Exception e) {
			logger.error("Database connection could not be established : ");
			DatabaseUtilities.getDetailedStackTrace(e);
		}
	}

	public static Connection getMySQLConnection() {

		return con;
	}

}