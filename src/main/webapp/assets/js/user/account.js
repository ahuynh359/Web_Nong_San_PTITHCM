setTimeout(function() {
	bootstrap.Alert.getOrCreateInstance(document.querySelector(".alert"))
		.close();
}, 1000)


var loadFile = function(event) {
		var output = document.getElementById('output');
		$("#output").show();
		output.src = URL.createObjectURL(event.target.files[0]);
		output.onload = function() {
			URL.revokeObjectURL(output.src) // free memory
		}
	};