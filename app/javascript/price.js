function cul (){
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("input", () => {
    const price = parseFloat(itemPrice.value);
    const addTaxDom = document.getElementById('add-tax-price')
    addTaxDom.innerHTML = Math.floor(itemPrice.value * 0.1)
    const profit = document.getElementById('profit')
    profit.innerHTML = Math.floor(itemPrice.value - Math.floor(itemPrice.value * 0.1))
  });
  };

window.addEventListener('turbo:load', cul);
window.addEventListener('turbo:render', cul); 