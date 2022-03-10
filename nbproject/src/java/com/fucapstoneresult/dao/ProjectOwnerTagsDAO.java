///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
//package com.fucapstoneresult.dao;
//
//import com.fucapstoneresult.models.ProjectOwnerTagsDTO;
//import com.fucapstoneresult.utils.DBUtils;
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.SQLException;
//
///**
// *
// * @author Asus
// */
//public class ProjectOwnerTagsDAO {
//    public boolean insertProjectOwnerTags(ProjectOwnerTagsDTO ownerTags) throws SQLException, ClassNotFoundException {
//        boolean check = false;
//        Connection conn = null;
//        PreparedStatement stm = null;
//        try {
//            conn = DBUtils.getConnection();
//            if (conn != null) {
//                String sql = "INSERT INTO ProjectOwnerTags(POPostID, TagDetailID)"
//                        + " VALUES(?,?)";
//                stm = conn.prepareStatement(sql);
//                stm.setString(1, ownerTags.getPoPostID());
//                stm.setString(2, ownerTags.getTagDetailID());                                  
//                check = stm.executeUpdate() > 0 ? true : false;
//            }
//        } finally {
//            if (stm != null) {
//                stm.close();
//            }
//            if (conn != null) {
//                conn.close();
//            }
//        }
//        return check;
//    }
//    public boolean deleteProjectOwnerTags(String poPostId) throws SQLException {
//        boolean check = false;
//        Connection conn = null;
//        PreparedStatement stm = null;
//        try {
//            conn = DBUtils.getConnection();
//            if (conn != null) {
//                String sql = " DELETE FROM ProjectOwnerTags "                     
//                        + " WHERE POPostID=?";
//                stm = conn.prepareStatement(sql);
//                stm.setString(1, poPostId);
//                check = stm.executeUpdate() > 0 ? true : false;
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        } finally {
//            if (stm != null) {
//                stm.close();
//            }
//            if (conn != null) {
//                conn.close();
//            }
//        }
//        return check;
//    }
//    public boolean updateProjectownerTags(ProjectOwnerTagsDTO ownerTags) throws SQLException {
//        boolean check = false;
//        Connection conn = null;
//        PreparedStatement stm = null;
//        try {
//
//            conn = DBUtils.getConnection();
//            if (conn != null) {
//                String sql = " UPDATE ProjetOwnerTags SET POPostID=?, TagDetailID=? ";
//                stm = conn.prepareStatement(sql);
//                stm.setString(1, ownerTags.getPoPostID());
//                stm.setString(2, ownerTags.getTagDetailID());              
//                check = stm.executeUpdate() > 0 ? true : false;
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        } finally {
//            if (stm != null) {
//                stm.close();
//            }
//            if (conn != null) {
//                conn.close();
//            }
//        }
//        return check;
//    } 
//}
