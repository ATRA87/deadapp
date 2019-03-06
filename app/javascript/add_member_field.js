const modal = document.getElementById('form-modal');
// Get the button that opens the modal

if (modal){
  const btn = document.getElementById("edit-btn");
  // When the user clicks on the button, open the modal
  btn.onclick = function() {
    modal.style.display = "block";
  }
  // When the user clicks anywhere outside of the modal, close it
  window.onclick = function(event) {
    if (event.target == modal) {
      modal.style.display = "none";
    }
  }
}

const addNewMemberBox = () => {
  const membersForm = document.querySelector('#members');

  if (membersForm) {
    const memberField = membersForm.lastElementChild;
    memberField.addEventListener('change', event => {
      membersForm.insertAdjacentHTML('beforeend', `<div class='member-addon-wrapper'>${memberField.innerHTML}</div>`)
      addNewMemberBox();
      removeMemberBox();
    })
  }
}

const removeMemberBox = () => {
  const deleteBox = document.querySelectorAll('.delete-btn');

  if (deleteBox[0]) {
    deleteBox.forEach(box => {
      box.addEventListener('click', event => {
        box.parentElement.remove();
      })
    })
  }
}

addNewMemberBox();
removeMemberBox();
