const expand = () => {
  const expantdBtn = document.getElementById('expand-btn');

  if (expantdBtn) {
    const description = document.querySelector(".project-description");
    expantdBtn.addEventListener('click', (event) => {
      console.log("hla");
      description.classList.remove('short-description');
      expantdBtn.remove();
    });
  }
}


expand();
