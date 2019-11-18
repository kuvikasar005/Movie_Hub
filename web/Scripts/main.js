/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var login = document.querySelector('#login-btn');
var search = document.querySelector('#search-btn');

login.addEventListener('click',function (){
	if(document.querySelector('#container').style.display === 'none')
	{
		
		document.querySelector('#container').style.display = 'block';
		
		document.querySelector('#search').style.display = 'none';
	}
	else
		
		document.querySelector('#container').style.display = 'none';
});

search.addEventListener('click',function (){
	if(document.querySelector('#search').style.display === 'none')
	{
		document.querySelector('#search').style.display = 'block';
		document.querySelector('#container').style.display = 'none';
		
	}
	else
		document.querySelector('#search').style.display = 'none';
});

var signUpButton = document.getElementById('signUp');
var signInButton = document.getElementById('signIn');
var container = document.getElementById('container');

signUpButton.addEventListener('click', function() {
    container.classList.add('right-panel-active');
});

signInButton.addEventListener('click', function() {
    container.classList.remove('right-panel-active');
});
