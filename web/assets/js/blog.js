let checkEmptyPost = true;

getCommentTime = () => {
    let date = new Date();

    return `${date.getHours()}:${date.getMinutes()} ${date.getDate()}/${
            date.getMonth() + 1
            }/${date.getFullYear()}`;
};

document.getElementById("submit").addEventListener("click", () => {
    console.log("a")
    let comment = document.getElementById("comment");
    let commentArea = document.getElementById("comment-area");
    let username = document.getElementById("user-name-login");
    

    if (comment !== "" && username != "") {
        checkEmptyPost = false;

        let commentContent = `<div class="comment-info">
                                <div class="comment-info__user-picture">
                                <img
                                    src="./assets/images/image-product-1.jpg"
                                    alt="user picture"
                                />
                                </div>
                                <div class="comment-info__content">
                                <div class="content-header">
                                    <h6 class="user-name">${username.value}</h6>
                                    <span> ${getCommentTime()} </span>
                                    <span class="comment-request">Bình luận đang chờ kiểm duyệt!</span>
                                </div>
                                <p>
                                    ${comment.value}
                                </p>
                                </div>
                            </div>`;

        commentArea.insertAdjacentHTML("beforeend", commentContent);
    }
});


