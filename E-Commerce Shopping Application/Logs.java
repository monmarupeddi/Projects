package FinalProject;

import java.io.IOException;
//import java.util.Logger;
import java.util.logging.FileHandler;
import java.util.logging.*;

//to create logs of important events
public class Logs {
	private static final Logger logger = Logger.getLogger("mylogger");

	static {
        try {
        	FileHandler fileHandler = new FileHandler("application.log");
            fileHandler.setFormatter(new SimpleFormatter());
            logger.addHandler(fileHandler);
            logger.setLevel(Level.INFO);
            logger.setUseParentHandlers(false);
        } catch (IOException e) {
            logger.log(Level.SEVERE, "Error configuring logger", e);
        }
    }
//
    public static Logger getLogger() {
        return logger;
    }
}

