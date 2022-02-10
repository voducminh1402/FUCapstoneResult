/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fucapstoneresult.dao;

import com.fucapstoneresult.models.PostsDTO;
import com.fucapstoneresult.utils.DBUtils;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author PhongVu
 */
public class PostsDAO {

    public List<PostsDTO> getAllPost() throws SQLException {
        List<PostsDTO> listPost = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            conn = com.fucapstoneresult.utils.DBUtils.getConnection();
            if (conn != null) {
                String sql = " SELECT PostID, PostTitle, PostDate, PostAuthor, PostContent, PostImage, LastEditedUser, Upvote, PostStatusID "
                        + " FROM Posts ";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String PostID = rs.getString("PostID");
                    String PostTitle = rs.getString("PostTitle");
                    String PostDate = rs.getString("PostDate");
                    String PostAuthor = rs.getString("PostAuthor");
                    String PostContent = rs.getString("PostContent");
                    String PostImage = rs.getString("PostImage");
                    String LastEditedUser = rs.getString("LastEditedUser");
                    int Upvote = Integer.parseInt(rs.getString("Upvote"));
                    int PostStatusID = Integer.parseInt(rs.getString("PostStatusID"));

                    listPost.add(new PostsDTO(PostID, PostTitle, PostDate, PostAuthor, PostContent, PostImage, LastEditedUser, Upvote, PostStatusID));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

        return listPost;
    }

    public PostsDTO getPostWithID(String ID) throws SQLException {
        PostsDTO post = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            conn = com.fucapstoneresult.utils.DBUtils.getConnection();
            if (conn != null) {
                String sql = " SELECT PostTitle, PostDate, PostAuthor, PostContent, PostImage, LastEditedUser, Upvote, PostStatusID "
                        + " FROM Posts "
                        + " WHERE PostID=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, ID);
                rs = stm.executeQuery();
                if (rs.next()) {
                    String PostID = ID;
                    String PostTitle = rs.getString("PostTitle");
                    String PostDate = rs.getString("PostDate");
                    String PostAuthor = rs.getString("PostAuthor");
                    String PostContent = rs.getString("PostContent");
                    String PostImage = rs.getString("PostImage");
                    String LastEditedUser = rs.getString("LastEditedUser");
                    int Upvote = Integer.parseInt(rs.getString("Upvote"));
                    int PostStatusID = Integer.parseInt(rs.getString("PostStatusID"));

                    post = new PostsDTO(PostID, PostTitle, PostDate, PostAuthor, PostContent, PostImage, LastEditedUser, Upvote, PostStatusID);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

        return post;
    }

    public PostsDTO getPostWithProjectId(String id) throws SQLException {
        PostsDTO post = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            conn = com.fucapstoneresult.utils.DBUtils.getConnection();

            if (conn != null) {
                String sql = " SELECT TOP 1 PostID, PostTitle, PostDate, PostAuthor, PostContent, PostImage, LastEditedUser, Upvote, PostStatusID "
                        + " FROM Posts "
                        + " WHERE PostID=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, id);

                rs = stm.executeQuery();
                if (rs.next()) {
                    String PostID = rs.getString("PostID");
                    String PostTitle = rs.getString("PostTitle");
                    String PostDate = convertDatetime(rs.getString("PostDate"));
                    String PostAuthor = rs.getString("PostAuthor");
                    String PostContent = rs.getString("PostContent");
                    String PostImage = rs.getString("PostImage");
                    String LastEditedUser = rs.getString("LastEditedUser");
                    int Upvote = Integer.parseInt(rs.getString("Upvote"));
                    int PostStatusID = Integer.parseInt(rs.getString("PostStatusID"));

                    post = new PostsDTO(PostID, PostTitle, PostDate, PostAuthor, PostContent, PostImage, LastEditedUser, Upvote, PostStatusID);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

        return post;
    }

    public List<PostsDTO> getListPost(String search) throws SQLException {
        List<PostsDTO> listPost = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            conn = com.fucapstoneresult.utils.DBUtils.getConnection();
            if (conn != null) {
                String sql = " SELECT PostID, PostTitle, PostDate, PostAuthor, PostContent, PostImage, LastEditedUser, Upvote, PostStatusID "
                        + " FROM Posts "
                        + " WHERE PostTitle like ? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, "%" + search + "%");
                rs = stm.executeQuery();
                while (rs.next()) {
                    String PostID = rs.getString("PostID");
                    String PostTitle = rs.getString("PostTitle");
                    String PostDate = rs.getString("PostDate");
                    String PostAuthor = rs.getString("PostAuthor");
                    String PostContent = rs.getString("PostContent");
                    String PostImage = rs.getString("PostImage");
                    String LastEditedUser = rs.getString("LastEditedUser");
                    int Upvote = Integer.parseInt(rs.getString("Upvote"));
                    int PostStatusID = Integer.parseInt(rs.getString("PostStatusID"));
//                    String ProjectID = rs.getString("ProjectID");

                    listPost.add(new PostsDTO(PostID, PostTitle, PostDate, PostAuthor, PostContent, PostImage, LastEditedUser, Upvote, PostStatusID));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

        return listPost;
    }

    public boolean update(PostsDTO post) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = com.fucapstoneresult.utils.DBUtils.getConnection();
            if (conn != null) {
                String sql = " UPDATE Posts SET PostTitle=?, PostAuthor=?, PostContent=?, PostImage=?, LastEditedUser=? "
                        + " WHERE PostID=? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, post.getPostTitle());
                stm.setString(2, post.getPostAuthor());
                stm.setString(3, post.getPostContent());
                stm.setString(4, post.getPostImage());
                stm.setString(5, post.getLastEditedUser());
//                stm.setString(6, post.getProjectID());
                stm.setString(7, post.getPostID());

                check = stm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean insert(PostsDTO post) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " INSERT INTO Posts(PostID, PostTitle, PostDate, PostAuthor, PostContent, PostImage, LastEditedUser, Upvote, PostStatusID) "
                        + " VALUES(?,?,?,?,?,?,?,?,?) ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, post.getPostID());
                stm.setString(2, post.getPostTitle());
                stm.setString(3, post.getPostDate());
                stm.setString(4, post.getPostAuthor());
                stm.setString(5, post.getPostContent());
                stm.setString(6, post.getPostImage());
                stm.setString(7, post.getLastEditedUser());
                stm.setInt(8, post.getUpvote());
                stm.setInt(9, post.getPostStatusID());
//                stm.setString(10, post.getProjectID());
                check = stm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

        return check;
    }

    public boolean delete(String PostID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " UPDATE Posts "
                        + " SET PostStatusID=?"
                        + " WHERE PostID=?";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, 3);
                stm.setString(2, PostID);

                check = stm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

        return check;
    }
    
    public static String convertDatetime(String date) {
//        Timestamp originalTime = Timestamp.valueOf(date);
        Date convertDate = Date.valueOf(date);
        DateFormat df = new SimpleDateFormat("dd/MM/YYYY");
        return df.format(convertDate);
    }
    
    public static void main(String[] args) {
        PostsDAO dao = new PostsDAO();
        System.out.println(dao.convertDatetime("2022-02-09"));
    }

    public List<PostsDTO> getPostsByTagID(String id) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<PostsDTO> list = new ArrayList<>();

        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "SELECT Posts.PostID, Posts.PostTitle, Posts.PostDate, Posts.PostAuthor, Posts.PostContent, Posts.PostImage, Posts.LastEditedUser, "
                        + "Posts.Upvote, Posts.PostStatusId, Posts.ProjectID "
                        + " FROM Tags "
                        + " JOIN Posts ON Posts.PostID = Tags.PostID "
                        + " WHERE TagDetailID = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, id);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String PostID = rs.getString("PostID");
                    String PostTitle = rs.getString("PostTitle");
                    String PostDate = rs.getString("PostDate");
                    String PostAuthor = rs.getString("PostAuthor");
                    String PostContent = rs.getString("PostContent");
                    String PostImage = rs.getString("PostImage");
                    String LastEditedUser = rs.getString("LastEditedUser");
                    int Upvote = Integer.parseInt(rs.getString("Upvote"));
                    int PostStatusID = Integer.parseInt(rs.getString("PostStatusID"));
                    String ProjectID = rs.getString("ProjectID");

                    if (PostStatusID == 1) {
                        list.add(new PostsDTO(PostID, PostTitle, PostDate, PostAuthor, PostContent, PostImage, LastEditedUser, Upvote, PostStatusID));
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return list;
    }

    public List<PostsDTO> getPostsByProjectID(List<String> listID) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<PostsDTO> list = new ArrayList<>();

        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "SELECT PostID, PostTitle, PostDate, PostAuthor, PostContent, PostImage, LastEditedUser, "
                        + "Upvote, PostStatusId "
                        + " FROM Posts "
                        + " WHERE PostID = ?";
                for (String id : listID) {
                    stm = con.prepareStatement(sql);
                    stm.setString(1, id);
                    rs = stm.executeQuery();
                    if (rs.next()) {
                        String PostID = rs.getString("PostID");
                        String PostTitle = rs.getString("PostTitle");
                        String PostDate = rs.getString("PostDate");
                        String PostAuthor = rs.getString("PostAuthor");
                        String PostContent = rs.getString("PostContent");
                        String PostImage = rs.getString("PostImage");
                        String LastEditedUser = rs.getString("LastEditedUser");
                        int Upvote = Integer.parseInt(rs.getString("Upvote"));
                        int PostStatusID = Integer.parseInt(rs.getString("PostStatusID"));
                        if (PostStatusID == 1) {
                            list.add(new PostsDTO(PostID, PostTitle, PostDate, PostAuthor, PostContent, PostImage, LastEditedUser, Upvote, PostStatusID));
                        }

                    }
                }

            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return list;
    }

//    public static void main(String[] args) throws SQLException {
//        PostsDAO dao = new PostsDAO();
//        List<String> l = new ArrayList<>();
//        l.add("1");
//        l.add("2");
//        l.add("3");
//        l.add("87a71150-51fb-496a-8735-d371aed91284");
//        List<PostsDTO> list = dao.getPostsByProjectID(l);
//        for (PostsDTO postsDTO : list) {
//            System.out.println(postsDTO);
//        }
//    }
}
