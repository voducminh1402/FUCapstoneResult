const filterBtn = document.getElementById("filter");

filterBtn.addEventListener("change", function () {
  console.log("anh vui ve");
  console.log(filterBtn.value);
  $.ajax({
    type: "POST",
    url: `MainController?action=Filter`,
    data: "filterValue=" + filterBtn.value,
    dataType: "text",

    //if received a response from the server
    success: function (data) {
      if (data == "fail")
        window.location.href =
          "http://localhost:8080/FUCapstoneResult/login.html";
      else {
        console.log("anh vui ve");
      }
    },
  });
});
