let available_number = document.querySelector("#buy");
let available_currency = document.querySelector("#select_buy");

let resulting_number = document.querySelector("#sell");
let resulting_currency = document.querySelector("#select_sell");

function action() {
    resulting_number.textContent = available_number.value * available_currency.value;
}

available_number.oninput = function () {
    return action()
}

resulting_number.oninput = function () {
    return action()
}

resulting_number.onchange = function () {
    return action()
  }

resulting_currency.onchange = function () {
  return action()
}