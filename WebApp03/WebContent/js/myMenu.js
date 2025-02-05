/**
 * myMenu.js
 */

/*
function myMenu1()
{
	// 확인
	alert("myMenu1 호출 확인~!!!");
}

function myMenu2()
{
	// 확인
	alert("myMenu2 호출 확인~!!!");
}
*/

function myMenu(status)
{
	// 확인
	//alert("함수 호출 확인~!!!");
	
	// 확인
	//alert("status : " + status);
	
	var menu = document.getElementById("menuTable");
	
	if (status==1)
	{
		// 확인
		//alert("1번 확인~!!!");
		//<div id="menuTable" style="display: block;"> 하는 것과 똑같다.
		menu.style.display = "block";					//블록단위로 그린다.
		// display 속성은 렌더링을 어떻게 시키느냐 관여하는 속성(어떻게 그릴지 정하는)
		// none(안 그린다), inline-none, block, inline-block(라인단위로 그린다.)
	}
	else
	{
		// 확인
		//alert("2번 확인~!!!");
		
		menu.style.display = "none";
	}
	
}