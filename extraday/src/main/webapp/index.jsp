<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta charset="UTF-8">
<title>首页</title>
		<link rel="stylesheet" href="css/index.css" />
		<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
		<script type="text/javascript" src="js/index.js"></script>
		<script type="text/javascript">
				$(function(){
					initdata();
				})
				
				function initdata(){
					$.ajax({
						type:"post",
						data:{},
						dataType:"json",
						url:"/extraday/goods/showIndex.do",
						success:function(data){
							
							
						 	$.each(data,function(i,v){
						
						 		if(i>=1){
						 			var newData=$(".show111 .middle-column-con a").clone(true);
						 			/* $(".show111 .middle-column-con").append(newData); */
						 			newData.insertAfter($(".show111 .middle-column-con a")[i-1])
						 		}
								
						 		
						 		
						 		
								var jump=$(".middle-column-con a")[i]			
								$(jump).attr('href',"/extraday/goodsDetail.jsp?spu_id="+v["f_id"])
								var photo=$(".floor-item-img")[i]							
								$(photo).attr('src',v["f_main_img_url"]);
								var title=$(".floor-item-title")[i]
								$(title).html("");
								$(title).append(v["f_good_detail"]);
																						
							})							
						},
						error : function() {
							alert("请求失败");
						}
					})				
				}
				
		
		</script>
</head>
<body>
	<header>
			<!--头部-->
			<div class="h_top">
				<div class="h_head">
					<span>送至：南京</span>
						<div class="h_top_r fr">	
							<ul>
								<c:choose>
									<c:when test="${user.f_user_mobile!=null}">
									<li><span class="h_1"><a href="center.jsp?action=0">${user.f_user_mobile}</a></span>
									<span class="h_1"><a href="/extraday/user/logout.do">退出</a></span>
								</c:when>
								<c:otherwise>
									<li><a href="login.jsp" class="active">登陆</a>
									</c:otherwise>
								</c:choose>
								
								<li><a href="register.jsp">免费注册</a>
								<li><a href="center.jsp?action=1">我的订单</a>

                               <!--  <li class="coll_bg">
									<a href="#">我的特卖</a>
									<div class="coll_list">
										<ul>
											<li>收藏宝贝</li>
											<li>我的足迹</li>
										</ul>
									</div>								
								</li>                              						
								<li><a href="#">联系客服</a></li>	 -->												
								<li><a href="shopCar.jsp">购物车</a></li>
							</ul>
						</div>	
				</div>	  		
			</div>	
			
			<div class="h_bottom">
				<div class="h_bottom1 ">
					<div class="logo">
						<p><span>星期八 </span>Extra day</p>
					</div>
					
					<div class="search">
						<form>
							<span>宝贝</span>
							<input type="search" placeholder="请输入想要的宝贝" />
							<input type="submit" value="搜宝贝" />
						</form>
						<ul>
							<li><a href="#">女装</a></li>
							<li><a href="#">美食</a></li>
							<li><a href="#">书籍</a></li>
							<li><a href="#">裤装</a></li>
						</ul>
					</div>
				</div>
			</div>
			
			<div class="main-nav">
				<div class="head-inner">
					<ul class="main-nav-link">
						<li><a class="first-page">首页</a></li>
						<li><a href="#">女装</a></li>
						<li><a href="#">书籍</a></li>
						<li><a href="#">美食</a></li>
					</ul>				
				</div>			
			</div>		
		</header>
		<section>
			<div class="left-bar">
				<p>
						
						<a href="">导航</a>
						<a href="#floor1">女装</a>
						<a href="#floor2">书籍</a>			
						<a href="#floor3">美食</a>
				</p>
			</div>
			<div id="content" class="index-content" >
				<div class="focus-banner">
					<div class="focus-banner-con-wrq">
						<div class="focus-banner-con">
							<ul class="fbc-list">
								<li class="fbc-list-item"><img src="img/index/Background2.jpg"></li>
							</ul>							
						</div>
					</div>
					<div class="fbc-trigger">
						<ul class="fbc-trigger-con">
							<li class="active">1</li>
							<li>2</li>
							<li>3</li>
						</ul>
					</div>					
				</div>
				<div class="index-goods">
					<div id="floor1" class="floor-line-con">
						<i class="color-mark"></i>
						<div class="floor-name">
							<div class="floor-title">
								女王大人 
								<div class="floor-sub-name">FASHION & BEAUTY</div>
							</div>
						</div>					
						<div class="line-body">
							<div class="hot-words-con">
								<a class="hot-word">连衣裙</a>
								<a class="hot-word">打底衫</a>
								<a class="hot-word">衬衫</a>
								<a class="hot-word">牛仔裤</a>
							</div>
							<div class="show111">
								<div class="big-banner-con">
									<a href="#"><img src="img/index/girls1.jpg"></a>
								</div>
								<div class="middle-column-con">
									<a class="grid one-grid-price" id="test">
										<div class="floor-item-content-wrap">
											<img class="floor-item-img" id="testImg" />
											<div class="floor-item-title"></div>
											<div class="floor-price">￥69</div>
										</div>
									</a>
								</div>
							</div>
						
						</div>
					</div>					
					<div id="floor2" class="floor-line-con">
						<i class="color-mark"></i>
						<div class="floor-name">
							<div class="floor-title">
								书的海洋 
								<div class="floor-sub-name">KINDS OF BOOKS</div>
							</div>
						</div>					
						<div class="line-body">
							<div class="hot-words-con">
								<a class="hot-word">小说</a>
								<a class="hot-word">青春文学</a>
								<a class="hot-word">励志</a>
							
							</div>
							<div>
								<div class="big-banner-con">
									<a href="#"><img src="img/index/books1.jpg"></a>
								</div>
								<div class="middle-column-con">
									<a class="grid one-grid-price " href="#">
										<div class="floor-item-content-wrap">
											<img class="floor-item-img" src="img/index/books2.jpg" />
											<div class="floor-item-title">在不安的世界安静的活着</div>
											<div class="floor-price">￥30.2</div>
										</div>
									</a>
									<a class="grid one-grid-price " href="#">
										<div class="floor-item-content-wrap">
											<img class="floor-item-img" src="img/index/books3.jpg" />
											<div class="floor-item-title"> 奥黛丽·赫本（新版·精装全彩典藏） </div>
											<div class="floor-price">￥59.5</div>
										</div>
									</a>
									<a class="grid one-grid-price " href="#">
										<div class="floor-item-content-wrap">
											<img class="floor-item-img" src="img/index/books4.jpg" />
											<div class="floor-item-title">活着（精装版，余华代表作）</div>
											<div class="floor-price">￥27</div>
										</div>
									</a>
									<a class="grid one-grid-price " href="#">
										<div class="floor-item-content-wrap">
											<img class="floor-item-img" src="img/index/books5.jpg" />
											<div class="floor-item-title"> 东野圭吾：白夜行（2017版） </div>
											<div class="floor-price">￥49</div>
										</div>
									</a>
									<a class="grid one-grid-price " href="#">
										<div class="floor-item-content-wrap">
											<img class="floor-item-img" src="img/index/books6.jpg" />
											<div class="floor-item-title">最好的我们（八月长安全新力作) </div>
											<div class="floor-price">￥49</div>
										</div>
									</a>
									<a class="grid one-grid-price " href="#">
										<div class="floor-item-content-wrap">
											<img class="floor-item-img" src="img/index/books7.jpg" />
											<div class="floor-item-title">余生很长，何必慌张（林熙新书） </div>
											<div class="floor-price">￥33</div>
										</div>
									</a>
									<a class="grid one-grid-price " href="#">
										<div class="floor-item-content-wrap">
											<img class="floor-item-img" src="img/index/books8.jpg" />
											<div class="floor-item-title">生活需要仪式感 </div>
											<div class="floor-price">￥26</div>
										</div>
									</a>
									<a class="grid one-grid-price " href="#">
										<div class="floor-item-content-wrap">
											<img class="floor-item-img" src="img/index/books9.jpg" />
											<div class="floor-item-title"> 所有失去的都会以另一种方式归来</div>
											<div class="floor-price">￥25</div>
										</div>
									</a>
								</div>
							</div>
						</div>
					</div>
					<div id="floor3" class="floor-line-con">
							<i class="color-mark"></i>
							<div class="floor-name">
								<div class="floor-title">
									美食诱惑 
									<div class="floor-sub-name">DELICIOUS FOOD</div>
								</div>
							</div>					
							<div class="line-body">
								<div class="hot-words-con">
									<a class="hot-word">休闲零食</a>
									<a class="hot-word">饼干糕点</a>
									<a class="hot-word">生鲜果蔬</a>
								
								</div>
								<div>
									<div class="big-banner-con">
										<a href="#"><img src="img/index/foods1.jpg"></a>
									</div>
									<div class="middle-column-con">
										<a class="grid one-grid-price " href="#">
											<div class="floor-item-content-wrap">
												<img class="floor-item-img" src="img/index/foods2.jpg" />
												<div class="floor-item-title">零食坚果炒货干果奶油味</div>
												<div class="floor-price">￥49</div>
											</div>
										</a>
										<a class="grid one-grid-price " href="#">
											<div class="floor-item-content-wrap">
												<img class="floor-item-img" src="img/index/foods3.jpg" />
												<div class="floor-item-title">  饼干糕点 盒装  </div>
												<div class="floor-price">￥30</div>
											</div>
										</a>
										<a class="grid one-grid-price " href="#">
											<div class="floor-item-content-wrap">
												<img class="floor-item-img" src="img/index/foods4.jpg" />
												<div class="floor-item-title">卤鸭脖200gX2盒</div>
												<div class="floor-price">￥40</div>
											</div>
										</a>
										<a class="grid one-grid-price " href="#">
											<div class="floor-item-content-wrap">
												<img class="floor-item-img" src="img/index/foods5.jpg" />
												<div class="floor-item-title">休闲零食草莓芒果杨梅干组合 </div>
												<div class="floor-price">￥37</div>
											</div>
										</a>
										<a class="grid one-grid-price " href="#">
											<div class="floor-item-content-wrap">
												<img class="floor-item-img" src="img/index/foods6.jpg" />
												<div class="floor-item-title">新鲜水果 5斤包邮脆甜多汁</div>
												<div class="floor-price">￥25</div>
											</div>
										</a>
										<a class="grid one-grid-price " href="#">
											<div class="floor-item-content-wrap">
												<img class="floor-item-img" src="img/index/foods7.jpg" />
												<div class="floor-item-title">手撕面包1050g*1箱营养早餐 </div>
												<div class="floor-price">￥28</div>
											</div>
										</a>
										<a class="grid one-grid-price " href="#">
											<div class="floor-item-content-wrap">
												<img class="floor-item-img" src="img/index/foods8.jpg" />
												<div class="floor-item-title">蔓越莓曲奇100g</div>
												<div class="floor-price">￥17</div>
											</div>
										</a>
										<a class="grid one-grid-price " href="#">
											<div class="floor-item-content-wrap">
												<img class="floor-item-img" src="img/index/foods9.jpg" />
												<div class="floor-item-title"> 精制猪肉脯200g</div>
												<div class="floor-price">￥40</div>
											</div>
										</a>
									</div>
							</div>
						</div>
					</div>
				</div>
			</div>			

		</section>
		<%-- <div class="sidebar">
			<div class="sidebar-nav">
				<div class="sidebar-nav-cnt">
					<ul class="sidebar-item">
						<li class="sidebar-my">
							<div class="sidebar-my-con">
								<i class="i-sidebar-my"><img src="img/index/photo.png"/></i>
								<c:choose>
									<c:when test="${user.f_user_mobile!=null}">
								<i class="i-sidebar-name"><a href="center.jsp">${user.f_user_mobile}</a></i>
								</c:when>
								<c:otherwise>
									<i class="i-sidebar-name"><a href="login.jsp">登录</a></i>
									</c:otherwise>
								</c:choose>
								<i class="i-sidebar-name"></i>
							</div>
						</li>
						<li class="sidebar-cart sidebar-sec">
							<div class="sidebar-cart-bar">
								<i class="i-siderbar-cart"><img src="img/index/cart.png"/></i>
								<p class="i-siderbar-text"><a href=""> 购物袋</a></p>
								<div class="cart-num">
									<i class="i-siderbar-num">0</i>
								</div>
							</div>
						</li>
						<div class="abc">
						<li class="sidebar-asset">
							<div class="asset-item">
								<i class="i-sider-asset"><img src="img/index/asset.png"/></i>
								<a class="sidebar-hover"><p class="sidebar-hover1">我的优惠券</p></a>
							</div>
						</li>
					
						</div>
						<li class="sidebar-fav">
							<div class="fav-item">
								<i class="i-sider-fav"><img src="img/index/fav.png"/></i>
								<a class="sidebar-hover"><p class="sidebar-hover2">商品收藏</p></a>
							</div>
						</li>
						<li class="sidebar-foot">
							<div class="foot-item">
								<i class="i-sider-foot"><img src="img/index/foot.png"/></i>
								<a class="sidebar-hover"><p class="sidebar-hover3">我的足迹</p></a>
							</div>
						</li>
					</ul>
				</div>
				
			</div>
		</div> --%>
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