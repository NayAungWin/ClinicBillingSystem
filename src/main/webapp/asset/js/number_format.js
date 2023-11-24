let Form = document.querySelector('#inputPrice');
let inputField = document.querySelector('#money');

// Form.addEventListener('submit', (e) => {
//   e.preventDefault();

  let Amount = inputField.value;
  let formatted = new Intl.NumberFormat("en-US", {
    style: 'currency',
      }).format(Amount);

  inputField.value = formatted;