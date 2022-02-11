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
  </head>
  <body>
    <div class="container-fluid main">
      <div class="main__header">
        <h1>Đồ án</h1>
      </div>
      <div class="main__content row gx-5">
        <div class="col-lg-8">
          <div class="content">
            <!-- <img
              src="./assets/images/image-product-1.jpg"
              alt="product picture"
              class="main-picture"
            /> -->
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
            <form action="#">
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
        <div class="col-lg-4">
          <div class="search">
            <form action="#">
              <input
                type="text"
                name="search"
                id="search"
                placeholder="Tìm kiếm..."
              />
              <i class="fas fa-search"></i>
            </form>
          </div>
          <div class="recent-post left-col">
            <h3>Các bài viết liên quan</h3>
            <div class="line-break"></div>
            <ul>
              <li>
                <div class="recent-post__info">
                  <div class="picture-project">
                    <a href="#">
                      <img
                        src="./assets/images/image-product-1.jpg"
                        alt="project image"
                      />
                    </a>
                  </div>
                  <div class="project-content">
                    <a href="#">
                      <h5 class="project-name">Bài viết 1</h5>
                    </a>

                    <p>20/06/2020</p>
                  </div>
                </div>
              </li>
              <li>
                <div class="recent-post__info">
                  <div class="picture-project">
                    <a href="#">
                      <img
                        src="./assets/images/image-product-1.jpg"
                        alt="project image"
                      />
                    </a>
                  </div>
                  <div class="project-content">
                    <a href="#">
                      <h5 class="project-name">Bài viết 2</h5>
                    </a>

                    <p>20/06/2020</p>
                  </div>
                </div>
              </li>
              <li>
                <div class="recent-post__info">
                  <div class="picture-project">
                    <a href="#">
                      <img
                        src="./assets/images/image-product-1.jpg"
                        alt="project image"
                      />
                    </a>
                  </div>
                  <div class="project-content">
                    <a href="#">
                      <h5 class="project-name">Bài viết 3</h5>
                    </a>

                    <p>20/06/2020</p>
                  </div>
                </div>
              </li>
            </ul>
          </div>
          <div class="tags left-col">
            <h3>Tags</h3>
            <div class="line-break"></div>
            <ul>
                <c:forEach items="${requestScope.TAGS}" var="o">
                    <li><a href="#">${o.tagDetailName}</a></li>
                </c:forEach>
            </ul>
          </div>
          <div class="instructor left-col">
            <h3>Giảng viên hướng dẫn</h3>
            <div class="line-break"></div>
            <div class="instructor-all">
                <c:forEach items="${requestScope.INSTRUCTOR}" var="o">
                    <div class="instructor-info">
                        <img
                          src="${o.instructorImage}"
                          alt="instructor image"
                        />
                        <div class="intructor-name">${o.instructorName}</div>
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