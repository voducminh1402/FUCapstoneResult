<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>FPT Capstone Project Result</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
              integrity="sha512-Fo3rlrZj/k7ujTnHg4CGR2D7kSs0v4LLanw2qksYuRlEzO+tcaEPQogQ0KaoGN26/zrn20ImR1DfuLWnOo7aBA=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="./assets/css/mod-project.css">
        <link rel="stylesheet" href="./assets/css/styles.css">
        <link rel="stylesheet" href="./assets/css/responsive.css">
        <link rel="stylesheet" href="./assets/css/mod-index.css">
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
                <c:if test="${requestScope.NUM_OF_POST == null}">
                    <c:redirect url="MainController?action=ViewModIndexPage"></c:redirect>
                </c:if>
                <nav class="navbar navbar-expand-lg navbar-light bg-light">
                    <div class="container-fluid">
                        <div class="mod-header">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="left-side-menu">
                                        <button type="button" id="sidebarCollapse" class="btn btn-info">
                                            <i class="fas fa-align-left"></i>
                                        </button>
                                        <div class="menu-search">
                                            <button><i class="fa fa-search" aria-hidden="true"></i></button>
                                            <input class="mod-menu-input" type="text" placeholder="Tìm Kiếm...">
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
                            <div class="col-4">
                                <div class="main-post">
                                    <div class="row">
                                        <div class="col-3" style="padding-top: 2px; margin-left: 5px;">
                                            <i class="bi bi-window">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50"
                                                     fill="currentColor" class="bi bi-window" viewBox="0 0 16 16">
                                                <path
                                                    d="M2.5 4a.5.5 0 1 0 0-1 .5.5 0 0 0 0 1zm2-.5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0zm1 .5a.5.5 0 1 0 0-1 .5.5 0 0 0 0 1z" />
                                                <path
                                                    d="M2 1a2 2 0 0 0-2 2v10a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V3a2 2 0 0 0-2-2H2zm13 2v2H1V3a1 1 0 0 1 1-1h12a1 1 0 0 1 1 1zM2 14a1 1 0 0 1-1-1V6h14v7a1 1 0 0 1-1 1H2z" />
                                                </svg>
                                            </i>
                                        </div>
                                        <div class="col-9" style="padding-top: 4px; margin-left: -20px;">
                                            <a style="margin-top: -5px; margin-bottom: -8px; font-weight: 600; font-size: 1.25rem; display: block" href="mod-post.jsp">Bài đăng chính</a>
                                            <span style="color: gray; font-size: 0.85rem;">${requestScope.NUM_OF_POST}</span>
                                            <span style="color: gray; font-size: 0.85rem;">bài viết</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-4">
                                <div class="po-post">
                                    <div class="row">
                                        <div class="col-3" style="padding-top: 2px; margin-left: 5px;">
                                            <i class="bi bi-window">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50"
                                                     fill="currentColor" class="bi bi-window" viewBox="0 0 16 16">
                                                <path
                                                    d="M2.5 4a.5.5 0 1 0 0-1 .5.5 0 0 0 0 1zm2-.5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0zm1 .5a.5.5 0 1 0 0-1 .5.5 0 0 0 0 1z" />
                                                <path
                                                    d="M2 1a2 2 0 0 0-2 2v10a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V3a2 2 0 0 0-2-2H2zm13 2v2H1V3a1 1 0 0 1 1-1h12a1 1 0 0 1 1 1zM2 14a1 1 0 0 1-1-1V6h14v7a1 1 0 0 1-1 1H2z" />
                                                </svg>
                                            </i>
                                        </div>
                                        <div class="col-9" style="padding-top: 4px; margin-left: -20px;">
                                            <a style="margin-top: -5px; margin-bottom: -8px; font-weight: 600; font-size: 1.25rem; display: block" href="mod-request.jsp">Bài viết của sinh viên</a>
                                            <span style="color: gray; font-size: 0.85rem;">${requestScope.NUM_OF_POPOST}</span>
                                            <span style="color: gray; font-size: 0.85rem;">bài viết đang chờ</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-4">
                                <div class="project">
                                    <div class="row">
                                        <div class="col-3" style="padding-top: 2px; margin-left: 5px;">
                                            <i class="bi bi-window">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50"
                                                     fill="currentColor" class="bi bi-window" viewBox="0 0 16 16">
                                                <path
                                                    d="M2.5 4a.5.5 0 1 0 0-1 .5.5 0 0 0 0 1zm2-.5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0zm1 .5a.5.5 0 1 0 0-1 .5.5 0 0 0 0 1z" />
                                                <path
                                                    d="M2 1a2 2 0 0 0-2 2v10a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V3a2 2 0 0 0-2-2H2zm13 2v2H1V3a1 1 0 0 1 1-1h12a1 1 0 0 1 1 1zM2 14a1 1 0 0 1-1-1V6h14v7a1 1 0 0 1-1 1H2z" />
                                                </svg>
                                            </i>
                                        </div>
                                        <div class="col-9" style="padding-top: 4px; margin-left: -20px;">
                                            <a style="margin-top: -5px; margin-bottom: -8px; font-weight: 600; font-size: 1.25rem; display: block" href="mod-project.jsp">Đồ án</a>
                                            <span style="color: gray; font-size: 0.85rem;">${requestScope.NUM_OF_PROJECT}</span>
                                            <span style="color: gray; font-size: 0.85rem;">Đồ án</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="left-side col-8">
                                <div class="top-post">
                                    <div class="table-responsive">
                                        <table class="table">
                                            <thead>
                                            <h3>Top bài viết nổi bật</h3>
                                            <div class="devider" style="width: 100%; color: lightgray"></div>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${requestScope.TOP_POST}" var="o" varStatus="counter">                                                                                                   <tr>
                                                        <td>${counter.count}</td>
                                                        <td><img class="post-thumb" src="${o.postImage}" alt=""></td>
                                                        <td>
                                                            <a style="font-size: 1.25rem; font-weight: 600" href="MainController?action=viewPoPost&id=${o.postID}">${o.postTitle}</a>
                                                        </td>
                                                        <td>
                                                            <i  class="bi bi-hand-thumbs-up">
                                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-hand-thumbs-up" viewBox="0 0 16 16">
                                                                <path d="M8.864.046C7.908-.193 7.02.53 6.956 1.466c-.072 1.051-.23 2.016-.428 2.59-.125.36-.479 1.013-1.04 1.639-.557.623-1.282 1.178-2.131 1.41C2.685 7.288 2 7.87 2 8.72v4.001c0 .845.682 1.464 1.448 1.545 1.07.114 1.564.415 2.068.723l.048.03c.272.165.578.348.97.484.397.136.861.217 1.466.217h3.5c.937 0 1.599-.477 1.934-1.064a1.86 1.86 0 0 0 .254-.912c0-.152-.023-.312-.077-.464.201-.263.38-.578.488-.901.11-.33.172-.762.004-1.149.069-.13.12-.269.159-.403.077-.27.113-.568.113-.857 0-.288-.036-.585-.113-.856a2.144 2.144 0 0 0-.138-.362 1.9 1.9 0 0 0 .234-1.734c-.206-.592-.682-1.1-1.2-1.272-.847-.282-1.803-.276-2.516-.211a9.84 9.84 0 0 0-.443.05 9.365 9.365 0 0 0-.062-4.509A1.38 1.38 0 0 0 9.125.111L8.864.046zM11.5 14.721H8c-.51 0-.863-.069-1.14-.164-.281-.097-.506-.228-.776-.393l-.04-.024c-.555-.339-1.198-.731-2.49-.868-.333-.036-.554-.29-.554-.55V8.72c0-.254.226-.543.62-.65 1.095-.3 1.977-.996 2.614-1.708.635-.71 1.064-1.475 1.238-1.978.243-.7.407-1.768.482-2.85.025-.362.36-.594.667-.518l.262.066c.16.04.258.143.288.255a8.34 8.34 0 0 1-.145 4.725.5.5 0 0 0 .595.644l.003-.001.014-.003.058-.014a8.908 8.908 0 0 1 1.036-.157c.663-.06 1.457-.054 2.11.164.175.058.45.3.57.65.107.308.087.67-.266 1.022l-.353.353.353.354c.043.043.105.141.154.315.048.167.075.37.075.581 0 .212-.027.414-.075.582-.05.174-.111.272-.154.315l-.353.353.353.354c.047.047.109.177.005.488a2.224 2.224 0 0 1-.505.805l-.353.353.353.354c.006.005.041.05.041.17a.866.866 0 0 1-.121.416c-.165.288-.503.56-1.066.56z"/>
                                                                </svg>
                                                            </i>
                                                            <span>${o.upvote}</span>
                                                        </td>
                                                        <td>
                                                            <i class="bi bi-chat-left-text">
                                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat-left-text" viewBox="0 0 16 16">
                                                                <path d="M14 1a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1H4.414A2 2 0 0 0 3 11.586l-2 2V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12.793a.5.5 0 0 0 .854.353l2.853-2.853A1 1 0 0 1 4.414 12H14a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
                                                                <path d="M3 3.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zM3 6a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9A.5.5 0 0 1 3 6zm0 2.5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5z"/>
                                                                </svg>
                                                            </i>
                                                            <span>${o.numOfComment}</span>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="righ-side col-4">
                                <div class="user-comment">
                                    <div class="comment-box__header">
                                        <h5>Bình luận đang chờ xét duyệt</h5>
                                    </div>
                                    <div class="comment-box__body">
                                        <c:forEach items="${requestScope.COMMENT_LIST}" var="a" varStatus="counter">
                                            <div class="comment-item">
                                                <div class="comment__ava">
                                                    <img src="${a.userImage}"
                                                         alt="">
                                                </div>
                                                <h6
                                                    style="margin-left: 60px; margin-top: 15px; font-weight: 700; margin-bottom: -3px;">
                                                    ${a.userName}</h6>
                                                <span style="margin-left: 60px; font-size: 0.75rem;">${a.commentTime}</span>
                                                <h6 style="margin-left: 60px; margin-top: 5px;">${a.commentDetail}</h6>
                                            </div> 
                                        </c:forEach>  
                                        <div style="width: 50%; display: flex;">
                                            <a style="font-size: 1rem" href="mod-comment-request.jsp" class="approve-comment">Xét duyệt ngay</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="overlay-page-mod" id="overlay-page overlay-page-mod"></div>

        <script src="https://cdn.tiny.cloud/1/m862mtwmvofelufcxf6kpr7rr30u4mh13bb09ks2g0xg8gdf/tinymce/5/tinymce.min.js"
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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
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