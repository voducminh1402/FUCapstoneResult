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
        Connection con = DriverManager.getConnection(url, "sa", "Minh1402");    
=======
        Connection con = DriverManager.getConnection(url, "sa", "123");
>>>>>>> 457ac5a4522ddcf47f1073e4c6e26450a2c8e7ef
        return con;
    }
}
