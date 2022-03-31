<%-- Document : admin Created on : Jan 18, 2022, 11:06:28 PM Author : HP --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@page
    contentType="text/html" pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html lang="en">
        <head>
            <meta charset="UTF-8" />
            <meta http-equiv="X-UA-Compatible" content="IE=edge" />
            <meta name="viewport" content="width=device-width, initial-scale=1.0" />
            <meta name="referrer" content="no-referrer" />
            <title>FPT Capstone Project Result</title>
            <link
                rel="stylesheet"
                href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
                integrity="sha512-Fo3rlrZj/k7ujTnHg4CGR2D7kSs0v4LLanw2qksYuRlEzO+tcaEPQogQ0KaoGN26/zrn20ImR1DfuLWnOo7aBA=="
                crossorigin="anonymous"
                referrerpolicy="no-referrer"
                />
            <link
                href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
                rel="stylesheet"
                integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
                crossorigin="anonymous"
                />
            <link rel="stylesheet" href="./assets/css/mod-project.css" />
            <link rel="stylesheet" href="./assets/css/mod-post.css" />
            <link rel="stylesheet" href="./assets/css/styles.css" />
            <link rel="stylesheet" href="./assets/css/responsive.css" />
        </head>
        <body>
            <div class="wrapper">
                <!-- Sidebar  -->
            <nav id="sidebar">
                <div class="sidebar-header">
                    <h3>FPT University</h3>
                    <strong>FU</strong>
                </div>
                <ul class="list-unstyled components">
                    <li class="nav-item active">
                        <a class="nav-link" href="mod-index.jsp">
                            <i class="fas fa-fw fa-tachometer-alt"></i>
                            <span>Trang chủ</span></a>
                    </li>
                    <hr class="sidebar-divider">

                    <li class="dropdown">
                        <a href="admin.jsp" data-toggle="dropdown" aria-expanded="false" data-target="#homeSubmenu">
                            <i class="fas fa-home"></i> Quản Lí Người Dùng
                        </a>
                    </li>

                    <hr class="sidebar-divider">

                    <li>
                        <a href="mod-project.jsp" data-toggle="collapse" aria-expanded="false">
                            <i class="fas fa-briefcase"></i> Quản Lí Đồ Án
                        </a>
                    </li>
                    <li>
                        <a href="mod-team.jsp" data-toggle="collapse" aria-expanded="false">
                            <i class="fas fa-briefcase"></i> Quản Lí Nhóm Đồ Án
                        </a>
                    </li>
                    <li>
                        <a href="student.jsp" data-toggle="collapse" aria-expanded="false">
                            <i class="fas fa-briefcase"></i> Quản lí Sinh Viên
                        </a>
                    </li>
                    <li>
                        <a href="instructor.jsp" data-toggle="collapse" aria-expanded="false">
                            <i class="fas fa-briefcase"></i> Quản Lí Giảng Viên
                        </a>
                    </li>
                    <li>
                        <a href="mod-semester.jsp" data-toggle="collapse" aria-expanded="false">
                            <i class="fas fa-briefcase"></i> Quản Lí Học Kỳ
                        </a>
                    </li>

                    <hr class="sidebar-divider">

                    <li>
                        <a href="mod-post.jsp" data-toggle="collapse" aria-expanded="false">
                            <i class="fas fa-file"></i> Bài Đăng Chính
                        </a>
                        <a href="mod-request.jsp" data-toggle="collapse" aria-expanded="false">
                            <i class="fas fa-file"></i> Bài Viết Của Sinh Viên
                        </a>
                    </li>
                                  
                    
                </ul>

            </nav>

                <!-- Page Content  -->
                <div id="content">
                    <nav class="navbar navbar-expand-lg navbar-light bg-light">
                        <div class="container-fluid">
                            <div class="mod-header">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="left-side-menu">
                                            <button
                                                type="button"
                                                id="sidebarCollapse"
                                                class="btn btn-info"
                                                >
                                                <i class="fas fa-align-left"></i>
                                            </button>
                                        </div>
                                    </div>
                                <div class="col-md-6">

                                    <div class="right-side-info">
                                        <!-- Dropdown - Alerts -->
                                        <div class="info-login">
                                            <img src="${sessionScope.USER.userImage}" alt="">
                                        </div>
                                        <div style="background: red; padding: 5px 10px 5px 10px; border-radius: 50px">
                                            <a href="MainController?action=Logout" data-toggle="collapse" aria-expanded="false" style="color: white; font-weight: 700">
                                                Đăng xuất
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                </div>
                            </div>
                        </div>
                    </nav>
                    <div class="content-detail">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-md-12">
                                    <h2>Quản Lí Người Dùng</h2>
                                    <div class="direct-link">
                                        <i class="fas fa-home"></i>
                                        <i class="fas fa-chevron-right"></i>
                                        <span>Quản Lí Người Dùng</span>
                                    </div>
                                </div>
                            </div>
                            <div class="content-filter">
                                <div class="row">
                                    <div class="col-md-8 col-sm-12">
                                        <div class="filter">
                                            <span>Hiển Thị</span>
                                            <form action="MainController">
                                                <select name="role" id="">
                                                    <option value="0">Tất Cả Người Dùng</option>
                                                    <option value="3">Admin</option>
                                                    <option value="2">Moderator</option>
                                                    <option value="1">User</option>
                                                </select>
                                                <select name="status" id="">
                                                    <option value="0">Tất Cả Trạng Thái</option>
                                                    <option value="2">Enable</option>
                                                    <option value="3">Disable</option>
                                                </select>
                                                <button name="action" value="SearchUser">Tìm Kiếm</button>
                                            </form>
                                        </div>
                                    </div>
                                    <div class="col-md-4 col-sm-12">
                                        <form action="MainController">
                                            <div class="manage-project">
                                                <div class="menu-search menu-search-project">


                                                    <button name="action" value="SearchUserByName">
                                                        <i class="fa fa-search" aria-hidden="true"></i>
                                                    </button>
                                                    <input
                                                        class="mod-menu-input"
                                                        type="text"
                                                        placeholder="Tìm Kiếm Người Dùng..."
                                                        name="name"
                                                        />

                                                </div>
                                                <button
                                                    type="button"
                                                    data-toggle="modal"
                                                    data-target="#addModal"
                                                    class="add-project"
                                                    >
                                                    <i class="fas fa-plus"></i>
                                                </button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <div class="content-table">
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>No.</th>
                                                <th>Tên</th>
                                                <th>Email</th>
                                                <th>Ngày Tạo</th>
                                                <th>Phân Loại</th>
                                                <th>Trạng Thái</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:if test="${requestScope.LIST_USER==null}">
                                                <c:redirect
                                                    url="MainController?action=Load All User"
                                                    ></c:redirect>
                                            </c:if>

                                            <c:forEach
                                                items="${requestScope.LIST_USER}"
                                                var="o"
                                                varStatus="counter"
                                                >
                                            <form action="MainController" method="POST">
                                                <tr>
                                                    <td>${counter.count}</td>
                                                    <td>${o.userName}</td>
                                                    <td>${o.email}</td>
                                                    <td>${o.dateCreated}</td>
                                                    <td>
                                                        <c:if test="${o.roleID==1}"> User </c:if>
                                                        <c:if test="${o.roleID==2}"> Moderator </c:if>
                                                        <c:if test="${o.roleID==3}"> Admin </c:if>
                                                        </td>
                                                        <td>
                                                        <c:if test="${o.userStatus==2}"> Enable </c:if>
                                                        <c:if test="${o.userStatus==3}"> Disable </c:if>
                                                        </td>
                                                        <td class="last-type__menu">
                                                            <i class="fas fa-ellipsis-h more-choice__dot"></i>
                                                            <div class="more-choice__menu">
                                                                <div class="more-choice__item">
                                                                    <a
                                                                        href="MainController?action=showUserDetail&id=${o.userID}&page=user"
                                                                    id="show-user-detail-info"
                                                                    >
                                                                    <span>Xem Chi Tiết</span>
                                                                    <i class="fa fa-eye" aria-hidden="true"></i>
                                                                </a>
                                                            </div>
                                                            <div class="more-choice__item">
                                                                <a href="MainController?action=showUserDetail&id=${o.userID}&page=user">
                                                                    <span>Chỉnh Sửa</span>
                                                                    <i
                                                                        class="fa fa-pencil"
                                                                        aria-hidden="true"
                                                                        ></i>
                                                                </a>
                                                            </div>
                                                            <div class="more-choice__item">
                                                                <a
                                                                    href="MainController?action=DeleteAUser&id=${o.userID}"
                                                                    >
                                                                    <span>Xóa</span>
                                                                    <i class="fa fa-trash" aria-hidden="true"></i>
                                                                </a>
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </form>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="content-project-pagination">
                                <div class="pagination">
                                    <span><i class="fas fa-chevron-left"></i></span>
                                    <span class="active-pagination">1</span>
                                    <span>2</span>
                                    <span>3</span>
                                    <span>...</span>
                                    <span>10</span>
                                    <span><i class="fas fa-chevron-right"></i></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="add-project-menu">
                <h2>Thêm Người Dùng</h2>
                <form action="MainController" id="form">
                    <label for="name">Họ Và Tên</label><br />
                    <p class="name-message"></p>
                    <input name="name" type="text" id="name" />

                    <label for="password">Mật Khẩu</label><br />
                    <p class="password-message"></p>
                    <input name="password" type="text" id="password" />

                    <label for="email">Email</label><br />
                    <p class="email-message"></p>
                    <input name="email" type="email" id="email" />

                    <label for="role">Phân Loại</label><br />
                    <select name="role" id="role">
                        <option value="3">Admin</option>
                        <option value="2">Moderator</option>
                        <option value="1">User</option>
                    </select>
                    <label for="status">Trạng Thái</label><br />
                    <select name="status" id="status">
                        <option value="2">Enable</option>
                        <option value="3">Disable</option>
                    </select>

                    <label for="image">Ảnh</label>
                    <div
                        class="project-add-upload__image post-upload__image"
                        style="background-color: none"
                        >
                        <label style="margin: 0" for="file"
                               ><i class="fas fa-cloud-upload-alt"></i>Tải Ảnh Lên</label
                        >
                        <input
                            type="file"
                            name="file"
                            id="file"
                            placeholder="Tải Ảnh Lên"
                            required
                            /><br />
                        <input type="hidden" id="mod-post__preview-input" name="image" />
                        <a id="mod-post__preview-link" href="">
                            <img id="mod-post__preview-image" src="" alt="" />
                        </a>
                    </div>

                    <div class="add-project-submit">
                        <button type="submit" name="action" value="Add a user">
                            Lưu Lại
                        </button>
                        <button class="cancel-add-btn" type="button">Hủy Bỏ</button>
                    </div>
                </form>
            </div>


            <div class="overlay-page-mod" id="overlay-page overlay-page-mod"></div>
            <script src="./ckeditor/ckeditor.js"></script>
            <script
                src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
                integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
                crossorigin="anonymous"
                referrerpolicy="no-referrer"
            ></script>
            <script
                src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
                crossorigin="anonymous"
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
            <script
                src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-tagsinput/0.8.0/bootstrap-tagsinput.min.js"
                integrity="sha512-9UR1ynHntZdqHnwXKTaOm1s6V9fExqejKvg5XMawEMToW4sSw+3jtLrYfZPijvnwnnE8Uol1O9BcAskoxgec+g=="
                crossorigin="anonymous"
                referrerpolicy="no-referrer"
            ></script>
            <script src="./assets/js/app.js"></script>

            <script type="text/javascript">
                $(document).ready(function () {
                    $("#sidebarCollapse").on("click", function () {
                        $("#sidebar").toggleClass("active");
                    });
                });
            </script>
            <script>
                CKEDITOR.plugins.addExternal(
                        "imgur",
                        "/FUCapstoneResult/ckeditor/plugins/imgur/",
                        "plugin.js"
                        );
                var editor = CKEDITOR.replace("editor", {
                    extraPlugins: "imgur",
                });

                CKEDITOR.editorConfig = function (config) {
                    config.extraPlugins = "imgur";
                    config.imgurClientID = "424e57033a8d4ea";
                };

                editor.on("change", function (evt) {
                    var data = CKEDITOR.instances.editor.getData();
                    document.getElementById("post-content").value = data;
                    console.log(data);
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
                                document.getElementById("mod-post__preview-link").src =
                                        obj.data.link;
                                document.getElementById("mod-post__preview-image").src =
                                        obj.data.link;
                                document.getElementById("mod-post__preview-input").value =
                                        obj.data.link;
                                obj.data.link;
                            });
                        }
                    });
                });
            </script>
            <script>
                $(function () {
                    $("input, select")
                            .on("change", function (event) {
                                var $element = $(event.target),
                                        $container = $element.closest(".example");

                                if (!$element.data("tagsinput"))
                                    return;

                                var val = $element.val();
                                if (val === null) {
                                    val = "null";
                                } else {
                                    document.getElementById("post-tag-hidden").value = val;
                                }

                                $("code", $("pre.val", $container)).html(
                                        $.isArray(val)
                                        ? JSON.stringify(val)
                                        : '"' + val.replace('"', '\\"') + '"'
                                        );
                                $("code", $("pre.items", $container)).html(
                                        JSON.stringify($element.tagsinput("items"))
                                        );
                            })
                            .trigger("change");
                });
            </script>
            <script
                src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"
                type="text/javascript"
            ></script>
            <script
                src="https://cdn.tiny.cloud/1/m862mtwmvofelufcxf6kpr7rr30u4mh13bb09ks2g0xg8gdf/tinymce/5/tinymce.min.js"
                referrerpolicy="origin"
            ></script>
            <script
                src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
                integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
                crossorigin="anonymous"
                referrerpolicy="no-referrer"
            ></script>
            <script
                src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
                crossorigin="anonymous"
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
            <script src="./assets/js/app.js"></script>

            <script type="text/javascript">
                $(document).ready(function () {
                    $("#sidebarCollapse").on("click", function () {
                        $("#sidebar").toggleClass("active");
                    });
                });
            </script>

            <script>
                tinymce.init({
                    selector: "textarea",
                    plugins:
                            "advlist autolink lists link image charmap print preview hr anchor pagebreak",
                    toolbar_mode: "floating",
                    content_css: "./assets/css/mod-project.css",
                });
            </script>
            <script src="./assets/js/admin.js"></script>
        </body>
    </html>
