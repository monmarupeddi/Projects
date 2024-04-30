package FinalProject;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

public class LogFilePrinter {
    public static void main(String[] args) {
        
        String logFilePath = "application.log";

        try (BufferedReader reader = new BufferedReader(new FileReader(logFilePath))) {
            String line;
            
            while ((line = reader.readLine()) != null) {
                System.out.println(line);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}