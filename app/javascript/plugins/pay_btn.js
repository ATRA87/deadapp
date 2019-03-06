const initStripe = () => {
  const payBtn = document.getElementById("order-pay-btn");
  const stripe = document.querySelector(".stripe-button-el");

  if (payBtn) {
    payBtn.addEventListener('click', (event) => {
      stripe.click();
    });
  }
};

initStripe();
