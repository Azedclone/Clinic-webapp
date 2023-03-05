package helper;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBContext {
    protected Connection connection;

    public DBContext() {
        try {
            String URL = "jdbc:mysql://localhost:3306/swp";
            String USERNAME = "root";
            String PASSWORD = "Long1562002!";
            
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            System.out.println("Error MySQL");
        }
    }
    
}
