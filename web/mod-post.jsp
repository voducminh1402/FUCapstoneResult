<%-- 
    Document   : mod-post
    Created on : Jan 18, 2022, 11:07:37 PM
    Author     : VODUCMINH
--%>
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
                <li class="active">
                    <a href="#homeSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
                        <i class="fas fa-home"></i>
                        Home
                    </a>
                    <ul class="collapse list-unstyled" id="homeSubmenu">
                        <li>
                            <a href="#">Home 1</a>
                        </li>
                        <li>
                            <a href="#">Home 2</a>
                        </li>
                        <li>
                            <a href="#">Home 3</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#">
                        <i class="fas fa-briefcase"></i>
                        About
                    </a>
                    <a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
                        <i class="fas fa-copy"></i>
                        Pages
                    </a>
                    <ul class="collapse list-unstyled" id="pageSubmenu">
                        <li>
                            <a href="#">Page 1</a>
                        </li>
                        <li>
                            <a href="#">Page 2</a>
                        </li>
                        <li>
                            <a href="#">Page 3</a>
                        </li>
                    </ul>
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
                                    <div class="info-login">
                                        <img src="https://cdn2.mhpbooks.com/2014/03/test_ttp_big.jpg" alt="">
                                        <span>Xin Chào, Moderator 1 <i class="fa fa-caret-down" aria-hidden="true"></i></span>
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
                            <h2>Quản Lí Bài Đăng</h2>
                            <div class="direct-link">
                                <i class="fas fa-home"></i>
                                <i class="fas fa-chevron-right"></i>
                                <span>Quản Lí Bài Đăng</span>
                            </div>
                        </div>
                    </div>
                    <div class="content-filter">
                        <div class="row">
                            <div class="col-md-8 col-sm-12">
                                <div class="filter">
                                    <span>Hiển Thị</span> 
                                    <select name="" id="">
                                        <option value="Học Kì">Tất Cả Học Kì</option>
                                        <option value="Spring 2019">Spring 2019</option>
                                        <option value="Summer 2019">Summer 2019</option>
                                        <option value="Fall 2019">Fall 2019</option>
                                        <option value="Spring 2020">Spring 2020</option>
                                        <option value="Summer 2020">Summer 2020</option>
                                        <option value="Fall 2020">Fall 2020</option>
                                    </select>
                                    <select name="" id="">
                                        <option value="">Tất Cả Trạng Thái</option>
                                        <option value="">Đã Xuất Bản</option>
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
                                        <input class="mod-menu-input" type="text" placeholder="Tìm Kiếm Bài Đăng...">
                                    </div>
                                    <a href="mod-add-post.jsp" class="link-add-project">
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
                                  <th>Tiêu Đề Bài Đăng</th>
                                  <th>Ngày Đăng</th>
                                  <th>Tác Giả</th>
                                  <th>Trạng Thái</th>
                                  <th></th>
                                </tr>
                              </thead>
                              <tbody>
                                <c:if test="${requestScope.POST_LIST == null}">
                                    <c:redirect url="MainController?action=GetListPost"></c:redirect>
                                </c:if>
                                <c:forEach items="${requestScope.POST_LIST}" var="o" varStatus="counter">
                                    <tr>
                                        <td>${counter.count}</td>
                                        <td>${o.postTitle}</td>
                                        <td>${o.postDate}</td>
                                        <td>${o.postAuthor}</td>
                                        <td>
                                            <c:if test="${o.postStatusID eq 1}">
                                                Đã Xuất Bản
                                            </c:if>
                                            <c:if test="${o.postStatusID eq 2}">
                                                Đang Chờ Duyệt
                                            </c:if>
                                            <c:if test="${o.postStatusID eq 3}">
                                                Đã Xóa
                                            </c:if>
                                        </td>
                                        <td class="last-type__menu">
                                            <i class="fas fa-ellipsis-h more-choice__dot"></i>
                                            <div class="more-choice__menu">
                                                <div class="more-choice__item">
                                                    <a href="">
                                                        <span>Xem Chi Tiết</span>
                                                        <i class="fa fa-eye" aria-hidden="true"></i>
                                                    </a>
                                                </div>
                                                <div class="more-choice__item">
                                                    <a href="MainController?action=EditPost&id=${o.postID}">
                                                        <span>Chỉnh Sửa</span>
                                                        <i class="fa fa-pencil" aria-hidden="true"></i>
                                                    </a>
                                                </div>
                                                <div class="more-choice__item">
                                                    <a href="">
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