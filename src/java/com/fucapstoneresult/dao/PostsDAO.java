/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fucapstoneresult.dao;

import com.fucapstoneresult.models.PostsDTO;
import com.fucapstoneresult.models.UserPostDTO;
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
import javax.el.ELException;

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
                String sql = " SELECT PostID, PostTitle, PostDate, PostAuthor, PostContent, PostImage, LastEditedUser, Upvote, PostStatusID, IsMainPost, ProjectID "
                        + " FROM Posts "
                        + " WHERE IsMainPost IS NULL ";
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
                    String isMainPost = rs.getString("IsMainPost");
                    String projectID = rs.getString("ProjectID");

                    listPost.add(new PostsDTO(PostID, PostTitle, PostDate, PostAuthor, PostContent, PostImage, LastEditedUser, Upvote, PostStatusID, isMainPost, projectID));
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

    public List<PostsDTO> getAllMainPost() throws SQLException {
        List<PostsDTO> listPost = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            conn = com.fucapstoneresult.utils.DBUtils.getConnection();
            if (conn != null) {
                String sql = " SELECT PostID, PostTitle, PostDate, PostAuthor, PostContent, PostImage, LastEditedUser, Upvote, PostStatusID, IsMainPost, ProjectID "
                        + " FROM Posts "
                        + " WHERE IsMainPost is not null ";
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
                    String isMainPost = rs.getString("IsMainPost");
                    String projectID = rs.getString("ProjectID");
                    if (PostStatusID == 1) {
                        listPost.add(new PostsDTO(PostID, PostTitle, PostDate, PostAuthor, PostContent, PostImage, LastEditedUser, Upvote, PostStatusID, isMainPost, projectID));
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
                String sql = " SELECT PostTitle, PostDate, PostAuthor, PostContent, PostImage, LastEditedUser, Upvote, PostStatusID, IsMainPost, ProjectID "
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
                    String isMainPost = rs.getString("IsMainPost");
                    String projectID = rs.getString("ProjectID");

                    post = new PostsDTO(PostID, PostTitle, PostDate, PostAuthor, PostContent, PostImage, LastEditedUser, Upvote, PostStatusID, isMainPost, projectID);
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
                String sql = " SELECT PostID, PostTitle, PostDate, PostAuthor, PostContent, PostImage, LastEditedUser, Upvote, PostStatusID, IsMainPost"
                        + " FROM Posts "
                        + " WHERE ProjectID=? AND IsMainPost IS NOT NULL";
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
                    String isMainPost = rs.getString("IsMainPost");
                    String projectID = id;

                    post = new PostsDTO(PostID, PostTitle, PostDate, PostAuthor, PostContent, PostImage, LastEditedUser, Upvote, PostStatusID, isMainPost, projectID);
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
                String sql = " SELECT PostID, PostTitle, PostDate, PostAuthor, PostContent, PostImage, LastEditedUser, Upvote, PostStatusID, IsMainPost, ProjectID "
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
                    String isMainPost = rs.getString("IsMainPost");
                    String projectID = rs.getString("ProjectID");

                    listPost.add(new PostsDTO(PostID, PostTitle, PostDate, PostAuthor, PostContent, PostImage, LastEditedUser, Upvote, PostStatusID, isMainPost, projectID));
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

    public List<PostsDTO> getListTop3Post(String id) throws SQLException {
        List<PostsDTO> listPost = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            conn = com.fucapstoneresult.utils.DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT TOP 3 * FROM Posts "
                        + "WHERE PostID != ? OR ProjectID != ? "
                        + "ORDER BY NEWID()    ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, id);
                stm.setString(2, id);
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
                    String isMainPost = rs.getString("isMainPost");
                    String projectID = rs.getString("ProjectID");

                    listPost.add(new PostsDTO(PostID, PostTitle, PostDate, PostAuthor, PostContent, PostImage, LastEditedUser, Upvote, PostStatusID, isMainPost, projectID));
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

    public List<PostsDTO> getListPostByUpvote() throws SQLException {
        List<PostsDTO> listPost = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            conn = com.fucapstoneresult.utils.DBUtils.getConnection();
            if (conn != null) {
                String sql = " SELECT * "
                        + "FROM (SELECT TOP 9 * "
                        + "FROM Posts "
                        + "WHERE IsMainPost IS NULL "
                        + "ORDER BY PostDate DESC) p "
                        + "ORDER BY p.Upvote DESC ";
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
//                    String ProjectID = rs.getString("ProjectID");
                    String isMainPost = rs.getString("IsMainPost");
                    String projectID = rs.getString("ProjectID");

                    listPost.add(new PostsDTO(PostID, PostTitle, PostDate, PostAuthor, PostContent, PostImage, LastEditedUser, Upvote, PostStatusID, isMainPost, projectID));
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
            conn = DBUtils.getConnection();

            if (conn != null) {
                String sql = " UPDATE Posts SET PostTitle=?, PostAuthor=?, PostContent=?, PostImage=?, LastEditedUser=?, ProjectID=?, PostStatusID=? "
                        + " WHERE PostID=? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, post.getPostTitle());
                stm.setString(2, post.getPostAuthor());
                stm.setString(3, post.getPostContent());
                stm.setString(4, post.getPostImage());
                stm.setString(5, post.getLastEditedUser());
                stm.setString(6, post.getProjectID());
                stm.setInt(7, 2);
//                stm.setString(6, post.getProjectID());
                stm.setString(8, post.getPostID());

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

    public boolean insert(PostsDTO post) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " INSERT INTO Posts(PostID, PostTitle, PostDate, PostAuthor, PostContent, PostImage, LastEditedUser, Upvote, PostStatusID, IsMainPost, ProjectID) "
                        + " VALUES (?,?,?,?,?,?,?,?,?,?,?) ";
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
                stm.setString(10, post.getIsMainPost());
                stm.setString(11, post.getProjectID());
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

    public List<PostsDTO> getPostsByTagID(String id) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<PostsDTO> list = new ArrayList<>();

        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "SELECT Posts.PostID, Posts.PostTitle, Posts.PostDate, Posts.PostAuthor, Posts.PostContent, Posts.PostImage, Posts.LastEditedUser, IsMainPost, ProjectID "
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
                    String isMainPost = rs.getString("IsMainPost");
                    String projectID = rs.getString("ProjectID");

                    if (PostStatusID == 1) {
                        list.add(new PostsDTO(PostID, PostTitle, PostDate, PostAuthor, PostContent, PostImage, LastEditedUser, Upvote, PostStatusID, isMainPost, projectID));
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
                        + "Upvote, PostStatusId, IsMainPost, ProjectID "
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
                        String isMainPost = rs.getString("IsMainPost");
                        String projectID = rs.getString("ProjectID");
                        if (PostStatusID == 1) {
                            list.add(new PostsDTO(PostID, PostTitle, PostDate, PostAuthor, PostContent, PostImage, LastEditedUser, Upvote, PostStatusID, isMainPost, projectID));
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

    public int getUpVoteByProjectId(String id) throws SQLException {
        PostsDTO post = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        int upVote = 0;
        try {
            conn = com.fucapstoneresult.utils.DBUtils.getConnection();

            if (conn != null) {
                String sql = " SELECT Upvote "
                        + " FROM Posts "
                        + " WHERE ProjectID=? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, id);

                rs = stm.executeQuery();
                if (rs.next()) {
                    upVote = Integer.parseInt(rs.getString("Upvote"));
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

        return upVote;
    }

    public boolean updateUpVoteByProjectId(String id, int votes) throws SQLException {
        PostsDTO post = null;
        Connection conn = null;
        PreparedStatement stm = null;
        int rs = 0;
        boolean success = false;
        try {
            conn = com.fucapstoneresult.utils.DBUtils.getConnection();

            if (conn != null) {
                String sql = "UPDATE Posts "
                        + " SET Upvote = ? "
                        + " WHERE ProjectID = ? ";

                stm = conn.prepareStatement(sql);
                stm.setInt(1, votes);
                stm.setString(2, id);
                rs = stm.executeUpdate();
                if (rs > 0) {
                    success = true;
                }
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

        return success;
    }

    public static void main(String[] args) throws SQLException {

        PostsDAO dao = new PostsDAO();
        List<PostsDTO> l = dao.getListTop3Post("1");
        for (PostsDTO l1 : l) {
            System.out.println(l1);

            ProjectDAO projectDao = new ProjectDAO();
            PostsDAO dPost = new PostsDAO();
            List<String> listProjectID;
            listProjectID = projectDao.getAllProjectIDBySemester("1");
            for (String string : listProjectID) {
                System.out.println(string);
            }
            List<PostsDTO> listPost = dPost.getPostsByProjectID(listProjectID);
            for (PostsDTO postsDTO : listPost) {
                System.out.println(postsDTO);

            }
            System.out.println(dao.getUpVoteByProjectId("1"));

        }

    }

    public static List<PostsDTO> getTop5Post() throws ClassNotFoundException, SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        List<PostsDTO> postList = new ArrayList<>();
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();

            if (conn != null) {
                String sql = " SELECT TOP 5 * FROM Posts "
                        + " WHERE IsMainPost IS NOT NULL "
                        + " ORDER BY -Upvote";

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
//                    String ProjectID = rs.getString("ProjectID");
                    String isMainPost = rs.getString("isMainPost");
                    String projectID = rs.getString("ProjectID");

                    postList.add(new PostsDTO(PostID, PostTitle, PostDate, PostAuthor, PostContent, PostImage, LastEditedUser, Upvote, PostStatusID, isMainPost, projectID));
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
        return postList;
    }

    public boolean approvePost(String id) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " UPDATE Posts"
                        + " SET PostStatusID = ?"
                        + " WHERE PostID = ?";

                stm = conn.prepareStatement(sql);
                stm.setInt(1, 1);
                stm.setString(2, id);

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

    public boolean rejectPost(String id) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " UPDATE Posts"
                        + " SET PostStatusID = ?"
                        + " WHERE PostID = ?";

                stm = conn.prepareStatement(sql);
                stm.setInt(1, 3);
                stm.setString(2, id);

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

    public List<PostsDTO> getAllPoPost() throws SQLException {
        List<PostsDTO> listPost = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            conn = com.fucapstoneresult.utils.DBUtils.getConnection();
            if (conn != null) {
                String sql = " SELECT PostID, PostTitle, PostDate, PostAuthor, PostContent, PostImage, LastEditedUser, Upvote, PostStatusID, IsMainPost, ProjectID "
                        + " FROM Posts "
                        + " WHERE IsMainPost IS NOT NULL ";
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
                    String isMainPost = rs.getString("IsMainPost");
                    String projectID = rs.getString("ProjectID");

                    listPost.add(new PostsDTO(PostID, PostTitle, PostDate, PostAuthor, PostContent, PostImage, LastEditedUser, Upvote, PostStatusID, isMainPost, projectID));
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

    public PostsDTO getMainPostWithProjectId(String id) throws SQLException {
        PostsDTO post = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            conn = com.fucapstoneresult.utils.DBUtils.getConnection();

            if (conn != null) {
                String sql = " SELECT PostID, PostTitle, PostDate, PostAuthor, PostContent, PostImage, LastEditedUser, Upvote, PostStatusID, IsMainPost"
                        + " FROM Posts "
                        + " WHERE ProjectID= ? AND IsMainPost IS NULL";
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
                    String isMainPost = rs.getString("IsMainPost");
                    String projectID = id;

                    post = new PostsDTO(PostID, PostTitle, PostDate, PostAuthor, PostContent, PostImage, LastEditedUser, Upvote, PostStatusID, isMainPost, projectID);
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

    public List<UserPostDTO> searchPostByName(String name) throws SQLException {
        List<UserPostDTO> postList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " Select Users.UserID, Users.Email, Users.UserName, Posts.PostID, Posts.PostTitle, Posts.PostStatusID, Posts.PostDate "
                        + " from Posts "
                        + " join Users "
                        + " on Posts.LastEditedUser = Users.UserID and PostTitle LIKE ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, "%" + name + "%");
                rs = stm.executeQuery();
                while (rs.next()) {
                    String userID = rs.getString("UserID");
                    String email = rs.getString("Email");
                    String userName = rs.getString("UserName");
                    String postID = rs.getString("PostID");
                    String postTitle = rs.getString("PostTitle");
                    String postStatusID = rs.getString("PostStatusID");
                    String postDate = rs.getString("PostDate");

                    postList.add(new UserPostDTO(userID, postID, userName, postTitle, postDate, postStatusID, email));
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
        return postList;
    }

    public List<UserPostDTO> filterPostByStatus(int status) throws SQLException {
        List<UserPostDTO> postList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " Select Users.UserID, Users.Email, Users.UserName, Posts.PostID, Posts.PostTitle, Posts.PostStatusID, Posts.PostDate "
                        + " from Posts "
                        + " join Users "
                        + " on Posts.LastEditedUser = Users.UserID and Posts.PostStatusID = ? ";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, status);
                rs = stm.executeQuery();

                while (rs.next()) {
                    String userID = rs.getString("UserID");
                    String email = rs.getString("Email");
                    String userName = rs.getString("UserName");
                    String postID = rs.getString("PostID");
                    String postTitle = rs.getString("PostTitle");
                    String postStatusID = rs.getString("PostStatusID");
                    String postDate = rs.getString("PostDate");

                    postList.add(new UserPostDTO(userID, postID, userName, postTitle, postDate, postStatusID, email));
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
        return postList;
    }

    public List<UserPostDTO> getAllPoPostWithUserInfo() throws SQLException {
        List<UserPostDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            conn = DBUtils.getConnection();
            
            if (conn != null){
                String sql = " Select Users.UserID, Users.Email, Posts.PostAuthor, Posts.PostID, Posts.PostTitle, Posts.PostStatusID, Posts.PostDate, Posts.isMainPost "
                        + " from Posts "
                        + " join Users "
                        + "  on Posts.LastEditedUser = Users.UserID "
                        + " Where IsMainPost IS NOT NULL";
                stm  = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()){
                    String userID = rs.getString("UserID");
                    String email = rs.getString("Email");
                    String userName = rs.getString("PostAuthor");
                    String postID = rs.getString("PostID");
                    String postTitle = rs.getString("PostTitle");
                    String postStatusID = rs.getString("PostStatusID");
                    String postDate = rs.getString("PostDate");
                    
                    list.add(new UserPostDTO(userID, postID, userName, postTitle, postDate, postStatusID, email));
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
        return list;
    }
    public boolean deletePoPost(String id) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " DELETE FROM Posts WHERE PostID = ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, id);

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
    
        public static List<PostsDTO> getTop3RequestPost() throws ClassNotFoundException, SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        List<PostsDTO> postList = new ArrayList<>();
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();

            if (conn != null) {
                String sql = " SELECT TOP 3 * FROM Posts "
                        + " WHERE IsMainPost IS NOT NULL AND PostStatusID = ?";

                stm = conn.prepareStatement(sql);
                stm.setInt(1, 2);
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
                    String isMainPost = rs.getString("isMainPost");
                    String projectID = rs.getString("ProjectID");

                    postList.add(new PostsDTO(PostID, PostTitle, PostDate, PostAuthor, PostContent, PostImage, LastEditedUser, Upvote, PostStatusID, isMainPost, projectID));
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
        return postList;
    }
}
