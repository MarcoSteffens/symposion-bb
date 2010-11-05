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

function toggle() {
	var newPostElements;
	if (document.getElementsByName) {
		newPostElements = document.getElementsByName('oldPost');
		
		for (i=0; i<newPostElements.length; i++) {
			newPost = newPostElements[i];
			if (newPost.style.display=='none') {
				newPost.style.display='block';
			} else {
				newPost.style.display='none';
			}
			
		}
		
	}
}






