/*
function anzeigen(das) {
	if (document.getElementById(das).style.display=='none') {
		document.getElementById(das).style.display='block';
	} else {
		document.getElementById(das).style.display='none';
	}
}


function toggleOne() {
	var allElements;
	if (document.getElementsByTagName) {
		allElements = document.getElementsByTagName('*');
		if (allElements.length == 0 && document.all) {
			allElements = document.all;
		}
	}
	
	for(i=0; i<allElements.length; i++) {
		a = allElements[i];
		if( a.getAttribute("class", "false")){
			if(a.getAttribute("class", "false")=="focused"){
				a.focus();
				break;
			}
		}
	}
}
*/

function toggle() {
	var oldPostElements;
	var showAllElements;
	var showNewElements
	if (document.getElementsByName) {
		oldPostElements = document.getElementsByName('oldPost');
		showAllElement = document.getElementById('showAll');
		showNewElement = document.getElementById('showNew');
		
		for (i=0; i<oldPostElements.length; i++) {
			oldPost = oldPostElements[i];
			if (oldPost.style.display=='none') {
				oldPost.style.display='block';
				
				showAllElement.style.display='none';
				showNewElement.style.display='block';
			} else {
				oldPost.style.display='none';
				
				showAllElement.style.display='block';
				showNewElement.style.display='none';
			}
			
		}
		
	}
}
