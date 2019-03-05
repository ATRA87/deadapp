const review = document.getElementById("new_review");
const starit = (ratingName) => {
  const rating = document.getElementById(`${ratingName}-container`);
  const stars = rating.querySelectorAll(".fa-star");
  var hiddenRating = document.getElementById(ratingName);
  var btn = document.getElementById("btn-rating");
  stars.forEach(star => {
    star.addEventListener('click', (event) => {
      for(let i = 4; i >= 0; i--){
        stars[i].classList.remove("yellow");
      }
      for(let i = 4; i >= 5 - star.id; i--){
        stars[i].classList.add("yellow");
      }

    });
    star.addEventListener('click', (event) => {
      btn.removeAttribute('disabled')
      hiddenRating.value = star.id;
      btn.classList.remove("disabled");
    });
  });
}

starit("communication_rating");
starit("quality_rating");
starit("delivery_on_time_rating");
