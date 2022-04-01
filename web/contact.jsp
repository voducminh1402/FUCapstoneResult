<%-- 
    Document   : contact
    Created on : Apr 1, 2022, 4:18:46 PM
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
        <title>FPT Capstone Project Result </title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.css" integrity="sha512-yHknP1/AwR+yx26cB1y0cjvQUMvEa2PFzt1c9LlS4pRQ5NOTZFWbhBig+X9G9eYW/8m0/4OXNx8pxJ6z57x0dw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick-theme.min.css" integrity="sha512-17EgCFERpgZKcm0j0fEq1YCJuyAWdz9KUtv1EjVuaOz8pDnh/0nZxmU6BBXwaaxqoi9PQXnRWqlcDB027hgv9A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" integrity="sha512-Fo3rlrZj/k7ujTnHg4CGR2D7kSs0v4LLanw2qksYuRlEzO+tcaEPQogQ0KaoGN26/zrn20ImR1DfuLWnOo7aBA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="./assets/css/slide.css">    
        <link rel="stylesheet" href="./assets/css/styles.css">
        <link rel="stylesheet" href="./assets/css/responsive.css">
        <style>
            .home-page-header {
                position: fixed;
                top: 0;
                background-color: var(--main-orange);
            }

            .home-page-header__logo img {
                background-color: var(--main-white);
            }
            .wrapper {
                padding: 10px 50px;
                border: 1px solid #ddd;
                border-radius: 15px;
                margin: 10px auto;
                max-width: 1300px;
                background-color: #F26F21 ;
            }
        </style>
    </head>

    <body>
        <section class="contact-page">
            <div id="top" class="home-page-wrapper">
               <div class="header-part">
                        <header class="home-page-header">
                            <a href="./index.jsp" class="home-page-header__logo">
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
                                    <form action="MainController">
                                        <div class="menu-search-wrap">
                                            <input name="searchValue" type="text" placeholder="Tìm kiếm">
                                            <button name="action" value="Search" type="submit">
                                                <i class="fas fa-search"></i>
                                            </button>
                                        </div>
                                    </form>
                                </div>
                                <div class="menu-items">
                                    <ul>
                                        <li>
                                            <a href="./index.jsp">Trang chủ</a>
                                        </li>
                                        <li>
                                            <a href="project.jsp">Top Các Đồ Án Xuất Sắc</a>
                                        </li>
                                        <c:if test="${sessionScope.IS_STUDENT == 1}">
                                            <li>
                                                <a href="./po-view-post.jsp">Nội dung của bạn</a>
                                            </li>
                                        </c:if>
                                        
                                        <li>
                                            <a href="./contact.jsp">Liên hệ</a>
                                        </li>
                                        <li>
                                            <c:if test="${sessionScope.USER ne null}">
                                                <a style="color: var(--main-orange); text-transform: uppercase">
                                                    <form action="MainController">
                                                        <button class="button-logout" type="submit" name="action" value="showUserDetail" style="text-transform: uppercase">Chỉnh sửa thông tin</button>
                                                        <input type="hidden" name="page" value="index">
                                                        <input type="hidden" name="id" value="${sessionScope.USER.userID}">
                                                    </form>
                                                </a>
                                            </c:if>
                                        </li>
                                        <li>
                                            <c:if test="${sessionScope.USER eq null}">
                                                <a href="./login.html">Đăng nhập</a>
                                            </c:if>
                                            <c:if test="${sessionScope.USER ne null}">
                                                <a style="color: var(--main-orange); text-transform: uppercase">
                                                    <form action="MainController">
                                                        <button class="button-logout" type="submit" name="action" value="Logout" style="text-transform: uppercase">Đăng xuất</button>
                                                    </form>
                                                </a>
                                            </c:if>
                                        </li>
                                    </ul>
                                </div>
                                <!--                            <div class="menu-login">
                                                                <a href="login.html">LOGIN</a>
                                                                <div>
                                                                    <form>
                                                                        <span>Xin chào ${sessionScope.USER.userName}</span>
                                                                        <button style="vertical-align: initial" type="submit">LOG OUT</button>
                                                                    </form>
                                                                </div>
                                                            </div>-->
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
                            <div class="overlay-page" id="overlay-page"></div>

            <div class="container container-fluid" style="margin-bottom: 50px">         
                <div class="route" style="margin-top: 120px">
                    <span>
                        <a href="index.jsp"><i class="fas fa-home"></i> Trang chủ</a>
                    </span> <i class="fas fa-angle-right"></i> <span>Liên hệ</span>
                </div>
                <div class="row">
                    <div class="col-md-4" style="margin-top: 20px">
                        <div class="contact-info">
                            <div class="contact-info__header" style="padding-bottom: 10px;">
                                <h1 style="color: #F26F21; font-size: 1.5rem">TRƯỜNG ĐẠI HỌC FPT</h1>
                            </div>
                            <div class="devider" style="width: 100%; margin-top: -6px; margin-bottom: 10px"></div>
                            <div class="contact-info__body">
                                <div class="c-location" style="padding-bottom: 10px;">
                                    <i class="contact-location-icon bi bi-geo-alt-fill" style="color: grey">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-geo-alt-fill" viewBox="0 0 16 16">
                                        <path d="M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10zm0-7a3 3 0 1 1 0-6 3 3 0 0 1 0 6z"/>
                                        </svg>
                                    </i>
                                    <span>
                                        Lô E2a-7, Đường D1, Khu Công Nghệ Cao, Long Thạnh Mỹ, Thành Phố Thủ Đức, Thành phố Hồ Chí Minh 
                                    </span>
                                </div>
                                <div class="c-email" style="padding-bottom: 10px;">
                                    <i class="contact-email-icon bi bi-envelope" style="color: grey">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-envelope" viewBox="0 0 16 16">
                                        <path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4Zm2-1a1 1 0 0 0-1 1v.217l7 4.2 7-4.2V4a1 1 0 0 0-1-1H2Zm13 2.383-4.708 2.825L15 11.105V5.383Zm-.034 6.876-5.64-3.471L8 9.583l-1.326-.795-5.64 3.47A1 1 0 0 0 2 13h12a1 1 0 0 0 .966-.741ZM1 11.105l4.708-2.897L1 5.383v5.722Z"/>
                                        </svg>
                                    </i>
                                    <span>daihoc.hcm@fpt.edu.vn</span>
                                </div>
                                <div class="c-phone" style="padding-bottom: 10px;">
                                    <i class="contact-phone-icon bi bi-telephone" style="color: grey">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-telephone" viewBox="0 0 16 16">
                                        <path d="M3.654 1.328a.678.678 0 0 0-1.015-.063L1.605 2.3c-.483.484-.661 1.169-.45 1.77a17.568 17.568 0 0 0 4.168 6.608 17.569 17.569 0 0 0 6.608 4.168c.601.211 1.286.033 1.77-.45l1.034-1.034a.678.678 0 0 0-.063-1.015l-2.307-1.794a.678.678 0 0 0-.58-.122l-2.19.547a1.745 1.745 0 0 1-1.657-.459L5.482 8.062a1.745 1.745 0 0 1-.46-1.657l.548-2.19a.678.678 0 0 0-.122-.58L3.654 1.328zM1.884.511a1.745 1.745 0 0 1 2.612.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.678.678 0 0 0 .178.643l2.457 2.457a.678.678 0 0 0 .644.178l2.189-.547a1.745 1.745 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.634 18.634 0 0 1-7.01-4.42 18.634 18.634 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877L1.885.511z"/>
                                        </svg>
                                    </i>
                                    <span> (028) 7300 5588</span>
                                </div>                   
                            </div>
                        </div>
                    </div> 
                    <div class="gg-map col-md-8" style="margin-top: -20px">
                        <p><iframe class="map-location" width="500" height="450" style="border:0" loading="lazy" allowfullscreen
                                   src="https://www.google.com/maps/embed/v1/place?q=place_id:ChIJsQdrFzEndTERXq6bN0uyUrc&key=AIzaSyB84c9iamGOYG9vTsHkmBLGhjaKBlRIzTI">
                            </iframe></p>            
                    </div>
                </div>            
            </div>       
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
                            <div><a href="./index.jsp">Trang chủ</a></div>
                            <div><a href="./project.jsp">Đồ án tốt nghiệp</a></div>
                            <div><a href="./blog-single.html">Bài viết</a></div>
                        </div>
                        <div class="footer-content-detail col-md-2">
                            <span>Tính Năng</span>
                            <div><a href="">Đăng Ký</a></div>
                            <div><a href="">Đăng Nhập</a></div>
                            <div><a href="">Gửi Bài Viết</a></div>
                            <div><a href="./contact.jsp">Liên hệ</a></div>
                        </div>
                        <div class="col-md-4">
                            <span>Theo Dõi Trường Đại Học FPT Tại: </span>
                            <div class="follow-social">
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
                </div>
                <div class="footer-end container-fluid">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-8">
                                <p>Trường Đại học FPT Phân hiệu Thành phố Hồ Chí Minh</p>
                            </div>
                            <div class="col-md-4">
                                <p class="footer-copyright">Developed By Team 1 <i class="far fa-copyright"></i> 2022</a></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js" integrity="sha512-XtmMtDEcNz2j7ekrtHvOVR4iwwaD6o/FUJe6+Zq+HgcCsk3kj4uSQQR8weQ2QVj1o0Pk6PwYLohm206ZzNfubg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
        <script src="./assets/js/slide.js"></script>    
        <script src="./assets/js/app.js"></script>
    </body>
</html>
