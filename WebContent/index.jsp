<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="js/jquery-2.1.3.js"></script>
<script src="js/jsencrypt.min.js"></script>
</head>
<body>

	<script type="text/javascript">
		$(function() {
			$("#bt").click(
					function() {

						var encrypt = new JSEncrypt();
						encrypt.setPublicKey($("#publickey").val());
						encrypt.setPrivateKey($("#privatekey").val());
						var password = $("#password").val();
						var uname = $("#uname").val();
						password = encrypt.encrypt(password);

						uname = encrypt.encrypt(uname);
						$("#jmName").val(uname);
						$("#jmPasswrod").val(password);
						var jsonData = {
							"password" : password,
							"uname" : uname
						};

						$.post("jiemi.do", jsonData, function(result) {
							alert("解密的用户名：" + result.uname + "\n" + "解密的密码："
									+ result.password);

						}, 'json');
					});
		});
	</script>
	<h2>公钥：</h2>
	<textarea id="publickey" rows="5" cols="45">MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCJ9s1qlOyv9qpuaTqauW6fUftzE50rVk3yVPZwv1aO1Ch/XSEz76xCwkyvqpaqceRXrPpdBmO5+ruJ+I8osOHo7L5GWEOcMOO+8izp9hXKBBrmRMD4Egpn00k9DhVIEKp/vyddZPS/doxB8onhN6poTJDLdFLFVEicMf52caN9GQIDAQAB
        </textarea>
	<h2>私钥</h2>
	<textarea rows="10" cols="45" id="privatekey">MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAIn2zWqU7K/2qm5pOpq5bp9R+3MTnStWTfJU9nC/Vo7UKH9dITPvrELCTK+qlqpx5Fes+l0GY7n6u4n4jyiw4ejsvkZYQ5ww477yLOn2FcoEGuZEwPgSCmfTST0OFUgQqn+/J11k9L92jEHyieE3qmhMkMt0UsVUSJwx/nZxo30ZAgMBAAECgYBD3YHigeuEC4R+14iaf8jo2j0kuGtB3Cxvnlez0otTqw1YyYkBsU49cLKkXvfKVEgM0Ow/QltgKvSBxCE31PrrDka5TygVMqqA/IM7NrDvjUcGLjyoeNmLA8660fWcDxUTlAGN5kxIvUATayVwKVflpWPWu0FPKsWrZustnEo+4QJBAMCmYsWqAKWYMVRXFP3/XGRfio8DV793TOckyBSN9eh8UhgoZyT3u7oeHmDJEwm4aNMHlg1Pcdc6tNsvi1FRCiUCQQC3VNzfF4xOtUgX7vWPL8YVljLuXmy12iVYmg6ofu9l31nwM9FLQ1TRFglvF5LWrIXTQb07PgGd5DJMAQWGsqLlAkAPE7Z9M73TN+L8b8hDzJ1leZi1cpSGdoa9PEKwYR/SrxAZtefEm+LEQSEtf+8OfrEtetWCeyo0pvKKiOEFXytFAkEAgynL/DC0yXsZYUYtmYvshHU5ayFTVagFICbYZeSrEo+BoUDxdI9vl0fU6A5NmBlGhaZ65G+waG5jLc1tTrlvoQJAXBEoPcBNAosiZHQfYBwHqU6mJ9/ZacJh3MtJzGGebfEwJgtln5b154iANqNWXpySBLvkK+Boq7FYRiD83pqmUg==</textarea>
	<hr />
	<form>
		用户名：<input type="text" name="uname" id="uname" /> 密码：<input
			type="text" name="password" id="password" />
		<hr />
		用户密文
		<textarea id="jmName">
    </textarea>
		密码密文
		<textarea id="jmPasswrod">
    </textarea>
		<input type="button" id="bt" value="提交" />
	</form>

</body>
</html>