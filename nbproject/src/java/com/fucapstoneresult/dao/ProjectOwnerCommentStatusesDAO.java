///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
//package com.fucapstoneresult.dao;
//
//import com.fucapstoneresult.models.ProjectOwnerCommentStatusesDTO;
//import com.fucapstoneresult.utils.DBUtils;
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.SQLException;
//
///**
// *
// * @author Asus
// */
//public class ProjectOwnerCommentStatusesDAO {
//    public boolean insertCommentStatus(ProjectOwnerCommentStatusesDTO commentStatusId) throws SQLException, ClassNotFoundException {
//        boolean check = false;
//        Connection conn = null;
//        PreparedStatement stm = null;
//        try {
//            conn = DBUtils.getConnection();
//            if (conn != null) {
//                String sql = "INSERT INTO ProjectOwnerPostCommentStatuses(CommentStatusName)"
//                        + " WHERE CommentStatusID = ?"
//                        + " VALUES(?)";
//                stm = conn.prepareStatement(sql);
//                stm.setString(1,commentStatusId.getCommentStatusID());
//                stm.setString(2,commentStatusId.getCommentStatusName());                                                 
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
//}
