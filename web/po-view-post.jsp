<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>FPT Capstone Project Result </title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" integrity="sha512-Fo3rlrZj/k7ujTnHg4CGR2D7kSs0v4LLanw2qksYuRlEzO+tcaEPQogQ0KaoGN26/zrn20ImR1DfuLWnOo7aBA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="./assets/css/styles.css">
        <link rel="stylesheet" href="./assets/css/responsive.css">
        <link rel="stylesheet" href="./assets/css/po-view-post.css">
        <style>
            .home-page-header {
                position: fixed;
                top: 0;
                background-color: var(--main-orange);
            }

            .home-page-header__logo img {
                background-color: var(--main-white);
            }
        </style>
    </head>

    <body >
        <div class="home-page-wrapper">
            <div class="container-fluid">
                <div class="header-all">
                    <div class="header-part">
                        <header class="home-page-header">
                            <a href="./index.html" class="home-page-header__logo">
                                <img src="./assets/images/logo.png" alt="">
                                <span class="school-intro">Trường Đại học FPT - Phân hiệu Thành phố Hồ Chí Minh</span>
                            </a>
                        </header>
                        <div class="menu-right">
                            <div class="menu-icon">
                                <div class="menu-icon-line1"></div>
                                <div class="menu-icon-line2"></div>
                                <div class="menu-icon-line3"></div>
                            </div>
                        </div>
                        <div class="menu-detail">
                            <div class="menu-wrap">
                                <div class="menu-close-button">

                                </div>
                                <div class="menu-search">
                                    <form action="">
                                        <div class="menu-search-wrap">
                                            <input type="text" placeholder="Tìm kiếm">
                                            <button type="submit">
                                                <i class="fas fa-search"></i>
                                            </button>
                                        </div>
                                    </form>
                                </div>
                                <div class="menu-items">
                                    <ul>
                                        <li>
                                            <a href="./index.html">Trang chủ</a>
                                        </li>
                                        <li>
                                            <a href="projects.html">Đồ án tốt nghiệp</a>
                                        </li>
                                        <li>
                                            <a href="./project-major.html">Đồ án chuyên ngành</a>
                                        </li>
                                        <li>
                                            <a href="./blog-single.html">Bài viết</a>
                                        </li>
                                        <li>
                                            <a href="./contact.html">Liên hệ</a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="menu-contact">
                                    <div>
                                        <a href="tel:02873005588">(028) 73005588</a>
                                    </div>
                                    <div>
                                        <a href="mailto:daihoc.hcm@fpt.edu.vn">daihoc.hcm@fpt.edu.vn</a>
                                    </div>
                                    <div>
                                        <a href="">Lô E2a-7, Đường D1, Khu Công nghệ cao, P.Long Thạnh Mỹ, Tp. Thủ Đức, TP.HCM.</a>
                                    </div>
                                </div>
                                <div class="menu-footer">
                                    <span>Theo dõi ngay:</span> 
                                    <span class="menu-footer-link">
                                        <span><i class="fab fa-facebook-f"></i></span>
                                        <span><i class="fas fa-globe"></i></span>
                                        <span><i class="fab fa-twitter"></i></span>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <section class="projects-major" >
                    <div class="container">
                        <div class="projects-header">
                            <div class="row">
                                <div class="col-md-12">
                                    <h1 style="text-align: center; font-size: 40px" class="projects-header__content">Bài viết của bạn</h1>
                                    <div class="devider" style="width: 30%; margin: 0 auto"></div>
                                </div>
                            </div>
                        </div>
                        <div class="project-major-content">
                            <div class="row">
                                <c:if test="${requestScope.POPOST_LIST == null}">
                                    <c:redirect url="MainController?action=GetListPoPost"></c:redirect>
                                </c:if>
                                <c:forEach items="${requestScope.POPOST_LIST}" var="o" > 
                                    <c:if test="${o.statusID eq 1}">
                                        <div class="project-detail col-md-4 col-sm-6">
                                            <div class="project-content project-content-major">
                                                <div class="project-content-overlay">
                                                    <img class="project-content-img project-content-major-img" src="${o.popostImage}" alt="">
                                                    <div class="project-content-text">                                                       
                                                        <h1 class="po-post-status" style="color: lightgreen; font-size: 15px">Đã được duyệt</h1>
                                                        <h5 style="font-size: 30px; font-weight: 700">${o.popostTitle}</h5>
                                                        <a class="edit-post" style="text-decoration: none"; href="MainController?action=viewPoPost&id=${o.popostID}">Xem</a>
                                                        <a class="edit-post" style="text-decoration: none;margin-left: 8px" href="MainController?action=viewUpdatePoPage&id=${o.popostID}">Chỉnh sửa</a>
                                                        <a class="edit-post" style="margin-left: 10px; text-decoration: none" href="MainController?action=deletePoPostController&id=${o.popostID}">Xóa</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>                                                                                        
                                    </c:if>
                                    <c:if test="${o.statusID eq 2}">
                                        <div class="project-detail col-md-4 col-sm-6">
                                            <div class="project-content project-content-major">
                                                <div class="project-content-overlay">
                                                    <img class="project-content-img project-content-major-img" src="${o.popostImage}" alt="">
                                                    <div class="project-content-text">
                                                        <h1 class="po-post-status" style="color: yellow; font-size: 15px">Đang chờ xét duyệt</h1>
                                                        <h5 style="font-size: 30px; font-weight: 700">${o.popostTitle}</h5>
                                                        <a class="edit-post" style="text-decoration: none"; href="MainController?action=viewPoPost&id=${o.popostID}">Xem</a>
                                                        <a class="edit-post" style="text-decoration: none; margin-left: 8px" href="MainController?action=viewUpdatePoPage&id=${o.popostID}">Chỉnh sửa</a>
                                                        <a id="delete" class="edit-post" data-bs-toggle="modal" data-bs-target="#exampleModal" style="margin-left: 10px; text-decoration: none" href="MainController?action=deletePoPostController&id=${o.popostID}">Xóa</a>
                                                    </div>
                                                </div>
                                            </div>                                                                                        
                                        </c:if>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                </section>
                <div class="footer">
                    <div class="container">
                        <div class="footer-content row">
                            <div class="footer-content-first col-md-4">
                                <h3>Về Đại Học FPT</h3>
                                <p>Đại học FPT hướng tới xây dựng mô hình của một trường Đại học thế hệ mới; gắn liền đào tạo với thực tiễn cuộc sống và nhu cầu nhân lực của đất nước, góp phần đưa Giáo dục Việt Nam tiến tới ngang tầm các nước trên thế giới.</p>
                                <a href="mailto:daihoc.hcm@fpt.edu.vn">daihoc.hcm@fpt.edu.vn</a>
                            </div>
                            <div class="footer-content-detail col-md-2">
                                <span>Liên Kết Hỗ Trợ</span>
                                <div><a href="./index.html">Trang chủ</a></div>
                                <div><a href="./project.html">Đồ án tốt nghiệp</a></div>
                                <div><a href="./blog-single.html">Bài viết</a></div>
                            </div>
                            <div class="footer-content-detail col-md-2">
                                <span>Tính Năng</span>
                                <div><a href="">Đăng Ký</a></div>
                                <div><a href="">Đăng Nhập</a></div>
                                <div><a href="./contact.html">Liên hệ</a></div>
                            </div>
                            <div class="col-md-4">
                                <span>Theo Dõi Trường Đại Học FPT Tại: </span>
                                <p>Cung cấp năng lực cạnh tranh toàn cầu cho đông đảo người học, góp phần mở mang bờ cõi trí tuệ đất nước</p>
                                <div class="social">
                                    <a href="">
                                        <i class="fab fa-facebook-f"></i>
                                    </a>
                                    <a href="">
                                        <i class="fab fa-twitter"></i>
                                    </a>
                                    <a href="">
                                        <i class="fab fa-instagram"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="footer-end container-fluid">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-12">
                                    <p>Trường Đại học FPT Phân hiệu Thành phố Hồ Chí Minh</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
        <script src="./assets/js/app.js"></script>
    </body>
</html>
