const addBtn = document.querySelector('#add-btn');

if (addBtn) {
  const membersForm = document.querySelector('#members');
const memberField = document.querySelector('#project_user_ids');
 const options = memberField.querySelectorAll('option');



addBtn.addEventListener('click', (event) => {
  membersForm.insertAdjacentHTML('beforeend', `<div class="selector-field" style="display: flex; align-items: center;">
        <select class="form-control select optional" name="project[user_ids][]" id="project_user_ids"><option value=""></option>`+memberField.innerHTML+`</select>
        <div id="delete-btn" style="margin-left: 10px;"><i class="far fa-trash-alt" id="delete-btn"></i></div>
      </div>`);
});

const deleteBtns = document.querySelectorAll('#delete-btn');

deleteBtns.forEach(deleteBtn => {
  deleteBtn.addEventListener('click', (event) => {
    deleteBtn.parentNode.remove();
    // console.log(deleteBtn.parentNode);
  });
});


var modal = document.getElementById('form-modal');

// Get the button that opens the modal
var btn = document.getElementById("edit-btn");


// When the user clicks on the button, open the modal
btn.onclick = function() {

  modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}
}
