function result (){
  const select1 = document.getElementById("select1");
  const select2 = document.getElementById("select2");
  const select3 = document.getElementById("select3");
  const select4 = document.getElementById("select4");
  const select5 = document.getElementById("select5");

  const holding = document.getElementById("holding").value;
  const physical = document.getElementById("physical").value;
  const move = document.getElementById("move").value;
  const positioning = document.getElementById("positioning").value;
  const footwork = document.getElementById("footwork").value;
  const coordination = document.getElementById("coordination").value;

  select1.addEventListener("click", function() {
    document.getElementById("result-holding").value = holding * 1.5;
    document.getElementById("result-physical").value = physical * 1.5;
    document.getElementById("result-move").value = move * 1.5;
    document.getElementById("result-positioning").value = positioning * 1.5;
    document.getElementById("result-footwork").value = footwork * 1.5;
    document.getElementById("result-coordination").value = coordination * 1.5;
  })
  select2.addEventListener("click", function() {
    document.getElementById("result-holding").value = holding * 1.3;
    document.getElementById("result-physical").value = physical * 1.3;
    document.getElementById("result-move").value = move * 1.3;
    document.getElementById("result-positioning").value = positioning * 1.3;
    document.getElementById("result-footwork").value = footwork * 1.3;
    document.getElementById("result-coordination").value = coordination * 1.3;
  })
  select3.addEventListener("click", function() {
    document.getElementById("result-holding").value = holding * 1.2;
    document.getElementById("result-physical").value = physical * 1.2;
    document.getElementById("result-move").value = move * 1.2;
    document.getElementById("result-positioning").value = positioning * 1.2;
    document.getElementById("result-footwork").value = footwork * 1.2;
    document.getElementById("result-coordination").value = coordination * 1.2;
  })
  select4.addEventListener("click", function() {
    document.getElementById("result-holding").value = holding;
    document.getElementById("result-physical").value = physical;
    document.getElementById("result-move").value = move;
    document.getElementById("result-positioning").value = positioning;
    document.getElementById("result-footwork").value = footwork;
    document.getElementById("result-coordination").value = coordination;
  })
  select5.addEventListener("click", function() {
    document.getElementById("result-holding").value = holding * 0.5;
    document.getElementById("result-physical").value = physical * 0.5;
    document.getElementById("result-move").value = move * 0.5;
    document.getElementById("result-positioning").value = positioning * 0.5;
    document.getElementById("result-footwork").value = footwork * 0.5;
    document.getElementById("result-coordination").value = coordination * 0.5;
  })
};

window.addEventListener("load", result);