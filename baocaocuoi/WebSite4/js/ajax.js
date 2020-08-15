function request(url,locate)
{
	var xmlHttp;
	//alert (form.name);
	try
	{
		xmlHttp=new XMLHttpRequest();
	}catch(e)
	{
		try
		{
			xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
		}catch(e)
		{
			xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");				
		}
	}
	xmlHttp.onreadystatechange=function(){
		if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){
			//alert (xmlHttp.responseText);
			document.getElementById(locate).innerHTML=xmlHttp.responseText;
		}
	}
	xmlHttp.open("post",url,true);
	xmlHttp.send(null);
}
function cls_check()
{
	this.test=request;
}