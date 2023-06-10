let provinceSelect, districtSelect, wardSelect;
let wards, districts;

function FilterDistrictBasedProvince(selectedProvince) {
	districts.filter(function(district) {
		return district.provinceId === selectedProvince;
	}).forEach(function(district) {
		var option = document.createElement('option');
		option.value = district.id;
		option.text = district.name;
		districtSelect.appendChild(option);
	});
}

function FilterWardBasedDistrict(selectedDistrict) {
	wards.filter(function(ward) {
		return ward.districtId === selectedDistrict;
	}).forEach(function(ward) {
		var option = document.createElement('option');
		option.value = ward.id;
		option.text = ward.name;
		wardSelect.appendChild(option);
	});
}


function lazyLoading() {
	const dataDistrict = 'data-district';
	const dataProvince = 'data-province'

	provinceSelect = document.getElementById('province');
	districtSelect = document.getElementById('district');
	wardSelect = document.getElementById('ward');

	districts = Array.from(districtSelect.options).map(function(option) {
		return {
			id: option.value,
			name: option.text,
			provinceId: option.dataset.province
		};
	});
	//console.log(districts[1].provinceId, districts[1].name);
	wards = Array.from(wardSelect.options).map(function(option) {
		return {
			id: option.value,
			name: option.text,
			districtId: option.dataset.district
		};
	});

	districtSelect.options.length = 1;
	wardSelect.options.length = 1;

	provinceSelect.addEventListener('change', function() {
		//Get ID Province
		let selectedProvince = provinceSelect.value;

		//Reset length for everything
		districtSelect.options.length = 1;
		wardSelect.options.length = 1;
		FilterDistrictBasedProvince(selectedProvince, districts);
	});

	districtSelect.addEventListener('change', function() {
		//Get ID Province
		let selectedDistrict = districtSelect.value;

		//Reset length for everything
		wardSelect.options.length = 1;
		FilterWardBasedDistrict(selectedDistrict, wards);
	})


	CloseForm();

}


function UpdateAddress(addressId, wardId, districtId, provinceId, addressLine) {
	//Refresh
	districtSelect.options.length = 1;
	wardSelect.options.length = 1;

	//Set up the action for the form
	let idForm = 'address-form';

	

	//Post Data from update button
	provinceSelect.value = provinceId;
	//Filter before select next value
	FilterDistrictBasedProvince(provinceSelect.value, districts);
	
	districtSelect.value = districtId;
	
	FilterWardBasedDistrict(districtSelect.value, wards);
	wardSelect.value = wardId;
	//
	let addressinput = document.getElementById('address-input');
	addressinput.value = addressLine;

	//Open the form
	let addressPanel = document.getElementById('address-form-panel');
	addressPanel.classList.remove('hidden');
}

function CloseForm() {
	//Close the form
	let addressPanel = document.getElementById('address-form-panel');
	addressPanel.classList.add('hidden');
}

function CreateAddress() {
	//Set up the action for the form
	let idForm = 'address-form';
	var form = document.getElementById(idForm);
	form.setAttribute('action', 'create-address.htm');

	//clear the id address(if have clicked updatebtn before)
	provinceSelect.selectedIndex = 0;
	//
	let addressinput = document.getElementById('address-input');
	addressinput.value = "";

	//Open the form
	let addressPanel = document.getElementById('address-form-panel');
	addressPanel.classList.remove('hidden');
}