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
        <head>
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.18/css/bootstrap-select.min.css" integrity="sha512-ARJR74swou2y0Q2V9k0GbzQ/5vJ2RBSoCWokg4zkfM29Fb3vZEQyv0iWBMW/yvKgyHSR/7D64pFMmU8nYmbRkg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="./assets/css/mod-project.css">    
        <link rel="stylesheet" href="./assets/css/mod-post.css">    
        <link rel="stylesheet" href="./assets/css/styles.css">
        <link rel="stylesheet" href="./assets/css/responsive.css">
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
                        <c:if test="${sessionScope.USER.roleID eq 3}">
                            <li class="dropdown">
                                <a href="admin.jsp" data-toggle="dropdown" aria-expanded="false" data-target="#homeSubmenu">
                                    <i class="fas fa-home"></i> Quản Lí Người Dùng
                                </a>
                            </li>


                            <hr class="sidebar-divider">
                        </c:if>

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
                                <i class="fas fa-briefcase"></i> Quản Lí Sinh Viên
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
                        <hr class="sidebar-divider">
                        <li>
                            <a href="mod-slide-content.jsp" data-toggle="collapse" aria-expanded="false">
                                <i class="fas fa-file-alt"></i> Quản Lí Slide
                            </a>
                            <a href="mod-timeline-semester-content.jsp" data-toggle="collapse" aria-expanded="false">
                                <i class="fas fa-file-alt"></i> Quản Lí Timeline
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
                                        <button type="button" id="sidebarCollapse" class="btn btn-info">
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
                <div class="content-detail content-post add-post">
                    <h2>Sửa Thông Tin Đồ Án</h2>
                    <form action="MainController" method="POST">
                        <input type="hidden" name="project-id" value="${requestScope.VIEW_PROJECT.projectID}">
                        <label for="">Tên Đồ Án</label><br>
                        <input type="text" name="project-name" value="${VIEW_PROJECT.projectName}" required>
                        <c:if test="${requestScope.TEAM_EDIT == null}">
                            <c:redirect url="MainController?action=GetListProject&page=add-project"></c:redirect>
                        </c:if>
                        <label for="">Nhóm Thực Hiện</label><br>
                        <select class="selectpicker" data-show-subtext="true" data-live-search="true" name="team-id" id="" required>
                            <option disabled selected>Lựa Chọn Nhóm Thực Hiện Đồ Án</option>
                            <c:forEach items="${requestScope.TEAM_EDIT}" var="o">
                                <c:if test="${requestScope.VIEW_PROJECT.projectID eq o.teamID}">
                                    <option selected="" value="${o.teamID}">${o.teamName}</option>
                                </c:if>
                                <c:if test="${requestScope.VIEW_PROJECT.projectID ne o.teamID}">
                                    <option value="${o.teamID}">${o.teamName}</option>
                                </c:if>
                            </c:forEach>
                        </select>
                        <br>
                        <label for="">Giảng Viên Hướng Dẫn</label><br>
                        <select class="selectpicker" data-show-subtext="true" data-live-search="true" name="instructor-id" id="" required>
                            <option disabled selected>Lựa Chọn Giảng Viên Hướng Dẫn Cho Đồ Án</option>
                            <c:forEach items="${requestScope.INSTRUCTOR_LIST}" var="o">
                                <option value="${o.instructorID}">${o.instructorName}</option>
                            </c:forEach>
                        </select>
                        <br>
                        <label for="">Học Kì</label><br>
                        <select name="semester-id" id="" class="selectpicker" data-show-subtext="true" data-live-search="true" required>
                            <option disabled selected>Lựa Chọn Kì Cho Đồ Án</option>
                            <c:forEach items="${requestScope.SEMESTER_LIST}" var="o">
                                <c:if test="${requestScope.VIEW_PROJECT.semesterID eq o.semesterID}">
                                    <option selected="" value="${o.semesterID}">${o.semesterName}</option>
                                </c:if>
                                <c:if test="${requestScope.VIEW_PROJECT.semesterID ne o.semesterID}">
                                    <option value="${o.semesterID}">${o.semesterName}</option>
                                </c:if>
                            </c:forEach>
                        </select>
                        <br>
                        <label for="">Điểm Số Đồ Án</label><br>
                        <input type="number" value="${requestScope.VIEW_PROJECT.projectScore}" step="0.05" min="0" max="10" name="project-score">
                        <label for="">Ảnh Bìa Đồ Án</label>
                        <div class="project-add-upload__image post-upload__image">
                            <label style="margin: 0;" for="file"><i class="fas fa-cloud-upload-alt"></i>Tải Ảnh Lên</label>
                            <input type="file" name="file" id="file" placeholder="Tải Ảnh Lên"><br>
                            <input type="hidden" id="mod-post__preview-input" value="${requestScope.VIEW_PROJECT.projectImage}" name="project-image">
                            <a id="mod-post__preview-link" href="">
                                <img id="mod-post__preview-image" src="${requestScope.VIEW_PROJECT.projectImage}" alt="">
                            </a>
                        </div>
<!--                        <label for="">Thêm Tag Của Bài Viết</label><br>
                        <input id="post-tag" data-role="tagsinput" type="text" required>
                        <input id="post-tag-hidden" type="hidden" name="post-tag">

                        <label for="">Nội Dung Bài Viết</label><br>
                        <textarea id="editor" cols="30" rows="50" required>
                        </textarea>
                        <input id="project-description" type="hidden" name="project-description"/>
                        <input id="post-content" type="hidden" name="post-content" value="${requestScope.VIEW_PROJECT.projectDescription}">
                        <br>-->
                        <div class="add-project-submit">
                            <button type="submit" name="action" value="UpdateProject">Lưu</button>
                            <button class="cancel-add-btn" type="button">Hủy Bỏ</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <script src="./ckeditor/ckeditor.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
         <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>   
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>    
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-tagsinput/0.8.0/bootstrap-tagsinput.min.js" integrity="sha512-9UR1ynHntZdqHnwXKTaOm1s6V9fExqejKvg5XMawEMToW4sSw+3jtLrYfZPijvnwnnE8Uol1O9BcAskoxgec+g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.18/js/bootstrap-select.min.js" integrity="sha512-yDlE7vpGDP7o2eftkCiPZ+yuUyEcaBwoJoIhdXv71KZWugFqEphIS3PU60lEkFaz8RxaVsMpSvQxMBaKVwA5xg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="./assets/js/app.js"></script>
        <script>
            $(function () {
    $('select').selectpicker();
});
        </script>
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
            });

            let content = document.getElementById("post-content").value;

            console.log(content)

            CKEDITOR.instances.editor.setData(content);
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
        <script>
            $('#post-tag').tagsinput('add', 'init');
            <c:forEach items="${requestScope.DETAIL_TAG}" var="o">
        $('#post-tag').tagsinput('add', '${o.tagDetailName}');
            </c:forEach>
        </script>
    </body>
</html>