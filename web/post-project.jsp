<%-- 
    Document   : post-project
    Created on : Feb 7, 2022, 8:52:47 AM
    Author     : VODUCMINH
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Project Post</title>
        <!-- Required meta tags -->
        <meta charset="utf-8" />
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1, shrink-to-fit=no"
            />
        <!-- Bootstrap CSS v5.0.2 -->
        <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
            integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
            crossorigin="anonymous"
            />
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
            integrity="sha512-Fo3rlrZj/k7ujTnHg4CGR2D7kSs0v4LLanw2qksYuRlEzO+tcaEPQogQ0KaoGN26/zrn20ImR1DfuLWnOo7aBA=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
            />
        <link rel="stylesheet" href="./assets/css/post-project.css" />
        <link rel="stylesheet" href="./assets/css/styles.css">

        
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

                <div class="container">

                    <div class="main__content row gx-5">
                        <div class="route">
                            <span>
                                <a href="index.jsp"><i class="fas fa-home"></i> Trang chủ</a>
                            </span> <i class="fas fa-angle-right"></i> <span>Đồ án tốt nghiệp</span>
                        </div>
                        <div class="col-lg-8">

                            <div class="content">
                                <!-- <img
                                  src="./assets/images/image-product-1.jpg"
                                  alt="product picture"
                                  class="main-picture"
                                /> -->
                                <c:if test="${requestScope.POST == null}">
                                    <c:redirect url="MainController?action=DetailProject&id=${requestScope.POST_ID}"></c:redirect>
                                </c:if>
                                <div class="main-picture" style="background-image: url(${requestScope.POST.postImage})"></div>
                                <h1 class="name-project">${requestScope.POST.postTitle}</h1>
                                <div class="project-info">
                                    <div class="author">
                                        <i class="far fa-user"></i>
                                        <span>${requestScope.POST.postAuthor}</span>
                                    </div>
                                    <div class="date-publish">
                                        <i class="far fa-calendar-alt"></i>
                                        <span>${requestScope.POST.postDate}</span>
                                    </div>
                                    <div class="number-comment">
                                        <i class="far fa-comment-alt"></i>
                                        <span>${requestScope.COUNT_CMT} Bình luận</span>
                                    </div>

                                    <div class="vote">
                                        <span id="vote-numbers">0</span>

                                        <button type="submit" id="vote">
                                            <i class="fas fa-caret-up"></i>
                                        </button>

                                        <button type="submit" id="un-vote">
                                            <i class="fas fa-caret-down"></i>
                                        </button>
                                    </div>
                                </div>
                                <p>
                                    ${requestScope.POST.postContent}
                                </p>
                                <input id="post-id" type="hidden" value="${requestScope.POST.postID}"/>
                            </div>
                            <div class="comment">
                                <h5>${requestScope.COUNT_CMT} Bình luận</h5>

                                <div id="comment-area" class="comment-area">
                                    <c:forEach items="${requestScope.COMMENTS}" var="o">
                                        <div class="comment-info">
                                            <div class="comment-info__user-picture">
                                                <img
                                                    src="./assets/images/image-product-1.jpg"
                                                    alt="user picture"
                                                    />
                                            </div>
                                            <div class="comment-info__content">
                                                <div class="content-header">
                                                    <h6 class="user-name">Vo Duc Minh</h6>
                                                    <span> ${o.commentTime} </span>
                                                </div>
                                                <p>
                                                    ${o.commentDetail}
                                                </p>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>


                            </div>
                            <div class="leave-comment">
                                <h5>Để lại Bình luận</h5>
                                <form action="MainController">
                                    <input type="hidden" name="id" value="${requestScope.POST.postID}">
                                    <textarea
                                        name="input-comment"
                                        id="comment"
                                        cols="30"
                                        rows="3"
                                        ></textarea
                                    ><br />
                                    <input id="submit" type="button" value="Gửi" name="action" />
                                </form>
                            </div>
                        </div>
                        <div class="col-lg-4">'
                            
                            <div class="search">
                                <form action="MainController">
                                    <input
                                        type="text"
                                        name="searchValue"
                                        id="search"
                                        placeholder="Tìm kiếm..."
                                        />
                                    <i class="fas fa-search">
                                    </i>
                                    <button name="action" value="Search" style="display: none" type="submit"></button>
                                </form>
                            </div>
                            <div class="recent-post left-col">
                                <h3>Các bài viết liên quan</h3>
                                <div class="line-break"></div>
                                <div class="post-list">
                                    <c:forEach items="${requestScope.TOP_POST}" var="o">
                                        <div class="post-list__item single-blog-top-post">
                                            <img src="${o.postImage}"
                                                 alt="">
                                            <h3>
                                                <c:if test="${o.isMainPost eq null}">
                                                    <a href="MainController?action=viewPoPost&id=${o.postID}">${o.postTitle}</a>
                                                </c:if>
                                                <c:if test="${o.isMainPost ne null}">
                                                    <a href="MainController?action=DetailProject&id=${o.projectID}">${o.postTitle}</a>
                                                </c:if>    
                                            </h3>
                                            <span>${o.postDate}</span>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                            <div class="team-members left-col">
                                <h3>Các thành viên của nhóm</h3>
                                <div class="line-break"></div>
                                <ul>
                                    <c:forEach items="${requestScope.TEAM}" var="o">
                                        <li>
                                            <img
                                                src="${o.studentImage}"
                                                alt="team member image"
                                                />
                                            <p>${o.studentName}</p>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>
                            <div class="instructor left-col">
                                <h3>Giảng viên hướng dẫn</h3>
                                <div class="line-break"></div>
                                <div class="instructor-all">
                                        <div class="instructor-info">
                                            <img
                                                src="${requestScope.INSTRUCTOR.instructorImage}"
                                                alt="instructor image"
                                                />
                                            <div class="intructor-name">${requestScope.INSTRUCTOR.instructorName}</div>
                                        </div>
                                </div>
                            </div>
                            <div class="tags left-col">
                                <h3>Tags</h3>
                                <div class="line-break"></div>
                                <ul>
                                    <c:forEach items="${requestScope.TAGS}" var="o">
                                        <li><a href="MainController?action=FilterPostsByTag&tag=${o.tagDetailName}">${o.tagDetailName}</a></li>
                                        </c:forEach>
                                </ul>
                            </div>

                            <div class="about-us left-col">
                                <h3>Về chúng tôi</h3>
                                <div class="line-break"></div>
                                <p>
                                    Lorem ipsum dolor sit, amet consectetur adipisicing elit. Impedit
                                    ullam eos numquam ex nesciunt ut enim nihil rerum ipsa id sequi
                                    excepturi, odio ipsam voluptate. Optio, ullam illum. Magnam,
                                    consectetur.
                                </p>
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
        <!-- Bootstrap JavaScript Libraries -->
        <script
            src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
            integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
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
        <script src="./assets/js/post-project.js"></script>
        <script src="./assets/js/app.js"></script>
        <script>
            const submit = document.getElementById("submit");
            const inputComment = document.getElementById("comment");
            const post = document.getElementById("post-id");

            submit.addEventListener("click", () => {
                let input = inputComment.value;
                let postId = post.value;
                console.log("A");

                $.ajax({
                    type: "POST",
                    url: "MainController?action=CommentPost&input-comment=" + input + "&id=" + postId,
                    data: input,
                    dataType: "text",
                    success: function (response) {
                        if (response.length > 1) {
                            console.log(response);
                        } else {
                            console.log("fail");
                        }
                    },
                });
            });
        </script>
    
                
                </body>
</html>