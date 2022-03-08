<%@page import="com.fucapstoneresult.models.InstructorDTO"%>
<%@page import="com.fucapstoneresult.dao.InstructorDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.fucapstoneresult.models.ProjectInstructorDTO"%>
<%@page import="com.fucapstoneresult.dao.ProjectInstructorDAO"%>
<%@page import="com.fucapstoneresult.models.ProjectDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.fucapstoneresult.dao.ProjectDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>FPT Capstone Project Result </title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.css"
              integrity="sha512-yHknP1/AwR+yx26cB1y0cjvQUMvEa2PFzt1c9LlS4pRQ5NOTZFWbhBig+X9G9eYW/8m0/4OXNx8pxJ6z57x0dw=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick-theme.min.css"
              integrity="sha512-17EgCFERpgZKcm0j0fEq1YCJuyAWdz9KUtv1EjVuaOz8pDnh/0nZxmU6BBXwaaxqoi9PQXnRWqlcDB027hgv9A=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
              integrity="sha512-Fo3rlrZj/k7ujTnHg4CGR2D7kSs0v4LLanw2qksYuRlEzO+tcaEPQogQ0KaoGN26/zrn20ImR1DfuLWnOo7aBA=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="./assets/css/slide.css">
        <link rel="stylesheet" href="./assets/css/styles.css">
        <link rel="stylesheet" href="./assets/css/responsive.css">
        <link rel="stylesheet" href="./assets/css/view-instructor.css">

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

    <body>
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
                                        <a href="">Lô E2a-7, Đường D1, Khu Công nghệ cao, P.Long Thạnh Mỹ, Tp. Thủ Đức,
                                            TP.HCM.</a>
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

                <br>
                <br>
                <br>
                <br>
                <br>

                <section>
                    <div class="row">
                        <div class="col-md-2 list-instructor">

                            <h4>Danh Sách Giảng Viên</h4>
                            <div>
                                <ul>
                                    <%
                                        InstructorDAO daoIns = new InstructorDAO();
                                        List<InstructorDTO> listInstructor = new ArrayList<>();
                                        listInstructor = daoIns.getAllInstructor();
                                        request.setAttribute("INSTRUCTOR_LIST", listInstructor);
                                    %>
                                    <c:forEach items="${requestScope.INSTRUCTOR_LIST}" var="i">
                                        <li>
                                            <form action="MainController" method="GET">
                                                <input name="instructor-id" value="${i.instructorID}" type="hidden">
                                                <button name="action" type="submit" value="ChooseInstructor">${i.instructorName}</button>
                                            </form>
                                        </li>
                                    </c:forEach>


                                </ul>

                            </div>
                        </div>
                        <div class="col-md-7 instructor-content ">
                            <div class="row">
                                <div class="col-md-5">
                                    <img class="instructor-img"
                                         src="${requestScope.INS.instructorImage}"
                                         alt="">
                                    <h1>${requestScope.INS.instructorName}</h1>
                                </div>
                                <div class="col-md-7 description-content">
                                    <p class="instructor-description">
                                        ${requestScope.INS.instructorName}
                                    </p>
                                </div>
                            </div>
                            <br>
                            <br>
                            <div class="instructor-project">
                                <h2>Đồ Án Hướng Dẫn</h2>

                                <div id="do-an-noi-bat" class="content-good">
                                    <div class="container">
                                        <div class="capstone-slider">
                                            <div class="good-capstone-slide">
                                                <% ProjectDAO dao = new ProjectDAO();
                                                    ProjectInstructorDAO proinsDao = new ProjectInstructorDAO();
                                                    InstructorDTO ins = new InstructorDTO();
                                                    ins = (InstructorDTO) request.getAttribute("INS");
                                                    List<String> projectIDList
                                                            = proinsDao.getAllProjectByInstructorID(ins.getInstructorID());
                                                    List<ProjectDTO> projectList = new ArrayList<>();
                                                    for (String proID : projectIDList) {
                                                        ProjectDTO pro = dao.getProject(proID);
                                                        projectList.add(pro);
                                                    }
                                                    request.setAttribute("PROJECT_LIST", projectList);
                                                %>
                                                <c:forEach items="${requestScope.PROJECT_LIST}" var="o">
                                                    <div class="good-capstone">
                                                        <img src="${o.projectImage}" alt="">
                                                        <div class="good-capstone-text">
                                                            <h3>
                                                                <a
                                                                    href="MainController?action=DetailProject&id=${o.projectID}">${o.projectName}</a>
                                                            </h3>
                                                            <p>${o.projectDescription}</p>
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
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="recent-post top-project">
                                <h3>Đồ Án Nổi Bật</h3>
                                <div class="devider"></div>
                                <div class="post-list">
                                    <div class="post-list__item">
                                        <img src="http://on3-step.com/tf/homekins/html/white/assets/img/blog/cover_bg_3.jpg"
                                             alt="">
                                        <h1>Đồ án 1</h1>
                                        <span>Spring 2022</span>
                                    </div>
                                    <div class="post-list__item">
                                        <img src="http://on3-step.com/tf/homekins/html/white/assets/img/blog/cover_bg_3.jpg"
                                             alt="">
                                        <h1>Đồ án 2</h1>
                                        <span>Summer 2019</span>
                                    </div>
                                    <div class="post-list__item">
                                        <img src="http://on3-step.com/tf/homekins/html/white/assets/img/blog/cover_bg_3.jpg"
                                             alt="">
                                        <h1>Đồ án 3</h1>
                                        <span>Fall 2020</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <br>
                    <br>
                    <br>

                </section>

                <br>
                <br>
                <br>
                <br>
                <br>
                <br>


                <div class="footer">
                    <div class="container">
                        <div class="footer-content row">
                            <div class="footer-content-first col-md-4">
                                <h3>Về Đại Học FPT</h3>
                                <p>Đại học FPT hướng tới xây dựng mô hình của một trường Đại học thế hệ mới; gắn liền đào
                                    tạo với thực tiễn cuộc sống và nhu cầu nhân lực của đất nước, góp phần đưa Giáo dục Việt
                                    Nam tiến tới ngang tầm các nước trên thế giới.</p>
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
                                <p>Cung cấp năng lực cạnh tranh toàn cầu cho đông đảo người học, góp phần mở mang bờ cõi trí
                                    tuệ đất nước</p>
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
        <div class="overlay-page" id="overlay-page"></div>
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

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
                integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"
                integrity="sha512-XtmMtDEcNz2j7ekrtHvOVR4iwwaD6o/FUJe6+Zq+HgcCsk3kj4uSQQR8weQ2QVj1o0Pk6PwYLohm206ZzNfubg=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
        <script src="./assets/js/slide.js"></script>
        <script src="./assets/js/app.js"></script>
    </body>

</html>