<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>欢迎登陆星期八</title>
		<link rel="stylesheet" href="css/loginPage.css" />
		<script type="text/javascript" src="js/jquery-3.3.1.min.js" ></script>
		<script type="text/javascript">
		function login(){
			var mobile=$("input[name=username]");
			var pswd=$("input[name=password]");
			$.ajax({
				type : "post",
				url : "/extraday/user/login.do",
				data : {
					username:mobile.val(),
					pswd:pswd.val()
				},
				dataType : "json",
				success:function(data){
					console.log(data);
					var test=$(".form-item-group .text");
					test.html("");//清空之前的数据
                    if(data["msg"]!="账号或密码错误"){
                    	window.location="index.jsp";
                    }else{
                    	$('.form-item-group .text').html("用户名或密码错误!");
                    	$("input[name=password]").val("");
                    }

                }, 
            
            });


    }
		
		</script>
	</head>
	<body>
		<header>
			<div class="h_logo">
				<a href="index.jsp"><span>星期八</span></a>欢迎来到休闲时光<br  />
				<p>Extra Day</p>
			</div>
			<div class="h_advice fr">
				<a href="#">登陆页面改进建议</a> 
			</div>
			
		</header>
		<section>
			<div class="login-panel fr">
				<div class="login-panel-body">
					<div class="tab-nav">
						<div class="tab-nav-item">账号登陆</div>
					</div>
					<div class="tab-content">
						<div class="passport-from">
							<div class="form-item-group">
								<div class="input-tip ">
									<span class="text"></span>
								</div>
							</div>
							
							<div class="form-item">
								<div class="form-item-group">
									<input class="input" type="text" name="username" placeholder="会员名/手机号/邮箱"  required/>
									<span class="c-icon i-con-account"></span>
								</div>
								<div class="input-tip ">
									<span class="text"></span>
								</div>
							</div>
							
							<div class="form-item">
								<div class="form-item-group">
									<input class="input" type="password" name="password" placeholder="密码" required />
									<span class="c-icon c-icon-password"></span>
								</div>
								<div class="input-tip ">
									<span class=""></span>
								</div>
							</div>	
							<div class="form-item">
								<div class="other-item">
									<div class="form-item-group">
										<div class="fl">
											<div class="checkbox">
												
												<input class="checkbox-normal" checked="" type="checkbox" />
												<label class="checkbox-simulation"></label>
											</div>
											<label class="checkbox-label">记住用户名</label>
										</div>
										<div class="cannot-login fr">
											<a  class="forget-link" href="#">忘记密码</a>
										</div>
									</div>
									<div class="input-tip ">
										<span class=""></span>
									</div>
								</div>							
							</div>
							<div class="form-submit">
								<input type="button" class="submit-function"  onclick="login()" value="登陆"/>
							</div>
						</div>
						
					</div>
				</div>
				<div class="login-panel-footer">
					<div class="login-third">
						<div class="fr">
							<a class="register-link" href="register.jsp">免费注册</a>
						</div>
						<!-- <div class="login-third-content">
							<a class="third-alipay"></a>
						</div> -->
					</div>
				</div>	
			</div>
		</section>
		<footer>
			<div class="f">
				
				<ul>
					<li><a href="#">关于我们</a> </li>
					<li><a href="#">联系客服</a> </li>
					<li><a href="#">合作伙伴</a> </li>
					<li><a href="#">法律声明及隐私权政策</a> </li>
					<li><a href="#">关于我们</a> </li>
					
				</ul>	
				<br />
				<p> 2018 ExtraDay.com 版权所有</p>
			</div>		
		</footer>
	</body>
</html>






