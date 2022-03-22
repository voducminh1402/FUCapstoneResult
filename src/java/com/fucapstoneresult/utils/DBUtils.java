/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fucapstoneresult.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author VODUCMINH
 */
public class DBUtils {
    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        String url = "jdbc:sqlserver://"
                + "localhost:1433;"
                + "databaseName=FUCapstoneResult";

<<<<<<< HEAD
<<<<<<< HEAD
        Connection con = DriverManager.getConnection(url, "sa", "1234567890");    
=======
        Connection con = DriverManager.getConnection(url, "sa", "123");    
>>>>>>> bdc7a98b929b12678065a6f6c643298e184a28c5
=======
        Connection con = DriverManager.getConnection(url, "sa", "1234567890");    

>>>>>>> f205676ad8d89ffe03de5885e6b2a4a7a6490374

        return con;
    }
}
