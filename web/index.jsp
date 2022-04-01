<%-- 
    Document   : index
    Created on : Feb 7, 2022, 12:34:09 AM
    Author     : VODUCMINH
--%>
<%@page import="com.fucapstoneresult.dao.PostsDAO"%>
<%@page import="com.fucapstoneresult.models.PostsDTO"%>
<%@page import="com.fucapstoneresult.models.InstructorDTO"%>
<%@page import="com.fucapstoneresult.dao.InstructorDAO"%>
<%@page import="com.fucapstoneresult.dao.MajorDAO"%>
<%@page import="com.fucapstoneresult.models.SemesterDTO"%>
<%@page import="com.fucapstoneresult.dao.SemesterDAO"%>
<%@page import="com.fucapstoneresult.models.ProjectDTO"%>
<%@page import="com.fucapstoneresult.dao.ProjectDAO"%>
<%@page import="java.util.List"%>
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
    </head>

    <body>
        <div id="top" class="home-page-wrapper">
            <div class="container-fluid">
                <div class="header-all">
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
                                            <a href="./contact.html">Liên hệ</a>
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
                    <div class="background-part">
                        <div id="wrapper">
                            <section class="slideshow" id="js-header">
                                <div class="slideshow__slide js-slider-home-slide is-current" data-slide="1">
                                    <div class="slideshow__slide-background-parallax background-absolute js-parallax" data-speed="-1" data-position="top" data-target="#js-header">
                                        <div class="slideshow__slide-background-load-wrap background-absolute">
                                            <div class="slideshow__slide-background-load background-absolute">
                                                <div class="slideshow__slide-background-wrap background-absolute">
                                                    <div class="slideshow__slide-background background-absolute">
                                                        <div class="slideshow__slide-image-wrap background-absolute">
                                                            <div class="slideshow__slide-image background-absolute" style="background-image: url('https://vcdn-vnexpress.vnecdn.net/2021/01/13/anh-3-bai-10-do-an-9-2020-1600-2156-6284-1610510043.jpg')"></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="slideshow__slide-caption">
                                        <div class="slideshow__slide-caption-text">
                                            <div class="container js-parallax" data-speed="2" data-position="top" data-target="#js-header">
                                                <h1 class="slideshow__slide-caption-title">Sinh Viên Đại Học FPT Phát Triển Ví Điện Tử</h1>
                                                <a class="slideshow__slide-caption-subtitle -load o-hsub -link" href="#">
                                                    <span class="slideshow__slide-caption-subtitle-label">Team 1</span>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="slideshow__slide js-slider-home-slide is-next" data-slide="2">
                                    <div class="slideshow__slide-background-parallax background-absolute js-parallax" data-speed="-1" data-position="top" data-target="#js-header">
                                        <div class="slideshow__slide-background-load-wrap background-absolute">
                                            <div class="slideshow__slide-background-load background-absolute">
                                                <div class="slideshow__slide-background-wrap background-absolute">
                                                    <div class="slideshow__slide-background background-absolute">
                                                        <div class="slideshow__slide-image-wrap background-absolute">
                                                            <div class="slideshow__slide-image background-absolute" style="background-image: url('https://hcmuni.fpt.edu.vn/Data/Sites/1/News/4740/capstone.jpg');"></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="slideshow__slide-caption">
                                        <div class="slideshow__slide-caption-text">
                                            <div class="container js-parallax" data-speed="2" data-position="top" data-target="#js-header">
                                                <h1 class="slideshow__slide-caption-title">Chuỗi Seminar Capstone Companion</h1>
                                                <a class="slideshow__slide-caption-subtitle -load o-hsub -link" href="#">
                                                    <span class="slideshow__slide-caption-subtitle-label">Tìm Hiểu Thêm</span>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="slideshow__slide js-slider-home-slide is-prev" data-slide="3">
                                    <div class="slideshow__slide-background-parallax background-absolute js-parallax" data-speed="-1" data-position="top" data-target="#js-header">
                                        <div class="slideshow__slide-background-load-wrap background-absolute">
                                            <div class="slideshow__slide-background-load background-absolute">
                                                <div class="slideshow__slide-background-wrap background-absolute">
                                                    <div class="slideshow__slide-background background-absolute">
                                                        <div class="slideshow__slide-image-wrap background-absolute">
                                                            <div class="slideshow__slide-image background-absolute" style="background-image: url('https://hcmuni.fpt.edu.vn/Data/Sites/1/media/zz2020file/dhfptbaovedoan111.jpg');"></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="slideshow__slide-caption">
                                        <div class="slideshow__slide-caption-text">
                                            <div class="container js-parallax" data-speed="2" data-position="top" data-target="#js-header">
                                                <h1 class="slideshow__slide-caption-title">Kỳ Summer 2020, sinh viên ĐH FPT được bảo vệ đồ án giữa hội trường lớn</h1>
                                                <a class="slideshow__slide-caption-subtitle -load o-hsub -link" href="#">
                                                    <span class="slideshow__slide-caption-subtitle-label">Tìm Hiểu Thêm</span>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="c-header-home_footer">
                                    <div class="o-container">
                                        <div class="c-header-home_controls -nomobile o-button-group">
                                            <div class="js-parallax is-inview" data-speed="1" data-position="top" data-target="#js-header">
                                                <button class="o-button -white -square -left js-slider-home-button js-slider-home-prev" type="button">
                                                    <span class="o-button_label">
                                                        <svg class="o-button_icon" role="img"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#arrow-prev"></use></svg>
                                                    </span>
                                                </button>
                                                <button class="o-button -white -square js-slider-home-button js-slider-home-next" type="button">
                                                    <span class="o-button_label">
                                                        <svg class="o-button_icon" role="img"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#arrow-next"></use></svg>
                                                    </span>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div>

                                    <svg xmlns="http://www.w3.org/2000/svg">
                                    <symbol viewBox="0 0 18 18" id="arrow-next">
                                        <path id="arrow-next-arrow.svg" d="M12.6,9L4,17.3L4.7,18l8.5-8.3l0,0L14,9l0,0l-0.7-0.7l0,0L4.7,0L4,0.7L12.6,9z"/>
                                    </symbol>
                                    <symbol viewBox="0 0 18 18" id="arrow-prev">
                                        <path id="arrow-prev-arrow.svg" d="M14,0.7L13.3,0L4.7,8.3l0,0L4,9l0,0l0.7,0.7l0,0l8.5,8.3l0.7-0.7L5.4,9L14,0.7z"/>
                                    </symbol>
                                    </svg>
                            </section>
                        </div>
                    </div>
                </div>
                <div class="content">
                    <div id="do-an-tot-nghiep" class="content-intro">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="content-intro-img">
                                        <img src="https://i.chungta.vn/2020/02/17/1-1581877487_860x0.jpg" alt="Dai hoc FPT Ho Chi Minh">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="content-intro-text mt-5">
                                        <h2>Đồ Án Tốt Nghiệp Là Gì?</h2>
                                        <p>Với sứ mệnh “Cung cấp năng lực cạnh tranh toàn cầu cho đông đảo người học, góp phần mở mang bờ cõi trí tuệ đất nước”, triết lý giáo dục “Giáo dục đào tạo là tổ chức và quản trị việc tự học của người học”, Đại học FPT hướng tới xây dựng mô hình của một trường Đại học thế hệ mới; gắn liền đào tạo với thực tiễn cuộc sống và nhu cầu nhân lực của đất nước, góp phần đưa Giáo dục Việt Nam tiến tới ngang tầm các nước trên thế giới.</p>
                                        <ul>
                                            <li><i class="fas fa-chevron-right"></i>Khẳng định năng lực sinh viên</li>
                                            <li><i class="fas fa-chevron-right"></i>Gắn liền với thực tiễn</li>
                                            <li><i class="fas fa-chevron-right"></i>Những giải pháp đột phá trong công nghệ</li>
                                            <li><i class="fas fa-chevron-right"></i>Minh chứng cho chất lượng dạy và học</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="do-an-noi-bat" class="content-good">
                        <div class="container">
                            <h2>Đồ Án Nổi Bật</h2>
                            <div class="capstone-slider">
                                <div class="good-capstone-slide">
                                    <%
                                        ProjectDAO projectDao = new ProjectDAO();
                                        List<ProjectDTO> projectList = projectDao.getTop10Project();
                                        request.setAttribute("PROJECT_LIST", projectList);
                                    %>
                                    <c:forEach items="${requestScope.PROJECT_LIST}" var="o">
                                        <div class="good-capstone">
                                            <img src="${o.projectImage}" alt="">
                                            <div class="good-capstone-text good-capstone-index">
                                                <h3>
                                                    <a href="MainController?action=DetailProject&id=${o.projectID}">${o.projectName}</a>
                                                </h3>
    <!--                                            <p>${o.projectDescription}</p>-->
                                            </div>
                                            <div class="good-capstone-overlay">
                                            </div>
                                        </div>
                                    </c:forEach>
                                    <button type="button" class="slick-prev">Previous</button>
                                    <button type="button" class="slick-next">Next</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="content-company">
                        <div class="container-fluid">
                            <div class="company">
                                <div class="company-detail">
                                    <img src="./assets/images/company/FPT_Software_Logo-removebg-preview.png" alt="">
                                </div>
                                <div class="company-detail">
                                    <img src="./assets/images/company/9d8ed5_a00501b84f6c4bdf84170a87e873b56b_mv2.png" alt="">
                                </div>
                                <div class="company-detail">
                                    <img src="./assets/images/company/588-5882827_kms-technology-logo-png-png-download-kms-technology-removebg-preview.png" alt="">
                                </div>
                                <div class="company-detail">
                                    <img src="./assets/images/company/logo-emblem-robert-bosch-gmbh-brand-trademark-png-favpng-jMTfHxbaMQEuus126KjucucKT-removebg-preview.png" alt="">
                                </div>
                                <div class="company-detail">
                                    <img src="./assets/images/company/kisspng-samsung-galaxy-s9-samsung-electronics-logo-samsung-samsung-logo-5b4be94fd08255.9863084115317015838541-removebg-preview.png" alt="">
                                </div>
                            </div>
                        </div>
                    </div>
                    <%
                        SemesterDAO semesterDao = new SemesterDAO();
                        MajorDAO majorDao = new MajorDAO();
                        List<ProjectDTO> nearestList = projectDao.getNearestProject();
                        String semesterName = semesterDao.getSemester(projectDao.getNearestProjectElement().getSemesterID()).getSemesterName();
                        request.setAttribute("NEAREST_LIST", nearestList);
                        request.setAttribute("NEAREST_LIST_SIZE", nearestList.size());
                    %>
                    <c:if test="${requestScope.NEAREST_LIST_SIZE == 4}">
                        <div id="do-an-hoc-ky" class="content-near-project">
                            <div class="container-fluid">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <h2>Đồ Án Học Kỳ <%= semesterName%></h2>
                                        </div>
                                    </div>
                                </div>
                                <div class=" row content-near-project__wrapper">
                                    <c:forEach items="${requestScope.NEAREST_LIST}" var="o">
                                        <div class="project-detail no-pd col-md-3" >
                                            <a href="MainController?action=DetailProject&id=${o.projectID}">
                                                <div class="project-content project-content-major">
                                                    <div class="project-content-overlay">
                                                        <img class="project-content-img project-content-major-img" src="https://www.fpt-software.com/wp-content/uploads/sites/2/2019/09/RPA-for-logistics.jpg" alt="">
                                                        <div class="project-content-text" style="margin-left: 30px;">
                                                            ${pageContext.setAttribute("majorID", o.majorID)}
                                                            <span><%= majorDao.getMajor(pageContext.getAttribute("majorID").toString()).getMajorName()%></span>
                                                            <h3>${o.projectName}</h3>
                                                            <span>View Project</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </c:if>

                    <div id="giang-vien-huong-dan" class="content-lecturer content-good">
                        <div class="container">
                            <h2>Giảng Viên Hướng Dẫn</h2>
                            <div class="capstone-slider">
                                <div class="lecturer-slide good-capstone-slide">
                                    <%
                                        InstructorDAO insDao = new InstructorDAO();
                                        List<InstructorDTO> ins = insDao.getAllInstructor();
                                        request.setAttribute("INS_LIST", ins);
                                    %>
                                    <c:forEach items="${requestScope.INS_LIST}" var="o">
                                        <div class="lecturer good-capstone">
                                            <img style="width: 100%" src="${o.instructorImage}" alt="">
                                            <div class="lecturer-info">
                                                <h3>
                                                    <a style="color: white" href="MainController?action=InstructorDetail&id=${o.instructorID}">${o.instructorName}</a>
                                                </h3>
                                                <span>Giảng Viên Khối Ngành SE</span>
                                            </div>
                                            <div class="lecturer-overlay good-capstone-overlay">
                                            </div>
                                        </div>
                                    </c:forEach>
                                    <button type="button" class="slick-prev">Previous</button>
                                    <button type="button" class="slick-next">Next</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="timeline" class="content-timeline">
                        <div class="container">
                            <h2>Dự Kiến Timeline Đồ Án Học Kì Summer 2022</h2>
                            <div class="row">
                                <div class="timeline-background col-md-12">
                                    <div class="timeline">
                                        <span class="time">13/01/2022</span>
                                        <span class="title">Đồ Án Xây Dựng Website Thành Quả Capstone Project</span>
                                        <span class="team">Nhóm 1</span>
                                    </div>
                                    <div class="timeline">
                                        <span class="time">13/01/2022</span>
                                        <span class="title">Đồ Án Xây Dựng Website Thành Quả Capstone Project</span>
                                        <span class="team">Nhóm 1</span>
                                    </div>
                                    <div class="timeline">
                                        <span class="time">13/01/2022</span>
                                        <span class="title">Đồ Án Xây Dựng Website Thành Quả Capstone Project</span>
                                        <span class="team">Nhóm 1</span>
                                    </div>
                                    <div class="timeline">
                                        <span class="time">13/01/2022</span>
                                        <span class="title">Đồ Án Xây Dựng Website Thành Quả Capstone Project</span>
                                        <span class="team">Nhóm 1</span>
                                    </div>
                                    <div class="timeline">
                                        <span class="time">13/01/2022</span>
                                        <span class="title">Đồ Án Xây Dựng Website Thành Quả Capstone Project</span>
                                        <span class="team">Nhóm 1</span>
                                    </div>
                                    <div class="timeline">
                                        <span class="time">13/01/2022</span>
                                        <span class="title">Đồ Án Xây Dựng Website Thành Quả Capstone Project</span>
                                        <span class="team">Nhóm 1</span>
                                    </div>
                                    <div class="timeline">
                                        <span class="time">13/01/2022</span>
                                        <span class="title">Đồ Án Xây Dựng Website Thành Quả Capstone Project</span>
                                        <span class="team">Nhóm 1</span>
                                    </div>
                                    <div class="timeline">
                                        <span class="time">13/01/2022</span>
                                        <span class="title">Đồ Án Xây Dựng Website Thành Quả Capstone Project</span>
                                        <span class="team">Nhóm 1</span>
                                    </div>
                                    <div class="timeline-background-overlay">
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div id="bai-viet-gan-day" class="content-post">
                        <div class="content-good">
                            <div class="container">
                                <h2>Bài Đăng Nổi Bật Gần Đây</h2>
                                <div class="capstone-slider">
                                    <div class="good-capstone-slide">
                                        <%
                                            PostsDAO postDao = new PostsDAO();
                                            List<PostsDTO> postNear = postDao.getListPostByUpvote();
                                            request.setAttribute("POST_NEAR", postNear);
                                        %>
                                        <c:forEach items="${requestScope.POST_NEAR}" var="o">
                                            <div class="project-detail col-md-3" >
                                                <div class="project-content project-content-major">
                                                    <div class="project-content-overlay">
                                                        <img class="project-content-img project-content-major-img" src="${o.postImage}" alt="">
                                                        <div class="project-content-text" style="margin-left: 30px;">
                                                            <span>Software Engineering</span>
                                                            <h3>
                                                                <a href="MainController?action=viewPoPost&id=${o.postID}">${o.postTitle}</a>
                                                            </h3>
                                                            <span>View Project</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>

                                        <button type="button" class="slick-prev">Previous</button>
                                        <button type="button" class="slick-next">Next</button>
                                    </div>
                                </div>
                            </div>
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
                                <div><a href="./contact.html">Liên hệ</a></div>
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
            </div>
        </div>    
        <div class="overlay-page" id="overlay-page"></div>
        <div class="scroll-page">
            <div class="scroll-items">
                <a href="#do-an-tot-nghiep">Đồ Án Tốt Nghiệp Là Gì?</a>
                <span>
                    <a href="#do-an-tot-nghiep"><i class="fas fa-circle"></i></a>
                </span>
            </div>
            <div class="scroll-items">
                <a href="#do-an-noi-bat">Đồ Án Nổi Bật</a>
                <span>
                    <a href="#do-an-noi-bat"><i class="fas fa-circle"></i></a>
                </span>
            </div>
            <div class="scroll-items">
                <a href="#do-an-hoc-ky">Đồ Án Học Kỳ Spring 2022</a>
                <span>
                    <a href="#do-an-hoc-ky"><i class="fas fa-circle"></i></a>
                </span>
            </div>
            <div class="scroll-items">
                <a href="#giang-vien-huong-dan">Giảng Viên Hướng Dẫn</a>
                <span>
                    <a href="#giang-vien-huong-dan"><i class="fas fa-circle"></i></a>
                </span>
            </div>
            <div class="scroll-items">
                <a href="#timeline">Timeline Đồ Án Học Kỳ Summer 2022</a>
                <span>
                    <a href="#timeline"><i class="fas fa-circle"></i></a>
                </span>
            </div>
            <div class="scroll-items">
                <a href="#bai-viet-gan-day">Bài Đăng Nổi Bật Gần Đây</a>
                <span>
                    <a href="#bai-viet-gan-day"><i class="fas fa-circle"></i></a>
                </span>
            </div>
        </div>
        <div onselectstart="return false;" oncopy="return false" oncut="return false" onpaste="return false" id="event-btn" class="event-btn">
            Đóng
        </div>

        <div class="event-content-wrap">
            <div id="event-content" class="event-content">
                <div class="event-content-overlay">
                    <div class="box event-content-list">
                        <ul id="first-list">
                            <li>
                                <span></span>
                                <div class="title">comment #01</div>
                                <div class="info">the best animation , the best toturials you would ever see .</div>
                                <div class="name">- dr. mohamed -</div>
                                <div class="time">
                                    <span>JUN, 17<sup>th</sup></span>
                                    <span>12:00 AM</span>
                                </div>
                            </li>
                            <li>
                                <span></span>
                                <div class="title">summery #01</div>
                                <div class="info">the best animation , the best toturials you would ever see here only . you can learn how to animate and how to use SVG . even else you can add your own animations .</div>
                                <div class="name">- eng. amr -</div>
                                <div class="time">
                                    <span>JUN, 29<sup>th</sup></span>
                                    <span>11:36 AM</span>
                                </div>
                            </li>
                            <li>
                                <span></span>
                                <div class="title">comment #02</div>
                                <div class="info">the best animation , the best toturials you would ever see . what about canvas ?? do you like it ..</div>
                                <div class="name">- dr. ahmed -</div>
                                <div class="time">
                                    <span>FEB, 2<sup>nd</sup></span>
                                    <span>02:00 PM</span>
                                </div>
                            </li>
                            <li>
                                <span></span>
                                <div class="title">comment #02</div>
                                <div class="info">the best animation , the best toturials you would ever see . what about canvas ?? do you like it ..</div>
                                <div class="name">- dr. ahmed -</div>
                                <div class="time">
                                    <span>FEB, 2<sup>nd</sup></span>
                                    <span>02:00 PM</span>
                                </div>
                            </li>
                            <li>
                                <span></span>
                                <div class="title">comment #02</div>
                                <div class="info">the best animation , the best toturials you would ever see . what about canvas ?? do you like it ..</div>
                                <div class="name">- dr. ahmed -</div>
                                <div class="time">
                                    <span>FEB, 2<sup>nd</sup></span>
                                    <span>02:00 PM</span>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="event-content-text">
                    <h2>THỜI GIAN DỰ KIẾN BẢO VỆ ĐỒ ÁN TỐT NGHIỆP KỲ SPRING 2022</h2>
                </div>
            </div>
        </div>
        <div id="loader" class="loader">
            <div class="loading">
                <div class="loading__letter">Đ</div>
                <div class="loading__letter">ạ</div>
                <div class="loading__letter">i</div>
                <div class="loading__letter">h</div>
                <div class="loading__letter">ọ</div>
                <div class="loading__letter">c</div>
                <div class="loading__letter">F</div>
                <div class="loading__letter">P</div>
                <div class="loading__letter">T</div>
                <div class="loading__letter">.</div>
                <div class="loading__letter">.</div>
                <div class="loading__letter">.</div>
            </div>
        </div>
        <a href="#top" class="back-top"></a>


        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js" integrity="sha512-XtmMtDEcNz2j7ekrtHvOVR4iwwaD6o/FUJe6+Zq+HgcCsk3kj4uSQQR8weQ2QVj1o0Pk6PwYLohm206ZzNfubg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
        <script src="./assets/js/slide.js"></script>    
        <script src="./assets/js/app.js"></script>


    </body>

</html>
