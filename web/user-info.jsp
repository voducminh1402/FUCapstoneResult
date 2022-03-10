<%-- Document : user-info Created on : Jan 20, 2022, 1:44:50 AM Author : HP --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@page
    contentType="text/html" pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html lang="en">
        <head>
            <title>User Information Detail</title>
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
            <link rel="stylesheet" href="./assets/css/user-detail.css" />
        </head>
        <body>
            <div class="wrapper bg-white mt-sm-5">
                <form action="MainController">
                    <h4 class="pb-4 border-bottom">Thông tin tài khoản</h4>
                    <div class="d-flex align-items-start py-3 border-bottom header">

                        <c:if test="${requestScope.USER_DETAIL.userImage eq null}">
                            <img
                                src="${requestScope.USER_DETAIL.userImage}"
                                class="img"
                                alt=""
                                />
                        </c:if>
                        <c:if test="${requestScope.USER_DETAIL.userImage != null}">
                            <img src="./assets/images/user.jpg" class="img" alt="" />
                        </c:if>

                        <div class="pl-sm-4 pl-2" id="img-section">
                            <b>${requestScope.USER_DETAIL.userName}</b>
                            <p>${requestScope.USER_DETAIL.email}</p>
                        </div>
                    </div>
                    <div class="py-2">
                        <div class="row py-2">
                            <div class="col-md-6">
                                <label for="firstname">Mã số</label>
                                <input
                                    type="tel"
                                    class="bg-light form-control"
                                    placeholder="${requestScope.USER_DETAIL.userID}"
                                    readonly
                                    name="id"
                                    value="${requestScope.USER_DETAIL.userID}"
                                    />
                            </div>
                            <div class="col-md-6 pt-md-0 pt-3">
                                <label for="lastname">Tên</label>

                                <input class="bg-light form-control" value="${requestScope.USER_DETAIL.userName}" name="name">
                            </div>
                        </div>
                        <div class="row py-2">
                            <div class="col-md-6">
                                <label for="email">Địa chỉ email</label>
                                <input class="bg-light form-control" value="${requestScope.USER_DETAIL.email}" name="email">


                            </div>
                            <div class="col-md-6 pt-md-0 pt-3">
                                <label for="phone">Ngày tạo</label>

                                <p class="bg-light form-control">
                                    ${requestScope.USER_DETAIL.dateCreated}
                                </p>
                            </div>
                        </div>
                        <div class="row py-2">
                            <div class="col-md-6">
                                <label for="role">Role</label>
                                <select name="role" id="role" class="bg-light">
                                    <c:if test="${requestScope.USER_DETAIL.roleID==1}">
                                        <option value="1" selected="">User</option>
                                        <option value="2">Moderator</option>
                                        <option value="3">Admin</option>
                                    </c:if>
                                    <c:if test="${requestScope.USER_DETAIL.roleID==2}">
                                        <option value="1">User</option>
                                        <option value="2" selected="">Moderator</option>
                                        <option value="3">Admin</option>
                                    </c:if>
                                    <c:if test="${requestScope.USER_DETAIL.roleID==3}">
                                        <option value="1">User</option>
                                        <option value="2">Moderator</option>
                                        <option value="3" selected="">Admin</option>
                                    </c:if>
                                </select>
                            </div>
                            <div class="col-md-6 pt-md-0 pt-3" id="lang">
                                <label for="status">Trạng thái</label>
                                <div class="arrow">
                                    <select name="status" id="status" class="bg-light">
                                        <c:if test="${requestScope.USER_DETAIL.userStatus==2}">
                                            <option value="2" selected="">Enable</option>
                                            <option value="3">Disable</option>
                                        </c:if>
                                        <c:if test="${requestScope.USER_DETAIL.userStatus==3}">
                                            <option value="2">Enable</option>
                                            <option value="3" selected="">Disable</option>
                                        </c:if>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="py-3 pb-4 border-top">
                            <c:if test="${requestScope.PAGE eq 'user'}">
                                <button
                                    class="btn btn-primary mr-3"
                                    name="action"
                                    value="EditUserInfo"
                                    >
                                    Lưu
                                </button>

                                <a href="admin.jsp" class="btn border button">Hủy bỏ</a>
                                <input type="hidden" value="user" name="page">
                            </c:if>
                            <c:if test="${requestScope.PAGE eq 'student'}">
                                <button
                                    class="btn btn-primary mr-3"
                                    name="action"
                                    value="EditUserInfo"
                                    >
                                    Lưu
                                </button>
                                <input type="hidden" value="student" name="page">
                                <a href="student.jsp" class="btn border button">Hủy bỏ</a>
                            </c:if>
                        </div>
                    </div>
                </form>
            </div>
            <!-- Bootstrap JavaScript Libraries -->
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
        </body>
    </html>
