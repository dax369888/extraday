<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>结算页</title>
	
	<link rel="stylesheet" href="css/pay.css" />
	<script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>
	
	<script>
	var sum_price=0;
			var uid=${user.f_user_id}
		$(function(){
			getAddress()
			
		})
		
		function getAddress() {

		var id = ${user.f_user_id};
		
		$.ajax({
			type : "post",
			data : {
				useId : id
			},
			dataType : "json",
			url : "/extraday/address/showAddress.do",
			success : function(data) {
				/* alert(data); */
				var tbody = $("tbody");
				tbody.html("");
				$.each(data, function(i, v) {
					var tr = "<tr>" +"<td><input type='radio' name='radio' onclick='check()' value='"+v["f_addr_id"]+"'></td>"
							+ "<td class='address-exist'>" + v["1"]
							+ "</td>" + "<td class='address-exist'>" + v["2"]
							+ "</td>" + "<td class='address-exist'>" + v["3"]
							+ "</td>" + "<td class='address-exist'>"
							+ v["f_address_det"] + "</td>"
							+ "<td class='address-exist'>" + v["f_rec_name"]
							+ "(收)" + "</td>" + "<td class='address-exist'>"
							+ v["f_rec_mobile"] + "</td>" 
							+"</tr>";
					tbody.append(tr);
					
				
					if(v["f_is_def"]==1){
						
						checked=$("tbody").find("input")[i];
						
						$(checked).prop("checked","checked");
						check()
						
					} 
					

				});

			}
		})
	}
		
		
		function check(){

			var oderAdd=$("input[name='radio']:checked")
			var content=$(oderAdd).parents("tr");
			/* var region=$(content).find("input[type=hidden]"); */
			
			
			
			var pro=$(content).find("td").eq(1).text()
			var city=$(content).find("td").eq(2).text()
			var region=$(content).find("td").eq(3).text()
			var det=$(content).find("td").eq(4).text()
			
			var name=$(content).find("td").eq(5).text()
			var phone=$(content).find("td").eq(6).text()
		
			$(".confirmAdd-title .pro").text("")
			$(".confirmAdd-title .pro").append(pro);
			$(".confirmAdd-title .city").text("")
			$(".confirmAdd-title .pro").append(city);
			$(".confirmAdd-title .dist").text("")
			$(".confirmAdd-title .pro").append(region);
			$(".confirmAdd-title .town").text("")
			$(".confirmAdd-title .pro").append(det);
			$(".confirmAdd-user .name").text("")
			$(".confirmAdd-user .name").append(name);
			$(".confirmAdd-user .phone").text("")
			$(".confirmAdd-user .phone").append(phone);
			
		}
		
		
		function createOrder(){
			var address=$("input[name='radio']:checked");
			addr_id=$(address).val()
			
			//创建订单
			var order=GetDateNow();
			var sum_price=$(".pay-price").text()
			
			
			$.ajax({
				data:{
					sum_price:sum_price,
					address_id:addr_id,
					order_code:order
				},
				type:"post",
				dataType:"json",
				url:"/extraday/order/createOrder.do",
				success:function(data){
					
					var oid=data["f_order_id"];
					var ocode=data["f_order_code"];
					var oprice=data["f_sum_price"];
					window.location.href="alipay.trade.page.pay.jsp?WIDout_trade_no="+oid+"&WIDtotal_amount="+oprice+"&WIDsubject="+ocode+"&WIDbody="+null;
				
				}
				
				
				
			})
			
			
			
			
		}
		
		
		function GetDateNow() {
			var vNow = new Date();
			var sNow = "";
			sNow +=	String(uid);
			sNow += String(vNow.getFullYear());
			sNow += String(vNow.getMonth() + 1);
			sNow += String(vNow.getDate());
			sNow += String(vNow.getHours());
			sNow += String(vNow.getMinutes());
			sNow += String(vNow.getSeconds());
			sNow += String(vNow.getMilliseconds());
			return sNow;
		}
	
	</script>
	
	
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
								<li><a href="#">免费注册</a></li>
								<li><a href="#">我的订单</a></li>
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
			<div class="h_bottom">
				<div class="h_bottom1 ">
					<div class="logo">
						<p><a href="index.jsp"><span>星期八 </span></a>确认订单</p>
					</div>								
				</div>
			</div>
		</header>
		<section>
			<div class="body">
				<div class="address">
					<h3>确认收货地址</h3>
					<table>
						<thead>
							<th colspan="5">地址</th>
							<th>收货人姓名</th>
							<th>收货人电话</th>
						</thead>
						<tbody>
						</tbody>
					
					</table>
					<!-- <div class="address-detail">
						<p>寄送至:
							<span>江苏省 南京市 建邺区 莫愁湖街道 云锦路58号万达东坊</span><br />
							<span>江苏省 南京市 建邺区 莫愁湖街道 云锦路58号万达东坊</span>
						</p>
						<p>寄送至:</p>
						<ul class="address-list">
							<li class="address-wrap selected">
								<div class="addressBox">
									<label class="addressInfo">
										<input type="radio" checked="" name="address"/>
										<span class="user-address">
											江苏省 南京市 建邺区 莫愁湖街道 云锦路58号万达东坊(Bella 收) 13260907127
										</span>
										<a class="modify">修改本地址</a>
									</label>								
								</div>
							</li>
							<li class="address-wrap">
								<div class="addressBox">
									<label class="addressInfo">
										<input type="radio" checked="" name="address"/>
										<span class="user-address">
											江苏省 南京市 雨花台区 小行路16号(Bella 收) 13260907127
										</span>
										
									</label>								
								</div>
							</li>
						</ul>
					</div> -->
					<!-- <div class="add-address">
						<a class="newAddr">使用新地址</a>
					</div> -->
				</div>
				<div class="order">
					<h3>确认订单信息</h3>
					<div class="order-detail">
						<div class="order-detail-nav">
							<ul>
								<li>宝贝</li>
						
								<li>单价</li>
								<li>数量</li>
								<li>合计</li>
							</ul>
						</div>
						<c:forEach var="goodItem" items="${payList}">
						
						
						<!--具体买的商品----------------------------->
						<div class="order-detail-item">
							<div class="order-photo ">
								
								<div class="describe info-title">
									<a href="#">${goodItem.f_sku_name}</a>
								</div>
							</div>
											
							<div class="order-price">${goodItem.f_price}</div>
							<div class="order-quantity">${goodItem.f_count}</div>
							<div class="order-pay">
								<span class="total-price">${goodItem.f_price*goodItem.f_count}</span>
							</div>						
						</div> 
						
						</c:forEach>
						
						
						<div class="order-footer">
							<div class="order-total">
							
								<span class="total-item">本组商品金额：
									<span class="pay-money">
										<span class="ship-yen">￥</span>
										<span class="ship-price">
										
										</span>
									</span>
								</span>
							</div>
						</div>
						
						
						
					</div>
					
				</div>
				
				
				
				
				<div class="pay-info">
					<div class="pay-details">
						<div class="pay-shadow">
							<div class="order-reaPay">
								<span class="realPay-title">实付款：</span>
								<span class="pay-yen">￥</span>
								<span class="pay-price">149.00</span>
							</div>
							
							
							<!-- 这里的信息应该根据上面选择的地址来动态显示 -->
						
							<div class="confirmAdd">
								<div class="confirmAdd-addr">
									<span class="confirmAdd-title">寄送至：
										<span class="pro">江苏省</span>
										<span class="city">南京市</span>
										<span class="dist">建邺区</span>
										<span class="town">莫愁湖街道</span>
										
									</span>
								</div>
								<div class="confirmAdd-user">
									<span class="confirmAdd-title">收货人：
										<span class="name">Bella</span>
										<span class="phone">13260907127</span>										
									</span>								
								</div>
							</div> 
							
						</div>						
					</div>
					<div class="order-submit">
						<div class="order-submit-box">
						<a href="shopCar" class="go-back">返回购物车</a>
						<a href="javascript:void(0)" class="go-btn" onclick="createOrder()">提交订单</a>
						</div>
					</div>
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
		
		<script>
						
							var tot=$(".total-price");
							for(var i=0;i<tot.length;i++){
								sum_price+=parseFloat($($(".total-price")[i]).text())
								
							}
							$(".ship-price").text(sum_price);
							$(".pay-price").text(sum_price);
							
						</script>
		
		
</body>
</html>