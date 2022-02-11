<%-- 
    Document   : po-add-post
    Created on : Jan 28, 2022, 11:10:25 AM
    Author     : ADMIN
--%>

<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="referrer" content="no-referrer">
        <title>FPT Capstone Project Result</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-tagsinput/0.8.0/bootstrap-tagsinput.css" integrity="sha512-xmGTNt20S0t62wHLmQec2DauG9T+owP9e6VU8GigI0anN7OXLip9i7IwEhelasml2osdxX71XcYm6BQunTQeQg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" integrity="sha512-Fo3rlrZj/k7ujTnHg4CGR2D7kSs0v4LLanw2qksYuRlEzO+tcaEPQogQ0KaoGN26/zrn20ImR1DfuLWnOo7aBA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="./assets/css/mod-project.css">    
        <link rel="stylesheet" href="./assets/css/mod-post.css">    
        <link rel="stylesheet" href="./assets/css/styles.css">
        <link rel="stylesheet" href="./assets/css/responsive.css">
        <link rel="stylesheet" href="./assets/css/po-add-post.css">
    </head>
    <body>
        <div class="popost-wrapper">
            <div class="header-all">
                <div class="header-part">
                    <header class="home-page-header" style="background-color:#F26F21">
                        <a href="./index.html" class="home-page-header__logo">
                            <img src="./assets/images/logo1.jpg" alt="">
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
            <c:if test="${requestScope.POPOST == null}">
                <c:redirect url="MainController?action=GetPoPostController&page=popost"></c:redirect>
            </c:if>     
    </body>
</html>
