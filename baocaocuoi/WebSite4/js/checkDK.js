// JavaScript Document
	String.prototype.trim = function() { return this.replace(/^\s+|\s+$/g, ""); };
	function check_dk(form)
	{
		var kt=new kiemtra();
		var hoten=form.hoten.value;
		hoten=kt.chuyendoi(hoten);
		var ngaysinh=form.ngaysinh.value;
		var dienthoai=form.phone.value;
		var diachi=form.diachi.value;
		diachi=kt.chuyendoi(diachi);
		var quocgia=form.quocgia.value;
		var tinh=form.tinh.value;
		var cauhoibimat=form.cauhoi.value;
		var cauTL=form.cauTL.value;
		cauTL=kt.chuyendoi(cauTL);
		var pass=form.pass.value;
		var repass=form.repass.value;
		var user=form.user.value;
		user=user.trim();
		user=kt.chuyendoi(user);
		var email=form.Email.value;
		email=email.trim();
		var maxacnhan=document.getElementById("maxacnhan").innerText;
		maxacnhan=maxacnhan.trim();
		//alert (maxacnhan);
		var ma=form.ma.value;
		ma=ma.toLowerCase();
		var flag=true;
		//truyen theo: tenform;ten dieu khien;ten tuong trung cua dieu khien;gia tri cua dieu khien;kieu kiem tra;so ky tu toi da duoc phep nhap
		//kieu kiem tra co 8 loai:1->ky tu co khoang trang;2->ky tu khong co khoang trang;3->ky tu chu va so co khoang trang;4->ky tu chu va so khong co khoang trang;5->so nguyen;6->so thuc;7->kieu ngay thang nam;8:kieu email
		if(flag)
			flag=kt.kieu(form.name,"hoten","Ho ten",hoten,1,30);
		if(flag)
			flag=kt.kieu(form.name,"ngaysinh","Ngay sinh",ngaysinh,7,10);
		if(flag)
			flag=kt.kieu(form.name,"phone","Dien thoai",dienthoai,5,15);
		if(flag)
			flag=kt.kieu(form.name,"diachi","Dia chi",diachi,3,100);
		if(flag)
			if(quocgia=="")
			{
				alert ("Ban chua chon quoc gia");
				form.quocgia.focus();
				flag=false;
			}
			else
				if(quocgia=="vn")
					if(tinh=="")
					{
						alert ("Ban chua chon tinh thanh pho");
						form.tinh.focus();
						flag=false;
					}
		if(flag)
			if(cauhoibimat=="")
			{
				alert ("Ban chua chon cau hoi bi mat");
				form.cauhoi.focus();
				flag=false;
			}
		if(flag)
			if(cauhoibimat=="2")
				flag=kt.kieu(form.name,"cauTL","Cau tra loi",cauTL,7,10);
			else
				flag=kt.kieu(form.name,"cauTL","Cau tra loi",cauTL,3,50);
		if(flag)
			flag=kt.kieu(form.name,"user","User name",user,3,30);
		if(flag)
			flag=kt.kieu(form.name,"pass","Password",pass,3,20);
		//alert (pass.length<6);
		if(flag)
			if(pass.length<6)
			{
				alert ("Password phai chua it nhat 6 ky tu");
				form.pass.focus();
				flag=false;
			}
		if(flag)
			if(pass!=repass)
			{
				alert ("2 o mat ma phai giong nhau");
				flag=false;
			}
		if(flag)
			flag=kt.kieu(form.name,"Email","Email",email,8,50);
		if(flag)
		{
			if(ma!=maxacnhan)
			{
				alert ("Ma xac nhan khong hop le");
				form.ma.focus();
				flag=false;
			}
		}
		if(flag)
			if(document.getElementById("error_user").innerHTML=="*")
			{
				var giatri=document.getElementById("user").value;
				alert ("Tai khoan " + giatri + " da co nguoi su dung");
				flag=false;
			}
		if(flag)
			if(document.getElementById("error_email").innerHTML=="*")
			{
				var giatri=document.getElementById("email").value;
				alert ("Email " + giatri + " da co nguoi su dung");
				flag=false;
			}
		return flag;
	}
	function check_reg(object)
	{
		var giatri=document.getElementById(object.name).value;
		//alert (giatri);
		var chk=new cls_check();
		if(object.name=="user")
		{
			document.getElementById("error_user").value="";
			var link="ktra_dangky.aspx?user=" + giatri;
			chk.test(link,"error_user");
		}
		else
		{
			document.getElementById("error_email").value="";
			var link="ktra_dangky.aspx?email=" + giatri;
			chk.test(link,"error_email");
		}
	}
	function disable(value)
	{
		if(value=="vn")
			dangky.tinh.disabled=false;
		else
			dangky.tinh.disabled=true;
	}

	function check_dn(form)
	{
		//document.getElementById("trang_dn").value=location.href;
		var kt=new kiemtra();
		var taikhoan=form.txtuser.value;
		taikhoan=taikhoan.trim();
		var pass=form.txtpass.value;
		var flag=true;
		//truyen theo: tenform;ten dieu khien;ten tuong trung cua dieu khien;gia tri cua dieu khien;kieu kiem tra;so ky tu toi da duoc phep nhap
		//kieu kiem tra co 8 loai:1->ky tu co khoang trang;2->ky tu khong co khoang trang;3->ky tu chu va so co khoang trang;4->ky tu chu va so khong co khoang trang;5->so nguyen;6->so thuc;7->kieu ngay thang nam;8:kieu email
		if(flag)
			flag=kt.kieu(form.name,"txtuser","User name",taikhoan,3,30);
		if(flag)
			flag=kt.kieu(form.name,"txtpass","Password",pass,3,30);
		if(flag)
		return flag;
	}