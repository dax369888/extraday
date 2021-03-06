<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>评论页面</title>
		<link rel="stylesheet" href="css/comment.css" />
	</head>
	<body>
		<header>
			<div class="h_top">
				<div class="h_head">
					<span>送至：南京</span>
						<div class="h_top_r fr">	
							<ul>
								
								<c:choose>
									<c:when test="${user.f_user_mobile!=null}">
									<li><span class="h_1"><a href="center.jsp">${user.f_user_mobile}</a></span>
									<span class="h_1"><a href="/extraday/user/logout.do">退出</a></span>
								</c:when>
								<c:otherwise>
									<li><a href="login.jsp" class="active">登陆</a>
									</c:otherwise>
								</c:choose>
								<li><a href="register.jsp">免费注册</a>
								<li><a href="#">我的订单</a>

                                <li class="coll_bg">
									<a href="#">我的特卖</a>
									<div class="coll_list">
										<ul>
											<li>收藏宝贝</li>
											<li>我的足迹</li>
										</ul>
									</div>								
								</li>
                               						
								<li><a href="#">联系客服</a></li>														
								<li><a href="#">购物车</a></li>
							</ul>
						</div>	
				</div>	  		
			</div>
		</header>
		<section>
			<div class="body">
				<div class="title">
					<p>评论订单</p>
				</div>	
				<div class="content">
					<div class="goods">
						<dl>
							<dt><a href="#"><img src="img/clothes/E_13.jpg"/></a></dt>
							<dd>
								<a href="https://item.taobao.com/item.htm?spm=a217f.8051907.312172.27.59433308l9i0oK&id=564994440327"target="_blank">
									复古温柔风连衣裙 碎花雪纺
								</a>
							</dd>
							<dd><span class="price">￥148元</span></dd>
						</dl>							
					</div>
					<div class="comment">
						<div class="comment-title">
							<span>输入评论：</span>
						</div>
						<div class="comment-content">
							<textarea class="msg">								
							</textarea>
						</div>	
						<div class="photo">
						上传图片
						</div>
					</div>
					
				</div>
				<div class="submit">
					<button class="submit-function">发表评论</button>
				</div>
			</div>
		</section>
		<footer>
			<div class="foot_1">
				<dl>
					<dt><img src="img/A1.png"/><span>消费者保障</span></dt>
						<dd>保障范围 退货退款流程 </dd>
						<dd> 服务中心 更多特色服务</dd>					
				</dl>
				<dl>
					<dt><img src="img/A2.png"/><span>新手指导</span></dt>
						<dd> 新手专区 消费警示 交易安全 </dd>
						<dd>24小时在线帮助 免费开店 </dd>					
				</dl>
				<dl>
					<dt><img src="img/A3.png"/><span>支付方式</span></dt>
						<dd>快捷支付 信用卡 </dd>
						<dd>货到付款 </dd>		
				</dl>			
		    </div>
		 	<div class="foot-nav">
		 	  	<div class="foot_2">				
					<ul>
						<li><a href="#">关于我们</a> </li>
						<li><a href="#">联系客服</a> </li>
						<li><a href="#">合作伙伴</a> </li>
						<li><a href="#">法律声明及隐私权政策</a> </li>
						<li><a href="#">关于我们</a> </li>				
					</ul>	
					<br />
					<p>© 2018 MyDay.com 版权所有</p>
				</div>
			</div> 
		</footer>
	</body>
</html>
