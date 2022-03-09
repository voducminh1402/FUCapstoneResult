<%-- 
    Document   : _Header-part
    Created on : Mar 9, 2022, 10:21:24 AM
    Author     : VODUCMINH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                        <a href="projects.html">Top Các Đồ Án Xuất Sắc</a>
                    </li>
                    <li>
                        <a href="./project-major.html">Sự Kiện Diễn Ra Sắp Tới</a>
                    </li>
                    <li>
                        <a href="./po-view-post.jsp">Nội dung của bạn</a>
                    </li>
                    <li>
                        <a href="./contact.html">Liên hệ</a>
                    </li>
                    <li>
                        <c:if test="${sessionScope.USER eq null}">
                            <a href="./login.html">Đăng nhập</a>
                        </c:if>
                        <c:if test="${sessionScope.USER ne null}">
                            <a style="color: var(--main-orange); text-transform: uppercase"><button style="text-transform: uppercase">Đăng xuất</button></a>
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