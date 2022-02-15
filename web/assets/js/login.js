$(document).ready(function () {
  const email = localStorage.getItem("email");
  const pass = localStorage.getItem("pass");
  if (email) $("#email").val(email);
  if (pass) $("#password").val(pass);
});

const loginBtn = document.getElementById("login");
loginBtn.addEventListener("click", login);
function login() {
  debugger;
  const email = $("#email").val();
  const pass = $("#password").val();
  localStorage.setItem("email", email);
  if ($("#checbox").prop("checked", true)) localStorage.setItem("pass", pass);
  else localStorage.removeItem("pass");
  window.location.reload();
}
