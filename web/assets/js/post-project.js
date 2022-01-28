<<<<<<< HEAD
const voteBtn = document.getElementById("vote").childNodes[1];
const unVoteBtn = document.getElementById("un-vote").childNodes[1];
const voteNumbers = document.getElementById("vote-numbers");
const form = document.getElementById("form-vote");
let votes = 0;

voteBtn.addEventListener("click", () => {
  if (voteBtn.classList.contains("vote-active")) {
    voteBtn.classList.remove("vote-active");
    votes -= 1;
  } else {
    voteBtn.classList.add("vote-active");
    votes += 1;
  }
  //   voteNumbers.innerHTML = `${votes}`;
  unVoteBtn.classList.remove("un-vote-active");
});

unVoteBtn.addEventListener("click", () => {
  if (unVoteBtn.classList.contains("un-vote-active")) {
    unVoteBtn.classList.remove("un-vote-active");
  } else {
    unVoteBtn.classList.add("un-vote-active");
    if (votes > 0) votes -= 1;
  }
  //   voteNumbers.innerHTML = `${votes}`;
  voteBtn.classList.remove("vote-active");
});

voteBtn.addEventListener("click", vote);
unVoteBtn.addEventListener("click", vote);

function vote() {
  $.ajax({
    type: "POST",
    url: "MainController?action=Vote",
    data: votes,
    dataType: "text",

    //if received a response from the server
    success: function (data) {
      if (data == "fail")
        window.location.href =
          "http://localhost:8080/FUCapstoneResult/login.html";
      else voteNumbers.innerHTML = `${votes}`;
    },

    // //If there was no resonse from the server
    // error: function (jqXHR, textStatus, errorThrown) {
    //   console.log("Something really bad happened " + textStatus);
    //   $("#ajaxResponse").html(jqXHR.responseText);
    // },
  });
}

function vote1() {
  // $.ajax({
  //   type: "POST",
  //   url: "/FUCapstoneResult/MainController",
  //   data: "vote=" + votes + "action=Vote",
  //   dataType: "text",
  //   //if received a response from the server
  //   success: function (data, textStatus, jqXHR) {
  //     //our country code was correct so we have some information to display
  //     // window.open(data);
  //     alert(data);
  //   },
  //   //If there was no resonse from the server
  //   error: function (jqXHR, textStatus, errorThrown) {
  //     console.log("Something really bad happened " + textStatus);
  //     $("#ajaxResponse").html(jqXHR.responseText);
  //   },
  //   //capture the request before it was sent to server
  //   beforeSend: function (jqXHR, settings) {
  //     //adding some Dummy data to the request
  //     settings.data += "&dummyData=whatever";
  //     //disable the button until we get the response
  //     $("#myButton").attr("disabled", true);
  //   },
  //   //this is called after the response or error functions are finsihed
  //   //so that we can take some action
  //   complete: function (jqXHR, textStatus) {
  //     //enable the button
  //     $("#myButton").attr("disabled", false);
  //   },
  // });
}
=======
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



>>>>>>> 6f3684ded52eb62088621658795113c07fee19fb
