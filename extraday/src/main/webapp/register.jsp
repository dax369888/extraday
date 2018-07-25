<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>



<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta charset="UTF-8">
<title>注册页面</title>
<link rel="stylesheet" type="text/css" href="css/regist.css" />
<link rel="stylesheet" type="text/css" href="css/baseVal.css">

<script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>
<script type="text/javascript">
	/*  
	验证标志：默认为错误，验证通过一项设置一项标志为成功
	 */
	var mobileFlag = false;//手机号验证
	var codeFlag = false;//验证码验证
	var passwordFlag = false;//密码格式验证
	var repswdFlag = false;//第二次密码验证

	//验证手机号是否可用(js验证和ajax验证)
	function checkUser() {
		var mobile = $("input[name=username]");
		var show = $(".input-tip #span1");
		var showImg = $("#span11");
		var reg_phone = /^1(3[0-9]|5[189]|8[26789])[0-9]{8}$/;
		show.html("");//清空之前的数据
		showImg.html("");
		if (mobile.val() == "") {
			show.append("手机号不能为空");
		} else {
			var flag = reg_phone.test(mobile.val());
			if (flag) {
				$.ajax({
					type : "post",
					url : "/extraday/user/checkUser.do",
					/* 传输的数据 */
					data : {
						username : mobile.val()
					},
					dataType : "json",
					success : function(data) {/* 从后台接收的json数据 */
						/* alert(data["msg"]); */
						//如果只是为了验证结果，传输的内容最好用数字表示，这样可以提高效率
						if (data["msg"] == 1) {
							show.append("<img src='img/val/right.png'>")
							mobileFlag = true;//验证通过					
						} else {
							show.append("账号已存在");
							mobileFlag=false;
						}
					},
					error : function() {
						alert("请求失败");
					}

				});
			} else {
				show.append("请输入正确的手机号");
			}
		}
	}

	/*  发送验证码（ajax）	*/
	function sendMsg() {
		var timer;
		var mobile = $("input[name=username]")
		$.ajax({
			type : "post",
			url : "/extraday/user/sendMsg.do",
			data : {
				username : mobile.val()
			},
			dataType : "json",
			success : function(data) {
			
				if (data["msgStatus"] == "success") {
					var timeU = 60;
					timer = setInterval(function() {
						timeU--;
						$(".tableText").css("background-color", "#d9d9d9");
						$(".tableText").text(timeU);
						$(".tableText").removeAttr("onclick");
						$(".tableText").css("cursor", "default")
						if (timeU <= 0) {
							clearInterval(timer);
							$(".tableText").css("background-color", "#ffa000");
							$(".tableText").text("重新发送");
							$(".tableText").attr("onclick", "sendMsg()");
							$(".tableText").css("cursor", "pointer")
						}

					}, 1000);
				}
			},
			error : function() {
				alert("请求失败");
			}
		});
	}
	//校验验证码	(ajax)
	function checkMsg() {
		var mobile = $("input[name=username]");
		var checkMsg1 = $("input[name=checkMsg1]");
		var testCode = $("#span2");
		testCode.html("");
		$.ajax({
			type : "post",
			url : "/extraday/user/checkMsg.do",
			data : {
				username : mobile.val(),
				code : checkMsg1.val()
			},
			dataType : "json",
			success : function(data) {
				var ok = data["msgOk"]; 
				if (ok=="success") {
					testCode.append("<img src='img/val/right.png'>")
					codeFlag = true;//验证通过
				} else {
					testCode.append("验证码错误");
					codeFlag = true;
				}
			},
			error : function() {
				alert("请求失败");
			}
		});
	}

	//密码格式验证（js验证）	

	function checkPassword() {
		var pswd_reg = /^[a-zA-Z][a-zA-Z0-9]{5,17}$/;
		//alert(1)
		var password = $("input[name=password]");
		/* var repass = $("input[name=pswd2]"); */
		var flag = pswd_reg.test(password.val());
		var test = $(".input-tip #span3");
		test.html("");
		//alert(flag)
		if (flag) {
			test.append("<img src='img/val/right.png'>")
			passwordFlag = true;
		} else {
			test.append("密码由6-18位字母，数字组合");
			passwordFlag =false;
		}

	}
	//第二次密码验证（js验证）
	function checkRepass() {
		var password = $("input[name=password]");
		var repass = $("input[name=pswd2]");
		var test1 = $(".input-tip #span4");
		test1.html("");
		//alert(flag2)
		if (repass.val() == password.val()) {
			test1.append("<img src='img/val/right.png'>")
			repswdFlag = true;
		} else {
			test1.append("请输入相同的密码");
			repswdFlag = false;
		}

	}
	//注册
	function registerUser() {
		//只有通过所有验证的时候，才能进行注册
		if (!mobileFlag) {
			checkUser()
		} else if (!codeFlag) {
			checkMsg() 
		} else if (!passwordFlag) {
			checkPassword()
		} else if (!repswdFlag) {
			checkRepass()
		} else {

			var mobile = $("input[name=username]");
			var pswd = $("input[name=password]");
			$.ajax({
				type : "post",
				data : {
					mobile : mobile.val(),
					pswd : pswd.val()
				},
				url : "/extraday/user/register.do",
				dataType : "json",
				success : function(data) {
					/* alert(data); */
					window.location = "index.jsp";
				},
				error : function() {
					alert("请求失败");
				}
			});
		}
	}

	
</script>
</head>

<body>
	<header>
		<div class="h_logo">
			<a href="#"><span>星期八</span></a>个人注册<br />
			<p>Extra Day</p>
		</div>
	</header>

	<section>
		<div class="b">
			<div class="switch-login">
				<p>
					已注册可<a href="login.jsp">直接登陆</a>
				</p>
			</div>
			<h2>会员注册</h2>

			<div class="control-group">
				<div id="phone1" class="tableItem">
					<input type="text" placeholder="请输入手机号" name="username"
						onkeyup="checkUser()" />
				</div>
				<div class="input-tip">
					<span id="span1" class="showWarning"></span>
				</div>

			</div>
			<div class="control-group">
				<div class="clear">
					<div class="tableItem d1">
						<input type="text" required placeholder="请输入验证码" name="checkMsg1"
							onblur="checkMsg()" />
					</div>
					<a class="tableText fr" href="javascript:void(0)"
						onclick="sendMsg()">获取验证码</a>
				</div>
				<div class="input-tip">
					<span id="span2" class="showWarning"></span>
				</div>
			</div>
			<div class="control-group">
				<div class="tableItem ">
					<input type="password" required placeholder="密码" name="password"
						onkeyup="checkPassword()" />
				</div>
				<div class="input-tip">
					<span id="span3" class="showWarning"></span>
				</div>
			</div>
			<div class="control-group">
				<div class="tableItem">
					<input type="password" required placeholder="确认密码" name="pswd2"
						onkeyup="checkRepass()" />
				</div>
				<div class="input-tip">
					<span id="span4" class="showWarning"></span>
				</div>
			</div>
			<div class="xieYi">
				<input type="checkbox" /> 我已阅读并接受以下条款：<a href="#">《星期八用户服务协议》</a>
			</div>
			<a href="javascript:void(0)"><button class="tableBtn"
					onclick="registerUser()">同意协议并注册</button></a>
		</div>
	</section>
	<footer>
		<div class="f">

			<ul>
				<li><a href="#">关于我们</a></li>
				<li><a href="#">联系客服</a></li>
				<li><a href="#">合作伙伴</a></li>
				<li><a href="#">法律声明及隐私权政策</a></li>
				<li><a href="#">关于我们</a></li>

			</ul>
			<br />
			<p>© 2018 ExtraDay.com 版权所有</p>
		</div>
	</footer>
</body>

</html>