paramCreateForm = function(obj){
	var form = document.createElement("form");
	
	for(key in obj){
		var param = document.createElement('input');
			param.setAttribute('type','hidden');
			param.setAttribute('name',key);
			param.setAttribute('value',obj[key]);
			form.appendChild(param);
	}
	
	return form;
}


isEmpty = function(obj){
	if(obj == "" || obj == null || obj == undefined)
		return true;
	else
		return false;
}