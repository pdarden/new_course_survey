Parse.initialize("MhRNAkuavC8yd6uRw1Sq7AkuJ71TNSC3nB7kV7sK", "DapW6mae14F4ienjxKqHxf30GGv1Pw8rowYwSpoj")

$(document).ready(function(){
/////////////////////////////

$('button.get-json').on('click', function() {
var Blamo = Parse.Object.extend("Blamo");
var blamo = new Blamo();
blamo.save({foo: "bar", bah: "bam"}).then(function(object) {
  alert("yayyyyyy! it worked");
});
})

///////////////
})