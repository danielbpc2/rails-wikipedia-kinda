const button = document.querySelector(".close");
const div = document.querySelector(".alert");

button.addEventListener("click", (event) => {
  div.remove()
})
