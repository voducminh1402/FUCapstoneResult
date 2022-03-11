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
        <title>Po-update-post</title>
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
        <div class="wrapper" style="background-color: inherit; margin-top: 80px; border: none; max-width: 1400px;">
            <!-- Page Content  -->
            <div id="content" style="width: 100%;">
                <div class="POPost-header">
                    <h1 style="font-size: 2.2rem; color: black; margin-bottom: 20px">Chỉnh sửa bài viết</h1>
                    <div class="devider" style="width: 100%;"></div>
                </div>
                <div class="content-detail content-post add-post" style="border-radius: 15px; margin-bottom: 30px">
                    <form action="MainController" method="POST">                     
                        <input type="hidden" name="po-post-id" value="${requestScope.POST.postID}">
                        <input type="hidden" name="po-post-author" value="${requestScope.POST.postAuthor}">
                        <input type="hidden" name="po-post-project" value="${requestScope.POST.projectID}">
                        <input type="hidden" name="is-main-post" value="${requestScope.POST.isMainPost}">
                        <label for="">Tiêu Đề Bài Đăng</label><br>
                        <input type="text" name="po-post-title"  style="margin-bottom: 5px" value="${requestScope.POST.postTitle}" required>
                        <label for="">Thêm Tag Của Bài Viết</label><br>
                        <input id="post-tag" data-role="tagsinput" type="text" style="margin-bottom: 5px"> 
                        <input id="post-tag-hidden" type="hidden" name="po-post-tag"> 
                        <label for="">Ảnh Bìa Bài Đăng</label>
                        <div class="project-add-upload__image post-upload__image">
                            <label style="margin: 0; background-color: #F26F21; height: 40px; width: 50px" for="file" ><i class="bi bi-cloud-arrow-up" style="color: white; margin-left: 5px">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cloud-arrow-up" viewBox="0 0 16 16">
                                    <path fill-rule="evenodd" d="M7.646 5.146a.5.5 0 0 1 .708 0l2 2a.5.5 0 0 1-.708.708L8.5 6.707V10.5a.5.5 0 0 1-1 0V6.707L6.354 7.854a.5.5 0 1 1-.708-.708l2-2z"/>
                                    <path d="M4.406 3.342A5.53 5.53 0 0 1 8 2c2.69 0 4.923 2 5.166 4.579C14.758 6.804 16 8.137 16 9.773 16 11.569 14.502 13 12.687 13H3.781C1.708 13 0 11.366 0 9.318c0-1.763 1.266-3.223 2.942-3.593.143-.863.698-1.723 1.464-2.383zm.653.757c-.757.653-1.153 1.44-1.153 2.056v.448l-.445.049C2.064 6.805 1 7.952 1 9.318 1 10.785 2.23 12 3.781 12h8.906C13.98 12 15 10.988 15 9.773c0-1.216-1.02-2.228-2.313-2.228h-.5v-.5C12.188 4.825 10.328 3 8 3a4.53 4.53 0 0 0-2.941 1.1z"/>
                                    </svg>
                                </i></label>
                            <input type="file" name="file" id="file" placeholder="Tải Ảnh Lên" required><br>
                            <input type="hidden" id="mod-post__preview-input" name="po-post-thumbnail">
                            <a id="mod-post__preview-link" href="">
                                <img id="mod-post__preview-image" src="${requestScope.POST.postImage}" alt="">
                            </a>
                        </div>    
                        <label for="">Nội Dung</label><br>
                        <textarea id="editor" cols="30" rows="30" style="border: none; width: 100%" required>
                            ${requestScope.POST.postContent}
                        </textarea>
                        <input id="post-content" type="hidden" name="po-post-content">                                                                                 
                        <input id="post-tag-hidden" type="hidden" name="po-post-tag">
                        <div class="add-project-submit add-post-submit">
                            <button type="submit" name="action" value="PoUpdatePost" style="background-color:#F26F21 ">Lưu</button>
                            <button class="cancel-add-btn" type="button">Hủy Bỏ</button>
                        </div>
                    </form>
                </div>                               
            </div>
            <script src="./ckeditor/ckeditor.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                    integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>    
            <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-tagsinput/0.8.0/bootstrap-tagsinput.min.js" integrity="sha512-9UR1ynHntZdqHnwXKTaOm1s6V9fExqejKvg5XMawEMToW4sSw+3jtLrYfZPijvnwnnE8Uol1O9BcAskoxgec+g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
            <script src="./assets/js/app.js"></script>

            <script type="text/javascript">
                $(document).ready(function () {
                    $('#sidebarCollapse').on('click', function () {
                        $('#sidebar').toggleClass('active');
                    });
                });
            </script>
            <script>
                CKEDITOR.plugins.addExternal('imgur', '/FUCapstoneResult/ckeditor/plugins/imgur/', 'plugin.js');
                var editor = CKEDITOR.replace('editor', {
                    extraPlugins: 'imgur'
                });

                CKEDITOR.editorConfig = function (config) {
                    config.extraPlugins = 'imgur';
                    config.imgurClientID = '424e57033a8d4ea';
                };

                editor.on('change', function (evt) {
                    var data = CKEDITOR.instances.editor.getData();
                    document.getElementById("post-content").value = data;
                    console.log(data)
                });
            </script>
            <script>
                $("document").ready(function () {
                    $("input[type=file]").on("change", function () {
                        var $files = $(this).get(0).files;
                        if ($files.length) {
                            if ($files[0].size > $(this).data("max-size") * 1024) {
                                console.log("Vui lòng chọn file có dung lượng nhỏ hơn!");
                                return false;
                            }

                            console.log("Đang upload hình ảnh lên imgur...");
                            var apiUrl = "https://api.imgur.com/3/image";
                            var apiKey = "dcd0ee22791c49d";
                            var settings = {
                                async: false,
                                crossDomain: true,
                                processData: false,
                                contentType: false,
                                type: "POST",
                                url: apiUrl,
                                headers: {
                                    Authorization: "Client-ID " + apiKey,
                                    Accept: "application/json",
                                },
                                mimeType: "multipart/form-data",
                            };
                            var formData = new FormData();
                            formData.append("image", $files[0]);
                            settings.data = formData;
                            $.ajax(settings).done(function (response) {
                                console.log(response);
                                var obj = JSON.parse(response);
                                document.getElementById("mod-post__preview-link").src = obj.data.link;
                                document.getElementById("mod-post__preview-image").src = obj.data.link;
                                document.getElementById("mod-post__preview-input").value = obj.data.link;
                                obj.data.link;
                            });
                        }
                    });
                });
            </script>
            <script>
                $(function () {
                    $('input, select').on('change', function (event) {
                        var $element = $(event.target),
                                $container = $element.closest('.example');

                        if (!$element.data('tagsinput'))
                            return;

                        var val = $element.val();
                        if (val === null) {
                            val = "null";
                        } else {
                            document.getElementById('post-tag-hidden').value = val;
                        }

                        $('code', $('pre.val', $container)).html(($.isArray(val) ? JSON.stringify(val) : "\"" + val.replace('"', '\\"') + "\""));
                        $('code', $('pre.items', $container)).html(JSON.stringify($element.tagsinput('items')));
                    }).trigger('change');
                });
            </script>

    </body>
</html>
