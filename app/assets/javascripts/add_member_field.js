const btn = document.querySelector('#add-btn');
const membersForm = document.querySelector('#members');
const memberField = document.querySelector('#project_user_ids');
const options = memberField.querySelectorAll('option');

options.forEach(option => {
  console.log(option);
  option.addEventListener('click', (event) => {
    membersForm.insertAdjacentHTML('beforeend', `<select class="form-control select optional" name="project[user_ids][]" id="project_user_ids">`+memberField.innerHTML+`</select>`);
    console.log(hola);
  });
});
btn.addEventListener('click', (event) => {
  membersForm.insertAdjacentHTML('beforeend', `<select class="form-control select optional" name="project[user_ids][]" id="project_user_ids"> <option value=""></option>`+memberField.innerHTML+`</select>`);
  console.log(memberField.innerHTML);
});
