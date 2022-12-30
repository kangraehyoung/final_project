const allBars = document.querySelectorAll(".bar");
allBars.forEach(bar => {
  const barValue = bar.getAttribute("data-bar-value");
  bar.setAttribute('style', `--__bar_ht: ${barValue}px;`);
})