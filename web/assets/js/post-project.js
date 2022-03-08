const unVoteBtn = document.getElementById("un-vote").childNodes[1];
const voteNumbers = document.getElementById("vote-numbers");
const voteBtn = document.getElementById("vote").childNodes[1];
const form = document.getElementById("form-vote");
let vote = 0;
let add = "true";
//let votes = parseInt(document.getElementById("vote-numbers").innerHTML);

window.addEventListener("load", () => {
    var url_string = window.location.href;
    var url = new URL(url_string);
    $.ajax({
        type: "POST",
        url: `MainController?action=GetNumberVote`,
        data: "id=" + url.searchParams.get("id"),
        dataType: "text",

        //if received a response from the server
        success: function (data) {
            if (data.includes("false"))                
                data = data.replace("false", "");
            
            else{
                voteBtn.classList.add("vote-active");
                data = data.replace("true", "");
            }
                
                
            
            voteNumbers.innerHTML = data;
            
        }
    });
});



voteBtn.addEventListener("click", () => {
    let votes = parseInt(document.getElementById("vote-numbers").innerHTML);
    
    if (voteBtn.classList.contains("vote-active")) {
        voteBtn.classList.remove("vote-active");
        
        votes -= 1;
    } else {
        voteBtn.classList.add("vote-active");
        
        votes += 1;
    }
    vote = votes;
    add = "true";
    //   voteNumbers.innerHTML = `${votes}`;
    
    unVoteBtn.classList.remove("un-vote-active");
});

unVoteBtn.addEventListener("click", () => {
    let votes = parseInt(document.getElementById("vote-numbers").innerHTML);
    if (unVoteBtn.classList.contains("un-vote-active")) {
        unVoteBtn.classList.remove("un-vote-active");
    } else {
        unVoteBtn.classList.add("un-vote-active");
        if (votes > 0)
            votes -= 1;
    }
    vote = votes;
    add = "false";
    //   voteNumbers.innerHTML = `${votes}`;
    voteBtn.classList.remove("vote-active");
});

voteBtn.addEventListener("click", voteA);
unVoteBtn.addEventListener("click", voteA);

function voteA() {
    var url_string = window.location.href;
    var url = new URL(url_string);
    $.ajax({
        type: "POST",
        url: `MainController?action=Vote&add=${add}`,
        data: "id=" + url.searchParams.get("id"),
        dataType: "text",

        //if received a response from the server
        success: function (data) {
            if (data == "fail")
                window.location.href =
                        "http://localhost:8080/FUCapstoneResult/login.html";
            else {
                voteNumbers.innerHTML = data;
                console.log(data);
            }
        }
    });
}


let checkEmpty = true;

getCommentTime = () => {
    let date = new Date();

    return `${date.getHours()}:${date.getMinutes()} ${date.getDate()}/${
            date.getMonth() + 1
            }/${date.getFullYear()}`;
};

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
                                    <h6 class="user-name">Vo Duc Minh</h6>
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