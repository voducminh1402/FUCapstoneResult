<%-- Document : mod-comment-request Created on : Jan 29, 2022, 12:01:07 PM Author : Asus --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>FPT Capstone Project Result</title>
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
              integrity="sha512-Fo3rlrZj/k7ujTnHg4CGR2D7kSs0v4LLanw2qksYuRlEzO+tcaEPQogQ0KaoGN26/zrn20ImR1DfuLWnOo7aBA=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
              crossorigin="anonymous">
        <link rel="stylesheet" href="./assets/css/mod-project.css">
        <link rel="stylesheet" href="./assets/css/styles.css">
        <link rel="stylesheet" href="./assets/css/responsive.css">
        <link rel="stylesheet" href="assets/css/mod-request.css">
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" />
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="assets/css/mod-project.css">
        <link rel="stylesheet" href="assets/css/mod-comment-request.css">

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
                    
                    <hr class="sidebar-divider">
             
                    
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
                                <h2>Bình Luận</h2>
                                <div class="direct-link">
                                    <i class="fas fa-home"></i>
                                    <i class="fas fa-chevron-right"></i>
                                    <span>Bình Luận</span>
                                </div>
                            </div>
                        </div>
                        <div class="content-filter">
                            <div class="row">
                                <div class="col-md-8 col-sm-12">
                                    <div class="filter">
                                        <span>Hiển Thị</span>
                                        <select name="" id="">
                                            <option value="">Tất Cả Bình Luận</option>
                                            <option value="">Đã Duyệt</option>
                                            <option value="">Đang Chờ Xét Duyệt</option>
                                            <option value="">Đã Xóa</option>
                                        </select>
                                        <button>Tìm Kiếm</button>
                                    </div>
                                </div>
                                <div class="col-md-4 col-sm-12">
                                    <div class="manage-project">
                                        <div class="menu-search menu-search-project">
                                            <button><i class="fa fa-search" aria-hidden="true"></i></button>
                                            <input class="mod-menu-input" type="text"
                                                   placeholder="Tìm Kiếm Bình Luận...">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="content-table2">
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>NO</th>
                                            <th>Tên Người Dùng</th>
                                            <th>Email</th>
                                            <th>Bình Luận</th>
                                            <th>Phản Hồi Tới</th>

                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:if test="${requestScope.LIST_USERCOMMENT== null}">
                                            <c:redirect url="MainController?action=LoadComments"></c:redirect>
                                        </c:if>
                                        <c:forEach items="${requestScope.LIST_USERCOMMENT}" var="o" varStatus="counter">
                                            <tr>
                                                <td>${counter.count}</td>
                                                <td>${o.userName}</td>
                                                <td>${o.email}</td>
                                                <td>
                                                    <form action="MainController" method="POST">
                                                        <p style="color: #3308ce ; font-size:15px">
                                                            ${o.commentTime}
                                                        </p>
                                                        <p style="color:black">${o.commentDetail}
                                                        </p>
                                                        <nav aria-label="breadcrumb">
                                                            <ol class="breadcrumb">
                                                                <li class="breadcrumb-item">
                                                                    <c:if test="${o.commentStatusId == 1}">
                                                                        <input type="hidden" value="${o.commentId}" name="commentId">
                                                                        <input type="hidden" value="${o.postId}" name="postId">
                                                                        <input type="hidden" value="${o.userId}" name="userId">
                                                                        <input type="hidden" value="${o.commentDetail}" name="commentDetail">
                                                                        <input type="hidden" value="${o.commentTime}" name="commentTime">
                                                                        <input type="hidden" value="${o.commentStatusId}" name="commentStatusId">
                                                                        <button type="submit" name="action"
                                                                                value="AddComment"
                                                                                class="btn btn-primary btn-sm ">Xét
                                                                            Duyệt</button>
                                                                    <li class="breadcrumb-item"><a
                                                                            href="MainController?action=DeleteComment&commentId=${o.commentId}"
                                                                            style="color:red">Xoá</a>

                                                                    </c:if>
                                                                    <c:if test="${o.commentStatusId == 2}">
                                                                        <a href="MainController?action=Undo&commentId=${o.commentId}"
                                                                           style="color:green">Đã
                                                                            Duyệt</a>
                                                                    <li class="breadcrumb-item"><a
                                                                            href="MainController?action=DeleteComment&commentId=${o.commentId}"
                                                                            style="color:red">Xoá</a>

                                                                    </c:if>
                                                                    <c:if test="${o.commentStatusId == 3}">
                                                                        <a href="MainController?action=Undo&commentId=${o.commentId}"
                                                                           style="color:red">Đã
                                                                            Xoá</a>
                                                                        </c:if>
                                                            </ol>
                                                        </nav>
                                                    </form>
                                                </td>
                                                <td>
                                                    <c:if test="${o.isMainPost ne null}">
                                                        <a href="MainController?action=DetailProject&id=${o.postID}">${o.postTitle}</a>
                                                    </c:if>
                                                    <c:if test="${o.isMainPost eq null}">
                                                        <a href="MainController?action=viewPoPost&id=${o.postID}">${o.postTitle}</a>
                                                    </c:if>
                                                </td>
                                            </tr> 
                                        </c:forEach>
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
        <div class="overlay-page-mod" id="overlay-page overlay-page-mod"></div>
        <script
            src="https://cdn.tiny.cloud/1/m862mtwmvofelufcxf6kpr7rr30u4mh13bb09ks2g0xg8gdf/tinymce/5/tinymce.min.js"
        referrerpolicy="origin"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
                integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
                integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
                integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
        crossorigin="anonymous"></script>
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
        <!-- dropdown  -->
        <script>
            /* When the user clicks on the button, 
             toggle between hiding and showing the dropdown content */
            function myFunction() {
                document.getElementById("myDropdown").classList.toggle("show");
            }

            // Close the dropdown if the user clicks outside of it
            window.onclick = function (event) {
                if (!event.target.matches('.dropbtn')) {
                    var dropdowns = document.getElementsByClassName("dropdown-content");
                    var i;
                    for (i = 0; i < dropdowns.length; i++) {
                        var openDropdown = dropdowns[i];
                        if (openDropdown.classList.contains('show')) {
                            openDropdown.classList.remove('show');
                        }
                    }
                }
            }
        </script>

    </body>

</html>