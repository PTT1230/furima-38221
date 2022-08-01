//const priceInput = document.getElementById("item-price");
//priceInput.addEventListener("input", () => {
   //console.log("イベント発火");
//})

//const priceInput = document.getElementById("item-price");
//console.log(priceInput);

//window.addEventListener('load', () => {
  //console.log("OK");
//});
window.addEventListener('load', function(){
const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor( parseInt(inputValue) * 0.1 );
    const profitDom = document.getElementById('profit');
    profitDom.innerHTML = Math.floor( parseInt(inputValue) - parseInt(addTaxDom.innerHTML) );
  })
})