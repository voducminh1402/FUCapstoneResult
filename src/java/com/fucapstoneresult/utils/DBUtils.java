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
        Connection con = DriverManager.getConnection(url, "sa", "lehonganh01112001");    
=======
        Connection con = DriverManager.getConnection(url, "sa", "123");
>>>>>>> 5cb0ee48704dca758c84f12976a4f527eec020cb
        return con;
    }
}
