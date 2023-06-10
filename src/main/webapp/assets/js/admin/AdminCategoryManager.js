/**
 * 
 */
const IdRowCategoryName = "CategoryName"
const IdBtnEditName = "edit_button";
const IdBtnDeleteName = "del_button";
const IdBtnSaveName = "save_button";

const IdEditChange = "EditChange"

function GenerateInputRowType(currentInput) {
	return `<input type='text' class='form-control' value='${currentInput}' aria-label='Category'>`;
}

function GenerateTextRowType(currentInput)
{
	return `<p class='p-0 m-0'>${currentInput}</p>`
}

/*
@param {number} no - number row
set cac id cua rowCategory trong <td>
*/
function EditRow(no) {
	
	SwitchEditBtnToChangeBtn(no)
	let rowCategoryName = document.getElementById(IdRowCategoryName+no);
	let queryInput = document.querySelector(`#${IdRowCategoryName+no} p`)
	let currentText = ""
	if(queryInput !== null)
	{
		currentText = queryInput.innerHTML;
	}
	rowCategoryName.innerHTML = GenerateInputRowType(currentText);
	
	
}


function OnCancelEdit(no)
{
	SwitchChangeBtnToEditBtn(no);
	let textInput = document.querySelector(`#${IdRowCategoryName+no} input`);
	let rowCategoryName = document.getElementById(IdRowCategoryName+no);
	
	if(textInput !== null)
	{
		currentValueInput = textInput.value;
	}
	rowCategoryName.innerHTML = GenerateTextRowType(currentValueInput);
}

function OnConfirmEdit(no)
{
	SwitchChangeBtnToEditBtn(no)
	
	let currentValueInput = "";
	
	let rowCategoryName = document.getElementById(IdRowCategoryName+no);
	
	
	rowCategoryName.innerHTML = GenerateTextRowType(currentValueInput);
}

function SwitchEditBtnToChangeBtn(no)
{
	document.getElementById(IdBtnEditName + no).style.display = "none";
	document.getElementById(IdBtnDeleteName + no).style.display = "none";
	document.getElementById(IdEditChange + no).style.display = "block";
}

function SwitchChangeBtnToEditBtn(no)
{
	document.getElementById(IdEditChange + no).style.display = "none";
	document.getElementById(IdBtnEditName + no).style.display = "block";
	document.getElementById(IdBtnDeleteName + no).style.display = "block";
}

function AddRow()
{
	
}