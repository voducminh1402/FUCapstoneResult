<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>FPT Capstone Project Result </title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="./assets/css/post-project.css" />
        <link rel="stylesheet" href="./assets/css/styles.css">
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
            integrity="sha512-Fo3rlrZj/k7ujTnHg4CGR2D7kSs0v4LLanw2qksYuRlEzO+tcaEPQogQ0KaoGN26/zrn20ImR1DfuLWnOo7aBA=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
            />
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

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
        <section class="blog-single">
            <div class="container container-fluid">
                <div class="route tip-row" style="padding-left: 80px; padding-top: 50px">
                    <span>
                        <a href="index.jsp"><i class="fas fa-home"></i> Trang chủ</a>
                    </span> <i class="fas fa-angle-right"></i> <span>Bài đăng chi tiết</span>
                </div>
                <div class="tip-row col-12" style=" padding-top: 20px; padding-left: 80px">
                    <div class="devider" style="width: 100%; margin-bottom: 10px"></div>
                    <h2 style="display: inline;">${requestScope.MAIN_POST.postTitle}</h2>
                    <h3 style="display: inline; float: right; padding: 5px 10px 5px 10px; background-color: #F26F21; color: white; font-size: 1.25rem; margin-top: -10px; font-weight: 700">ĐỀ TÀI GỐC</h3>
                    <div class="prj-content" style=" height: 100px; text-overflow: ellipsis;   overflow: hidden; margin-bottom: 15px; margin-top: 10px">
                        <p> ${requestScope.MAIN_POST.postContent}</p>
                    </div>
                    <a href="MainController?action=DetailProject&id=${requestScope.MAIN_POST.postID}" style="padding: 5px 10px 5px 10px; background-color: #F26F21; text-decoration: none; color: white; font-weight: 600">Xem thêm</a>
                    <div class="devider" style="width: 100%"></div>
                </div>
                <div class="row tip-row" style="margin-top: 50px !important">
                    <div class="left-column col-md-8 pr-md-4">
                        <article class="tip-content">
                            <div class="tip-content_thumbnail" style="padding-bottom: 15px;">
                                <img src="${requestScope.POST.postImage}"
                                     alt="thumbnail">
                            </div>
                            <div class="tip-content__title">
                                <h1 style="font-weight:700">${requestScope.POST.postTitle}</h1>
                            </div>
                            <div class="tip-content__info" style="padding-bottom: 15px;">
                                <div class="tip-author" style="display: inline-block; padding-right: 20px">
                                    <i class="bi bi-person">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                             class="bi bi-person" viewBox="0 0 16 16">
                                        <path
                                            d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z" />
                                        </svg>
                                    </i>
                                    <span>${requestScope.STUDENT_NAME}</span>
                                </div>
                                <div class="tip-date" style="display: inline-block; padding-right: 20px">
                                    <i class="bi bi-calendar-event">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                             class="bi bi-calendar-event" viewBox="0 0 16 16">
                                        <path
                                            d="M11 6.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1z" />
                                        <path
                                            d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z" />
                                        </svg>
                                    </i>
                                    <span>${requestScope.POST.postDate}</span>
                                </div>
                                <div class="tip-interaction" style="display: inline-block">
                                    <i class="bi bi-chat-right-dots">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                             class="bi bi-chat-right-dots" viewBox="0 0 16 16">
                                        <path
                                            d="M2 1a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h9.586a2 2 0 0 1 1.414.586l2 2V2a1 1 0 0 0-1-1H2zm12-1a2 2 0 0 1 2 2v12.793a.5.5 0 0 1-.854.353l-2.853-2.853a1 1 0 0 0-.707-.293H2a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h12z" />
                                        <path
                                            d="M5 6a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0z" />
                                        </svg>
                                    </i>
                                    <span>${requestScope.COUNT_CMT} bình luận</span>
                                </div>
                            </div>
                            <div class="tip-content__body">
                                <p>
                                    ${requestScope.POST.postContent}
                                </p>
                            </div>
                              <input id="post-id" type="hidden" value="${requestScope.POST.postID}"/>
                        </article>
                        <div class="main__content">
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
                    </div>
                    <div class="right-column col-md-4">
                        <aside>
                            <div class="row" style="padding-bottom: 50px;">
                                <div class="search col-12" >
                                    <form action="MainController">
                                        <input type="text" placeholder="Tìm kiếm..." name="searchValue" id="search" class="search-box">
                                        <button class="search-btn" type="submit" name="action" value="Search">
                                            <i class="bi bi-search">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                     fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                                                <path
                                                    d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
                                                </svg>
                                            </i>
                                        </button>
                                    </form>
                                </div>
                            </div>
                            <div class="recent-post" style="padding-bottom: 50px;">
                                <h1 style="font-size: 2em;">Bài viết xem nhiều</h1>
                                <div class="devider"></div>
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
                            <div class="tags" style="padding-bottom: 50px;">
                                <h1 style="font-size: 2em;">Tags</h1>
                                <div class="devider"></div>
                                <div class="tag-list">
                                    <div class="tag-list__item">
                                        <c:forEach items="${requestScope.TAGS}" var="o">
                                            <div class="tag-list__item">
                                                <a href="MainController?action=FilterPostsByTag&tag=${o.tagDetailName}">${o.tagDetailName}</a>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                        </aside>
                    </div>
                </div>
            </div>
        </section>
        <div class="footer">
            <div class="container">
                <div class="footer-content row">
                    <div class="footer-content-first col-md-4">
                        <h3>Về Đại Học FPT</h3>
                        <p>Đại học FPT hướng tới xây dựng mô hình của một trường Đại học thế hệ mới; gắn liền đào tạo với
                            thực tiễn cuộc sống và nhu cầu nhân lực của đất nước, góp phần đưa Giáo dục Việt Nam tiến tới
                            ngang tầm các nước trên thế giới.</p>
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
                            <p>Cung cấp năng lực cạnh tranh toàn cầu cho đông đảo người học, góp phần mở mang bờ cõi trí tuệ
                                đất nước</p>
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
                        <div class="col-md-12">
                            <p>Trường Đại học FPT Phân hiệu Thành phố Hồ Chí Minh</p>
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
        <script>
            $(document).ready(function () {
                $('[data-toggle="tooltip"]').tooltip({
                    placement: 'bottom'
                });
            });
        </script>
        <script>
            var modal = document.getElementById('myModal');
            var btn = document.getElementById('myBtn');
            btn.addEventListener('click', openModal);
            function openModal() {
                modal.style.display = 'block';
            }
        </script>
    </body>

</html>