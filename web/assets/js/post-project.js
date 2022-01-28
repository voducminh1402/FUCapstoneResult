let checkEmpty = true;

getCommentTime = () => {
    let date = new Date();

    return `${date.getHours()}:${date.getMinutes()} ${date.getDate()}/${date.getMonth() + 1}/${date.getFullYear()}`
}

document.getElementById("submit").addEventListener("click", () => {
    let comment = document.getElementById("comment");
    let commentArea = document.getElementById("comment-area");

    if (comment !== "") {
        checkEmpty = false;

        let commentContent = `<div class="comment-info">
                                <div class="comment-info__user-picture">
                                <img
                                    src="./assets/images/image-product-1.jpg"
                                    alt="user picture"
                                />
                                </div>
                                <div class="comment-info__content">
                                <div class="content-header">
                                    <h6 class="user-name">Le Hong Anh</h6>
                                    <span> ${getCommentTime()} </span>
                                    <span class="comment-request">Bình luận đang chờ kiểm duyệt!</span>
                                </div>
                                <p>
                                    ${comment.value}
                                </p>
                                </div>
                            </div>`;

        commentArea.insertAdjacentHTML("beforeend", commentContent)
    }
})



