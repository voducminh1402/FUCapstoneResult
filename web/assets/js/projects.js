

// const filterBtn = document.getElementById("filter");
// const posts = document.getElementById("posts");
// const load = document.getElementById("load");
// let number = 1;

// var list;

// filterBtn.addEventListener("change", function () {
//   number = 1;
//   console.log("anh vui ve");
//   console.log(filterBtn.value);
//   $.ajax({
//     type: "POST",
//     url: `MainController?action=Filter`,
//     data: "filterValue=" + filterBtn.value,
//     dataType: "json",

//     //if received a response from the server
//     success: function (data) {
//       anh = data;

//       removeAllChildNodes(posts);
//       loadProject(data);
//     },
//   });
// });

// function removeAllChildNodes(parent) {
//   while (parent.firstChild) {
//     parent.removeChild(parent.firstChild);
//   }
// }

// load.addEventListener("click", function () {
//   number += 1;
//   $.ajax({
//     type: "POST",
//     url: `MainController?action=Filter`,
//     data: "filterValue=" + filterBtn.value,
//     dataType: "json",

//     //if received a response from the server
//     success: function (data) {
//       anh = data;

//       removeAllChildNodes(posts);
//       loadProject(data);
//     },
//   });
// });

// function loadProject(data) {
//   for (i = 0; i < number; i++) {
//     let commentContent = `<div class="project-detail col-sm-6 col-md-4">
//     <div class="project-content">
//       <div class="project-content-overlay">
//         <img
//           class="project-content-img"
//           src="${data[i].postImage}"
//           alt=""
//         />
//         <div class="project-content-text">
//           <span id="title">${data[i].postTitle}</span>
//           <h5>Web Development Framework</h5>
//           <span>View Project</span>
//         </div>
//       </div>
//     </div>
//   </div>`;

//     posts.insertAdjacentHTML("beforeend", commentContent);
//   }
// }
