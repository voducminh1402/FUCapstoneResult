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
<<<<<<< HEAD
        Connection con = DriverManager.getConnection(url, "sa", "lehonganh01112001");    
=======
        Connection con = DriverManager.getConnection(url, "sa", "Minh1402");    
<<<<<<< HEAD

=======
>>>>>>> a474119481a76dc4d96dfc030c9c8996b4101a0c
>>>>>>> e03cf53df9494c39272c186a0ff6d98295ae9fbe
>>>>>>> 61665b96ae93c47e1c0853e9156750832bc323c5
        return con;
    }
}
