(function () {
  "use strict";
  const name = document.getElementById("name");
  const password = document.getElementById("password");
  const passwordConfirm = document.getElementById("password-confirm");
  const checkbox = document.getElementById("checkbox");
  const passwordMessage = document.querySelector(".password-message");
  const passwordConfirmMessage = document.querySelector(
    ".password-confirm-message"
  );
  const checkedbox = document.querySelector(".accept-checkbox");
  const nameMessage = document.querySelector(".name-message");
  name.addEventListener("input", function () {
    const value = name.value.trim();
    if (value.length < 2 || value.length > 50) {
      nameMessage.innerHTML = "Tên phải từ 2 đến 50 ký tự!";
    } else if (/^[A-Za-z\s]+$/.test(value) == false) {
      nameMessage.innerHTML = "Tên không được chứa số và kí tự đặc biệt!";
    } else {
      nameMessage.innerHTML = "";
    }
  });
  password.addEventListener("input", function () {
    const value = password.value.trim();

    if (value.length < 8) {
      passwordMessage.innerHTML = "Mật khẩu phải chứa ít nhất 8 kí tự!";
    } else {
      passwordMessage.innerHTML = "";
    }
  });
  passwordConfirm.addEventListener("input", function () {
    const value = passwordConfirm.value.trim();

    if (value != password.value.trim()) {
      passwordConfirmMessage.innerHTML =
        "Mật khẩu xác nhận không trùng với mật khẩu!";
    } else {
      passwordConfirmMessage.innerHTML = "";
    }
    password.addEventListener("input", function () {
      if (value != password.value.trim()) {
        passwordConfirmMessage.innerHTML =
          "Mật khẩu xác nhận không trùng với mật khẩu!";
      } else {
        passwordConfirmMessage.innerHTML = "";
      }
    });
  });
  checkbox.addEventListener("click", function () {
    if (checkbox.checked == false) {
      checkedbox.innerHTML =
        "Đồng ý với điều khoản của chúng tôi để tạo tài khoản!";
    } else {
      checkedbox.innerHTML = "";
    }
  });

  $(document).ready(function () {
    var x_timer;
    $("#email").keyup(function (e) {
      clearTimeout(x_timer);
      const email = $("#email").val();
      x_timer = setTimeout(function () {
        check_email_ajax(email);
      }, 0);
    });
    function check_email_ajax(email) {
      $.ajax({
        type: "POST",
        url: "/FUCapstoneResult/CheckDuplicateUserController",
        data: "email=" + email,
        dataType: "text",
        success: function (data) {
          $(".email-message").html(data);
        },
      });
    }
  });

  document.getElementById("form").addEventListener("submit", function (e) {
    const checkEmail = $(".email-message").text().length;
    if (password.value.trim().length < 8) {
      alert("Không thể tạo tài khoản. Xin vui lòng thử lại!");
      e.preventDefault();
    } else if (password.value.trim() != passwordConfirm.value.trim()) {
      alert("Không thể tạo tài khoản. Xin vui lòng thử lại!");
      e.preventDefault();
    } else if (!checkbox.checked) {
      alert("Không thể tạo tài khoản. Xin vui lòng thử lại!");
      e.preventDefault();
    } else if (checkEmail > 1) {
      alert("Không thể tạo tài khoản. Xin vui lòng thử lại!");
      e.preventDefault();
    }
  });
})();
