var viewbtn = document.querySelector('#view-profile-btn');
var editbtn = document.querySelector('#edit-profile-btn');
var savebtn = document.querySelector('#save-profile-btn');

viewbtn.addEventListener('click', function(){
	if(!viewbtn.classList.contains('active'))
	{
		viewbtn.classList.add('active');
	}
	editbtn.classList.remove('active');
	document.querySelector('table').style.display = 'table';
	document.querySelector('#edit-profile').style.display = 'none';
	document.querySelector('#edit-note').style.display = 'none';
});

editbtn.addEventListener('click', function(){
	if(!editbtn.classList.contains('active'))
	{
		editbtn.classList.add('active');
	}
	viewbtn.classList.remove('active');
	document.querySelector('table').style.display = 'none';
	document.querySelector('#edit-profile').style.display = 'block';
	document.querySelector('#edit-note').style.display = 'block';
});

savebtn.addEventListener('click', function(){
	window.location.href = "updateCustomerProfile.jsp";
});
