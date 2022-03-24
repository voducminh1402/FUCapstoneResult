<%-- Document : admin Created on : Jan 18, 2022, 11:06:28 PM Author : HP --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@page
    contentType="text/html" pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html lang="en">
        <head>
            <meta charset="UTF-8" />
            <meta http-equiv="X-UA-Compatible" content="IE=edge" />
            <meta name="viewport" content="width=device-width, initial-scale=1.0" />
            <meta name="referrer" content="no-referrer" />
            <title>FPT Capstone Project Result</title>
            <link
                rel="stylesheet"
                href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
                integrity="sha512-Fo3rlrZj/k7ujTnHg4CGR2D7kSs0v4LLanw2qksYuRlEzO+tcaEPQogQ0KaoGN26/zrn20ImR1DfuLWnOo7aBA=="
                crossorigin="anonymous"
                referrerpolicy="no-referrer"
                />
            <link
                href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
                rel="stylesheet"
                integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
                crossorigin="anonymous"
                />
            <link rel="stylesheet" href="./assets/css/mod-project.css" />
            <link rel="stylesheet" href="./assets/css/mod-post.css" />
            <link rel="stylesheet" href="./assets/css/styles.css" />
            <link rel="stylesheet" href="./assets/css/responsive.css" />
            <link
                rel="stylesheet"
                href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
                integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg=="
                crossorigin="anonymous"
                referrerpolicy="no-referrer"
                />
            <style>
                #label {
                    background-color: #5dc282;
                    padding: 0.5rem 1.5rem 0.5rem 1.2rem;
                    border-radius: 5px;
                    color: white;
                    cursor: pointer;
                }
                #image-file {
                    opacity: 0;
                }
                #icon {
                    color: white;
                    margin-right: 0.5rem;
                }
            </style>
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
                                <i class="fas fa-briefcase"></i> Bài Đăng Chính
                            </a>
                            <a href="mod-request.jsp" data-toggle="collapse" aria-expanded="false">
                                <i class="fas fa-copy"></i> Bài Viết Của Sinh Viên
                            </a>
                        </li>

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
                                            <button
                                                type="button"
                                                id="sidebarCollapse"
                                                class="btn btn-info"
                                                >
                                                <i class="fas fa-align-left"></i>
                                            </button>
                                            <div class="menu-search">
                                                <button>
                                                    <i class="fa fa-search" aria-hidden="true"></i>
                                                </button>
                                                <input
                                                    class="mod-menu-input"
                                                    type="text"
                                                    placeholder="Tìm Kiếm..."
                                                    />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">

                                        <div class="right-side-info">
                                            <div>
                                                <i class="fas fa-bell fa-fw more-choice__dot" style="margin-right: 5px; color: blue"></i>
                                            </div>
                                            <div class="more-choice__menu" style="margin-top: 12%; margin-right: 3%">
                                                <c:forEach items="${requestScope.TOP3_REQUEST_POST}" var="o">
                                                    <div class="more-choice__item" style="margin-top: -2px">
                                                        <h4 style="display: inline; font-size: 0.75rem; font-weight: 700;">${o.postAuthor}</h4>
                                                        <span style="font-size: 0.5rem; color: grey">đã yêu cầu bài viết</span>
                                                        <a href="mod-request.jsp">
                                                            <span style=" margin-top: -10px; display: block; font-size: 0.6rem; color: black">${o.postTitle}</span>
                                                        </a>
                                                    </div>
                                                    <div class="devider" style="width: 100%; color: black; margin: -10px 0 10px 0"></div>
                                                </c:forEach>
                                            </div>
                                            <!-- Dropdown - Alerts -->
                                            <div class="info-login">
                                                <img src="${requestScope.USER.userImage}" alt="">
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
                                    <h2>Quản Lí Sinh Viên</h2>
                                    <div class="direct-link">
                                        <i class="fas fa-home"></i>
                                        <i class="fas fa-chevron-right"></i>
                                        <span>Quản Lí Sinh Viên</span>
                                    </div>
                                </div>
                            </div>
                            <div class="content-filter">
                                <div class="row">
                                    <div class="col-md-8 col-sm-12">
                                        <div class="filter">


                                            <form id="load-file" method="post" action="LoadFileStudentController" enctype="multipart/form-data">
                                                <label id="label" for="image-file"
                                                       ><i id="icon" class="fas fa-file-import"></i>Import</label
                                                >
                                                <span id="file-name"></span>
                                                <input id="image-file" type="file" name="file" size="60" />

                                            </form>

                                        </div>
                                    </div>
                                    <div class="col-md-4 col-sm-12">
                                        <div class="manage-project">
                                            <form action="MainController">
                                                <div class="menu-search menu-search-project">

                                                    <button name="action" value="SearchStudentByName">
                                                        <i class="fa fa-search" aria-hidden="true"></i>
                                                    </button>
                                                    <input
                                                        class="mod-menu-input"
                                                        type="text"
                                                        placeholder="Tìm Kiếm Sinh Viên..."
                                                        name="name"
                                                        />
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="content-table">
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>No.</th>
                                                <th>Mã số sinh viên</th>
                                                <th>Tên</th>
                                                <th>Chuyên ngành</th>
                                                <!--                                                <th>Ngày Tạo</th>
                                                                                                <th>Phân Loại</th>
                                                                                                <th>Trạng Thái</th>-->
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:if test="${requestScope.LIST_STUDENT==null}">
                                                <c:redirect
                                                    url="MainController?action=LoadAllStudent"
                                                    ></c:redirect>
                                            </c:if>
                                            <c:forEach
                                                items="${requestScope.LIST_STUDENT}"
                                                var="o"
                                                varStatus="counter"
                                                >
                                                <tr>
                                                    <td>${counter.count}</td>
                                                    <td>${o.studentID}</td>
                                                    <td>${o.studentName}</td>
                                                    <td>${o.majorID}</td>
                                                    <!--                                                <td>01/01/2021</td>
                                                                                                    <td>Admin</td>
                                                                                                    <td>Enable</td>-->
                                                    <td class="last-type__menu">
                                                        <i class="fas fa-ellipsis-h more-choice__dot"></i>
                                                        <div class="more-choice__menu">
<!--                                                            <div class="more-choice__item">
                                                                <a href="MainController?action=showUserDetail&id=${o.studentID}&page=student">
                                                                    <span>Xem Chi Tiết</span>
                                                                    <i class="fa fa-eye" aria-hidden="true"></i>
                                                                </a>
                                                            </div>-->
                                                            <div class="more-choice__item">
                                                                <a href="MainController?action=showUserDetail&id=${o.studentID}&page=student">
                                                                    <span>Chỉnh Sửa</span>
                                                                    <i class="fa fa-pencil" aria-hidden="true"></i>
                                                                </a>
                                                            </div>
                                                            <div class="more-choice__item">
                                                                <a href="MainController?action=DeleteStudent&id=${o.studentID}">
                                                                    <span>Xóa</span>
                                                                    <i class="fa fa-trash" aria-hidden="true"></i>
                                                                </a>
                                                            </div>
                                                        </div>
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
            <script src="./ckeditor/ckeditor.js"></script>
            <script
                src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
                integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
                crossorigin="anonymous"
                referrerpolicy="no-referrer"
            ></script>
            <script
                src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
                crossorigin="anonymous"
            ></script>
            <script
                src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
                integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
                crossorigin="anonymous"
            ></script>
            <script
                src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
                integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
                crossorigin="anonymous"
            ></script>
            <script
                src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-tagsinput/0.8.0/bootstrap-tagsinput.min.js"
                integrity="sha512-9UR1ynHntZdqHnwXKTaOm1s6V9fExqejKvg5XMawEMToW4sSw+3jtLrYfZPijvnwnnE8Uol1O9BcAskoxgec+g=="
                crossorigin="anonymous"
                referrerpolicy="no-referrer"
            ></script>

            <script type="text/javascript">
                $(document).ready(function () {
                    $("#sidebarCollapse").on("click", function () {
                        $("#sidebar").toggleClass("active");
                    });
                });
            </script>

            <script>
                document.getElementById("image-file").addEventListener("change", () => {

                    document.getElementById("load-file").submit();
                });
            </script>

            <script
                src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"
                type="text/javascript"
            ></script>
            <script
                src="https://cdn.tiny.cloud/1/m862mtwmvofelufcxf6kpr7rr30u4mh13bb09ks2g0xg8gdf/tinymce/5/tinymce.min.js"
                referrerpolicy="origin"
            ></script>
<<<<<<< HEAD
            <script
                src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
                integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
                crossorigin="anonymous"
                referrerpolicy="no-referrer"
            ></script>
            <script
                src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
                crossorigin="anonymous"
            ></script>
            <script
                src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
                integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
                crossorigin="anonymous"
            ></script>
            <script
                src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
                integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
                crossorigin="anonymous"
            ></script>
            <script src="./assets/js/app.js"></script>
=======
            <!--            <script
                            src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
                            integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
                            crossorigin="anonymous"
                            referrerpolicy="no-referrer"
                        ></script>
                        <script
                            src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
                            crossorigin="anonymous"
                        ></script>
                        <script
                            src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
                            integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
                            crossorigin="anonymous"
                        ></script>
                        <script
                            src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
                            integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
                            crossorigin="anonymous"
                        ></script>
                        <script src="./assets/js/app.js"></script>-->
>>>>>>> 1e7586740eda83076eeca9423261f17da5ccd7b7

            <script type="text/javascript">
                $(document).ready(function () {
                    $("#sidebarCollapse").on("click", function () {
                        $("#sidebar").toggleClass("active");
                    });
                });
            </script>

            <script>
                tinymce.init({
                    selector: "textarea",
                    plugins:
                            "advlist autolink lists link image charmap print preview hr anchor pagebreak",
                    toolbar_mode: "floating",
                    content_css: "./assets/css/mod-project.css",
                });
            </script>
        </body>
    </html>
