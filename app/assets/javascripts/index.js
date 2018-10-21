

// Form submit info
const ratesForm = document.getElementById('ratesForm');

function rateRequest(city){//main program
  ratePrint("");
  const miles = searchList(city); //searches array for cityMiles
  if(miles>1){//if city in list
    const rate = calculateRate(miles); //calculate rate based on miles from start Location
    const fsc = calculateFsc(rate); //calculate fsc based on rate
    const drayText = rateText(city, rate, fsc); //add dray rate string to ar
    const drayAccessorials = accessorialText(accessorialRates); //concat string to new var
    const rateHtml = drayText + drayAccessorials; //concat strings to new var
    ratePrint(rateHtml) //prints string to ratesOutput
  }
}


//create function to check list for dray Location city
function searchList(city){ //takes city name
  let cityFound = false;
  for (let i = 0; i < cityMiles.length; i++) { //iterates for city through list
    if(city.toLowerCase()===cityMiles[i].city.toLowerCase()){ //if drayLocation is found
      cityFound = true; //flags cityFound as true
      return cityMiles[i].miles; //
    }
  }
  if (cityFound == false) {//if city isn't found
    alert('city not found in list');  //alerts user they are shit out of luck
  }
}

function calculateRate(miles){
  const baseRate = 175;
  const baseCpm = 2.50;
  const drayRate = baseRate + (baseCpm * miles);
  return drayRate;
}

function calculateFsc(rate){
  const baseFsc = .25;
  const drayFsc = baseFsc * rate;
  return drayFsc;
}

function rateText(city, rate, fsc){
  let message = "";
  message+="<p>Thank you for using our drayage rate calculator.</p>";
  message+="<p>See below drayage rate from the Ports of LA/LB to "+city+", CA.</p>";
  message+="<p>Base rate: $"+rate+", FSC @ 25%: $"+fsc+". Same day pickup/delivery, legal size/weight, non-hazardous.</p>";
  return message;
}

function accessorialText(accessorials){
  let message = "<ul>";
  for(let i=0;i<accessorials.length;i+=1){
    message+="<li>"+accessorials[i].name+": $"+accessorials[i].rate+", "+accessorials[i].description+"</li>"
  }
  message+="</ul>";
  return message;
}


function ratePrint(message){ //print output to rateOutput
  const ratesOutput = document.getElementById('ratesOutput');
  ratesOutput.innerHTML = message;
}
// ---------------------

// //program starts on submit click or enter key
// ratesForm.addEventListener('submit', (event) => {
//   event.preventDefault(); //stops page from resetting
//   const city = drayLocation.value;
//   drayLocation.value = ""; //clears input
//   rateRequest(city); //runs program
// })

$('document').ready(function(){

  var submit = document.getElementById('submit');
  if(submit) {
      document.getElementById("submit").addEventListener("click", function(){
      event.preventDefault(); //stops page from resetting
      const city = drayLocation.value;
      drayLocation.value = ""; //clears input
      rateRequest(city); //runs program
    });
  }
});