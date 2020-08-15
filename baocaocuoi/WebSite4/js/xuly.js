function type(form,dieukhien,ten,giatri,kieu,maxleng)
{
	var match_chuoikt=/^[A-Za-z ]+$/;
	var match_chuoikkt=/^[A-Za-z]+$/;
	var match_chuoisokt=/^[A-Za-z0-9_ ]+$/;
	var match_chuoisokkt=/^[A-Za-z0-9]+$/;
	var match_songuyen=/^[0-9]+$/;
	var match_sothuc=/^[0-9.]+$/;
	var match_ngaysinh=/^[0-9]{1,2}\/[0-9]{1,2}\/[0-9]{4}$/;
	var match_email_1=/^[a-zA-Z0-9_]+\@[a-zA-Z]+\.[a-z]+$/;
	var match_email_2=/^[a-zA-Z0-9_]+\@[a-zA-Z]+\.[a-z]+\.[a-zA-Z]+$/;
	var match_hinhanh=/^[A-Za-z0-9.\\_ ]+$/;
	switch(kieu)//1:chuoikt;2:chuoikkt;3:chuoisokt;4:chuoisokkt;5:songuyen;6:sothuc;7:ngaysinh;8:email
	{
		case 1:
		{
			if(!match_chuoikt.test(giatri))
			{
				alert (ten + " khong hop le");
				eval(form + "." + dieukhien + ".focus()");
				return false;
			}
			else
			{
				if(maxleng>0)
					if(giatri.length>maxleng)
					{
						alert ("Gia tri nhap khong duoc lon hon " +maxleng +" ky tu");
						eval(form + "." + dieukhien + ".focus()");
						return false;
					}
				return true;
			}
		}
		case 2:
		{
		}
		case 3:
		{
			if(!match_chuoisokt.test(giatri))
			{
				alert (ten + " khong hop le");
				eval(form + "." + dieukhien + ".focus()");
				return false;
			}
			else
			{
				if(maxleng>0)
					if(giatri.length>maxleng)
					{
						alert ("Gia tri nhap khong duoc lon hon " +maxleng +" ky tu");
						eval(form + "." + dieukhien + ".focus()");
						return false;
					}
				return true;
			}
		}
		case 4:
		{
		}
		case 5:
		{
			if(!match_songuyen.test(giatri))
			{
				alert (ten + " khong hop le");
				eval(form + "." + dieukhien + ".focus()");
				return false;
			}
			else
			{
				if(maxleng>0)
					if(giatri.length>maxleng)
					{
						alert ("Gia tri nhap khong duoc lon hon " +maxleng +" ky tu");
						eval(form + "." + dieukhien + ".focus()");
						return false;
					}
				return true;
			}
		}
		case 6:
		{
			if(!match_sothuc.test(giatri))
			{
				alert (ten + " khong hop le");
				eval(form + "." + dieukhien + ".focus()");
				return false;
			}
			else
			{
				if(maxleng>0)
					if(giatri.length>maxleng)
					{
						alert ("Gia tri nhap khong duoc lon hon " +maxleng +" ky tu");
						eval(form + "." + dieukhien + ".focus()");
						return false;
					}
				return true;
			}
		}
		case 7:
		{
			if(!match_ngaysinh.test(giatri))
			{
				alert (ten + " khong hop le");
				eval(form + "." + dieukhien + ".focus()");
				return false;
			}
			else
			{
				if(maxleng>0)
					if(giatri.length>maxleng)
					{
						alert ("Gia tri nhap khong duoc lon hon " +maxleng +" ky tu");
						eval(form + "." + dieukhien + ".focus()");
						return false;
					}
				else
				{
					var mang=giatri.split("/");
					var ngay=parseInt(mang[0]);
					var thang=parseInt(mang[1]);
					var nam=parseInt(mang[2]);
					if(ngay>31 || thang>12)
					{
						alert ("Ngay khong duoc lon hon 31 va thang khong duoc lon hon 12");
						eval(form + "." + dieukhien + ".focus()");
						return false;
					}
					var namnhuan=false;
					if(nam%4==0)
						namnhuan=true;
					switch(thang)
					{
						case 4:
						case 6:
						case 9:
						case 11:
						{
							if(ngay>30)
							{
								alert ("Thang " + thang + " khong duoc qua 30 ngay");
								eval(form + "." + dieukhien + ".focus()");
								return false;
							}
						}
						case 2:
						{
							if(namnhuan)
							{
								if(ngay>29)
								{
									alert ("Nam " + nam + " thi thang " + thang + " khong duoc qua 29 ngay");
									eval(form + "." + dieukhien + ".focus()");
									return false;
								}
							}
							else
							{
								if(ngay>28)
								{
									alert ("Nam " + nam + " thi thang " + thang + " khong duoc qua 28 ngay");
									eval(form + "." + dieukhien + ".focus()");
									return false;
								}
							}
						}
					}
				}
				return true;
			}
		}
		case 8:
		{
			if(!match_email_1.test(giatri))
			{
				if(!match_email_2.test(giatri))
				{
					alert (ten + " khong hop le");
					eval(form + "." + dieukhien + ".focus()");
					return false;
				}
				else
				{
					if(maxleng>0)
						if(giatri.length>maxleng)
						{
							alert ("Gia tri nhap khong duoc lon hon " +maxleng +" ky tu");
							eval(form + "." + dieukhien + ".focus()");
							return false;
						}
					return true;
				}
			}
			else
			{
				if(maxleng>0)
					if(giatri.length>maxleng)
					{
						alert ("Gia tri nhap khong duoc lon hon " +maxleng +" ky tu");
						eval(form + "." + dieukhien + ".focus()");
						return false;
					}
				return true;
			}
		}
		case 9:
		{
			if(!match_hinhanh.test(giatri))
			{
				alert (ten + " khong hop le");
				eval(form + "." + dieukhien + ".focus()");
				return false;
			}
			else
			{
				if(maxleng>0)
					if(giatri.length>maxleng)
					{
						alert ("Gia tri nhap khong duoc lon hon " +maxleng +" ky tu");
						eval(form + "." + dieukhien + ".focus()");
						return false;
					}
				return true;
			}
		}
	}
}
function convert(str)
{
	//alert (str);
	var coDau=new Array("à","á","ạ","ả","ã","â","ầ","ấ","ậ","ẩ","ẫ","ă","ằ","ắ","ặ","ẳ","ẵ","è","é","ẹ","ẻ","ẽ","ê","ề" ,"ế","ệ","ể","ễ","ì","í","ị","ỉ","ĩ","ò","ó","ọ","ỏ","õ","ô","ồ","ố","ộ","ổ","ỗ","ơ","ờ","ớ","ợ","ở","ỡ","ù","ú","ụ","ủ","ũ","ư","ừ","ứ","ự","ử","ữ","ỳ","ý","ỵ","ỷ","ỹ","đ","ê","ù","À","Á","Ạ","Ả","Ã","Â","Ầ","Ấ","Ậ","Ẩ","Ẫ","Ă","Ằ","Ắ","Ặ","Ẳ","Ẵ","È","É","Ẹ","Ẻ","Ẽ","Ê","Ề" ,"Ế","Ệ","Ể","Ễ","Ì","Í","Ị","Ỉ","Ĩ","Ò","Ó","Ọ","Ỏ","Õ","Ô","Ồ","Ố","Ộ","Ổ","Ỗ","Ơ","Ờ","Ớ","Ợ","Ở","Ỡ","Ù","Ú","Ụ","Ủ","Ũ","Ư","Ừ","Ứ","Ự","Ử","Ữ","Ỳ","Ý","Ỵ","Ỷ","Ỹ","Đ","Ê","Ù");

	var khongDau=new Array("a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","e","e","e","e","e","e","e","e","e","e","e","i","i","i","i","i","o","o","o","o","o","o","o","o","o","o","o","o","o","o","o","o","o","u","u","u","u","u","u","u","u","u","u","u","y","y","y","y","y","d","e","u","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","E","E","E","E","E","E","E","E","E","E","E","I","I","I","I","I","O","O","O","O","O","O","O","O","O","O","O","O","O","O","O","O","O","U","U","U","U","U","U","U","U","U","U","U","Y","Y","Y","Y","Y","D","E","U");
	var ketqua="";
	var len_chuoi=str.length;
	var len_mang=coDau.length;
	var i,j;
	for(i=0;i<len_chuoi;i++)
	{
		var kytu=str.charAt(i);
		for(j=0;j<len_mang;j++)
			if(kytu==coDau[j])
			{
				ketqua+=khongDau[j];
				//alert (ketqua);
				break;
			}
		if(j==len_mang)
			ketqua+=kytu;
	}
	//alert (ketqua);
	return ketqua;
}
function addtocart(object)
{
	var name=object.name
	var masp=name.substring(3);
	//alert (masp);
	var soluong=eval("document.getElementById('txt" + masp + "').value");
	//alert (soluong);
	var match_songuyen=/^[0-9]+$/;
	if(!match_songuyen.test(soluong))
	{
		alert ("Gia tri nhap khong hop le");
		eval("document.getElementById('txt" + masp + "').focus()");
		return false;
	}
	else if(soluong==0)
	{
	    alert ("Gia tri nhap khong hop le");
		eval("document.getElementById('txt" + masp + "').focus()");
		return false;
	}
	soluong=parseInt(soluong);
	//alert (soluong);
	var link="capnhatgiohang.aspx?masp=" + masp + "&soluong=" + soluong;
	//alert (link);
	var cls=new cls_check();
	cls.test(link,"giohang");
	eval("document.getElementById('txt" + masp + "').value=1");
	alert ("Da them san pham vao gio hang");
	return true;
}
function over(object)
{
	if(object.style.color!="blue")
		object.style.color="#00CC99";
}
function out(object)
{
	if(object.style.color!="blue")
		object.style.color="#999900"
}
function go(object)
{
	//alert (object.id);
	if(object.id=="menu1" || object.id=="menu2")
	{
		if(object.style.color!="blue")
		{
			object.style.color="blue";
			for(i=1;i<=2;i++)
			{
				var element=eval("document.getElementById('" + object.id + i + "')");
				element.style.display='';
			}
		}
		else
		{
			object.style.color="#999900";
			for(i=1;i<=2;i++)
			{
				var element=eval("document.getElementById('" + object.id + i + "')");
				element.style.display='none';
				element.style.color="#999900";
			}
		}
	}
	else
	{
		for(i=1;i<=2;i++)
		{
			var parent="menu" + i;
			var flag=false;//bien kiem tra dang click tren menu con nao
			//alert (parent);
			for(j=1;j<=2;j++)
			{
				var element=eval("document.getElementById('" + parent + j + "')");
				//alert (element.id==object.id);
				if(element.id==object.id)
				{
					element.style.color="blue";
					flag=true;//neu da click len menu nay thi khong can kiem tra menu con lai
				}
				else
				{
					element.style.color="#999900";
				}
				//alert (flag);
			}
			if(flag)
				break;
		}
	}
	if(object.id=="menu11")
		location.href="suathongtin.php?style=1";
	else if(object.id=="menu12")
		location.href="doimatkhau.php";
	else if(object.id=="menu21")
		location.href="nhaplieu.php";
	else if(object.id=="menu22")
		location.href="danhsachbang.php";
}
function kiemtra()
{
	this.kieu=type;
	this.chuyendoi=convert;
}
