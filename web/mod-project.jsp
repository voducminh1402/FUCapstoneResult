<%@page import="com.fucapstoneresult.dao.InstructorDAO"%>
<%@page import="com.fucapstoneresult.dao.ProjectDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.fucapstoneresult.models.ProjectDTO"%>
<%@page import="com.fucapstoneresult.dao.TeamDAO"%>
<%@page import="com.fucapstoneresult.models.TeamDTO"%>
<%@page import="com.fucapstoneresult.models.InstructorDTO"%>
<%@page import="com.fucapstoneresult.models.ProjectInstructorDTO"%>
<%@page import="com.fucapstoneresult.dao.ProjectInstructorDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>FPT Capstone Project Result</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" integrity="sha512-Fo3rlrZj/k7ujTnHg4CGR2D7kSs0v4LLanw2qksYuRlEzO+tcaEPQogQ0KaoGN26/zrn20ImR1DfuLWnOo7aBA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.18/css/bootstrap-select.min.css" integrity="sha512-ARJR74swou2y0Q2V9k0GbzQ/5vJ2RBSoCWokg4zkfM29Fb3vZEQyv0iWBMW/yvKgyHSR/7D64pFMmU8nYmbRkg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="./assets/css/mod-project.css">    
        <link rel="stylesheet" href="./assets/css/styles.css">
        <link rel="stylesheet" href="./assets/css/responsive.css">
    </head>
    <body>
        <div class="wrapper">
            <!-- Sidebar  -->
            <nav id="sidebar">
                <div class="sidebar-header">
                    <h3>FPT University</h3>
                    <strong>FU</strong>
                </div>
                <ul class="list-unstyled components">
                    <li class="nav-item active">
                        <a class="nav-link" href="mod-index.jsp">
                            <i class="fas fa-fw fa-tachometer-alt"></i>
                            <span>Trang chủ</span></a>
                    </li>
                    <hr class="sidebar-divider">

                    <li class="dropdown">
                        <a href="admin.jsp" data-toggle="dropdown" aria-expanded="false" data-target="#homeSubmenu">
                            <i class="fas fa-home"></i> Quản Lí Người Dùng
                        </a>
                    </li>

                    <hr class="sidebar-divider">

                    <li>
                        <a href="mod-project.jsp" data-toggle="collapse" aria-expanded="false">
                            <i class="fas fa-briefcase"></i> Quản Lí Đồ Án
                        </a>
                    </li>
                    <li>
                        <a href="mod-team.jsp" data-toggle="collapse" aria-expanded="false">
                            <i class="fas fa-briefcase"></i> Quản Lí Nhóm Đồ Án
                        </a>
                    </li>
                    <li>
                        <a href="student.jsp" data-toggle="collapse" aria-expanded="false">
                            <i class="fas fa-briefcase"></i> Quản lí Sinh Viên
                        </a>
                    </li>
                    <li>
                        <a href="instructor.jsp" data-toggle="collapse" aria-expanded="false">
                            <i class="fas fa-briefcase"></i> Quản Lí Giảng Viên
                        </a>
                    </li>
                    <li>
                        <a href="mod-semester.jsp" data-toggle="collapse" aria-expanded="false">
                            <i class="fas fa-briefcase"></i> Quản Lí Học Kỳ
                        </a>
                    </li>

                    <hr class="sidebar-divider">

                    <li>
                        <a href="mod-post.jsp" data-toggle="collapse" aria-expanded="false">
                            <i class="fas fa-file"></i> Bài Đăng Chính
                        </a>
                        <a href="mod-request.jsp" data-toggle="collapse" aria-expanded="false">
                            <i class="fas fa-file"></i> Bài Viết Của Sinh Viên
                        </a>
                    </li>
<<<<<<< HEAD
                    
                    <hr class="sidebar-divider">              
                    
=======

                    <hr class="sidebar-divider">

                    <li>
                        <a href="MainController?action=Logout" data-toggle="collapse" aria-expanded="false">
                            <i class="fas fa-arrow-left"></i> Đăng xuất
                        </a>
                    </li>                

>>>>>>> 2290ea9d17c3d92440f826bd363c08e6cf1da558
                </ul>

            </nav>

            <!-- Page Content  -->
            <div id="content">
                <nav class="navbar navbar-expand-lg navbar-light bg-light">
                    <div class="container-fluid">
                        <div class="mod-header">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="left-side-menu">
                                        <button type="button" id="sidebarCollapse" class="btn btn-info">
                                            <i class="fas fa-align-left"></i>
                                        </button>
                                    </div>   
                                </div>
                                <div class="col-md-6">

                                    <div class="right-side-info">
                                        <!-- Dropdown - Alerts -->
                                        <div class="info-login">
                                            <img src="${sessionScope.USER.userImage}" alt="">
                                        </div>
                                        <div style="background: red; padding: 5px 10px 5px 10px; border-radius: 50px">
                                            <a href="MainController?action=Logout" data-toggle="collapse" aria-expanded="false" style="color: white; font-weight: 700">
                                                Đăng xuất
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </nav>
                <div class="content-detail">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-12">
                                <h2>Quản Lí Đồ Án</h2>
                                <div class="direct-link">
                                    <i class="fas fa-home"></i>
                                    <i class="fas fa-chevron-right"></i>
                                    <span>Quản Lí Đồ Án</span>
                                </div>
                            </div>
                        </div>
                        <div class="content-filter">
                            <div class="row">
                                <div class="col-md-8 col-sm-12">
                                </div>
                                <div class="col-md-4 col-sm-12">

                                    <div class="manage-project">
                                        <div class="menu-search menu-search-project">
                                            <button name="action" value="SearchProjectByName">
                                                <i class="fa fa-search" aria-hidden="true"></i>
                                            </button>
                                            <input class="mod-menu-input" type="text" placeholder="Thêm Đồ Án" name="name" readonly>
                                        </div>
                                        <a href="mod-add-project.jsp" class="link-add-project">
                                            <i class="fas fa-plus"></i>
                                        </a>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="content-table">
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>STT</th>
                                            <th>Tên Đồ Án</th>
                                            <th>Nhóm Thực Hiện</th>
                                            <th>Giảng Viên Hướng Dẫn</th>
                                            <th>Điểm</th>
                                            <th> </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            ProjectDAO prodao = new ProjectDAO();
                                            List<ProjectDTO> ListPro = new ArrayList<>();
                                            ListPro = prodao.getAllProject();
                                            request.setAttribute("LIST_PROJECT", ListPro);

                                            TeamDAO teamDAO = new TeamDAO();
                                            TeamDTO team = new TeamDTO();
                                            ProjectInstructorDTO proins = new ProjectInstructorDTO();
                                            ProjectInstructorDAO proinsdao = new ProjectInstructorDAO();
                                            InstructorDTO ins = new InstructorDTO();
                                            InstructorDAO insdao = new InstructorDAO();

                                            int count = 1;
                                            for (ProjectDTO pro : ListPro) {

                                                team = teamDAO.getTeam(pro.getProjectID());
                                                proins = proinsdao.getProjectInstructor(team.getTeamID());
                                                ins = insdao.getInstructorByID(proins.getInstructorID());

                                        %>
                                        <tr>
                                            <td><%= count++%></td>
                                            <td><%= pro.getProjectName()%></td>
                                            <td><%= team.getTeamName()%></td>
                                            <td><%= ins.getInstructorName()%></td>
                                            <td><%= pro.getProjectScore()%></td>
                                            <td class="last-type__menu">
                                                <i class="fas fa-ellipsis-h more-choice__dot"></i>
                                                <div class="more-choice__menu">
<!--                                                    <div class="more-choice__item">
                                                        <a href="MainController?action=DetailProject&id=<%= pro.getProjectID()%>">
                                                            <span>Xem Chi Tiết</span>
                                                            <i class="fa fa-eye" aria-hidden="true"></i>
                                                        </a>
                                                    </div>-->
                                                    <div class="more-choice__item">
                                                        <a href="MainController?action=GetListProject&id=<%= pro.getProjectID()%>&page=update-project">
                                                            <span>Chỉnh Sửa</span>
                                                            <i class="fa fa-pencil" aria-hidden="true"></i>
                                                        </a>
                                                    </div>
                                                    <div class="more-choice__item">


                                                        <form action="MainController" method="POST">
                                                            <button style="    border-radius: 0;
                                                                    border: none;
                                                                    background: white;
                                                                    float: left;" type="submit" name="action" value="RemoveProject">
                                                                <span>Xóa</span>
                                                            </button>
                                                            <input type="hidden" name="id" value="<%= pro.getProjectID()%>">
                                                            <i class="fa fa-trash" aria-hidden="true"></i>
                                                        </form>

                                                    </div>        
                                                </div>
                                            </td>
                                        </tr>
                                        <%
                                            }
                                        %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="content-project-pagination">
                            <div class="pagination">
                                <span><i class="fas fa-chevron-left"></i></span>
                                <span class="active-pagination">1</span>
                                <span>2</span>
                                <span>3</span>
                                <span>...</span>
                                <span>10</span>
                                <span><i class="fas fa-chevron-right"></i></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="add-project-menu">
            <h2>Thêm Đồ Án Tốt Nghiệp</h2>

            <form action="">
                <label for="">Tên Đồ Án</label><br>
                <input type="text">
                <label for="">Mô Tả Đồ Án</label><br>
                <textarea>
                </textarea>
                <label for="">Điểm Số Đồ Án</label><br>
                <input type="number" step="0.05" min="0" max="10">
                <label for="">Học Kì</label><br>
                <select name="" id="">
                    <option value="">Học Kì Spring 2021</option>
                    <option value="">Học Kì Spring 2021</option>
                    <option value="">Học Kì Spring 2021</option>
                    <option value="">Học Kì Spring 2021</option>
                    <option value="">Học Kì Spring 2021</option>
                    <option value="">Học Kì Spring 2021</option>
                    <option value="">Học Kì Spring 2021</option>
                </select>
                <label for="">Nhóm Thực Hiện Đồ Án</label><br>
                <select name="" id="">
                    <option value="">Nhóm 1</option>
                    <option value="">Nhóm 2</option>
                    <option value="">Nhóm 3</option>
                    <option value="">Nhóm 4</option>
                    <option value="">Nhóm 5</option>
                    <option value="">Nhóm 6</option>
                </select>
                <label for="">Giảng Viên Hướng Dẫn</label><br>
                <select name="" id="">
                    <option value="">Th.S Nguyễn Thế Hoàng</option>
                    <option value="">Th.S Đoàn Nguyễn Thành Hòa</option>
                    <option value="">Th.S Nguyễn Trọng Tài</option>
                    <option value="">Th.S Thân Văn Sử</option>
                    <option value="">Th.S Thân Thị Ngọc Vân</option>
                </select>
                <label for="">Ảnh Bìa Đồ Án</label>
                <div class="project-add-upload__image">
                    <label style="margin: 0;" for="file"><i class="fas fa-cloud-upload-alt"></i>Tải Ảnh Lên</label>
                    <input type="file" name="file" id="file" placeholder="Tải Ảnh Lên">
                </div>

                <div class="add-project-submit">
                    <button type="submit">Lưu Lại</button>
                    <button class="cancel-add-btn" type="button">Hủy Bỏ</button>
                </div>
            </form>
        </div>

        <div class="overlay-page-mod" id="overlay-page overlay-page-mod"></div>

        <script src="https://cdn.tiny.cloud/1/m862mtwmvofelufcxf6kpr7rr30u4mh13bb09ks2g0xg8gdf/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>    
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.18/js/bootstrap-select.min.js" integrity="sha512-yDlE7vpGDP7o2eftkCiPZ+yuUyEcaBwoJoIhdXv71KZWugFqEphIS3PU60lEkFaz8RxaVsMpSvQxMBaKVwA5xg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="./assets/js/app.js"></script>

        
        
        <script type="text/javascript">
            $(document).ready(function () {
                $('#sidebarCollapse').on('click', function () {
                    $('#sidebar').toggleClass('active');
                });
            });
        </script>

        <script>
            tinymce.init({
                selector: 'textarea',
                plugins: 'advlist autolink lists link image charmap print preview hr anchor pagebreak',
                toolbar_mode: 'floating',
                content_css: "./assets/css/mod-project.css"
            });
        </script>
    </body>
</html>