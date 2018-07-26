<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>购物车</title>
<link rel="stylesheet" type="text/css" href="css/shopCar.css" />
<script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>

<script type="text/javascript">
	$(function() {


		
		
		initShopCar()
		
		
	})
	function initShopCar() {
		var goodtitle;

		var price = $(".price");
		var count = $(".J_inputCount");
		var totalMoney = $(".J_smallTotalPrice")
		var sku_id=$("input[type=hidden]");
		$.ajax({
			type : "post",
			data : {},
			dataType : "json",
			url : "/extraday/goods/getCartGoods.do",
			success : function(data) {
				if(data==""){
					var nullCart="<h1>购物车还没有任何东西，快去<a href='index.jsp'>购物</a>吧</h1>";
					$("#contentSection").html("")
					$("#contentSection").append(nullCart);
					
				}
				else{
				$.each(data, function(i, v) {

					if (i >= 1) {

						var newData = $(".section31").clone(true);
						newData.insertAfter($(".section31")[i - 1])
					}

					goodtitle = $($(".goods-title")[i]).find("a")
					$(goodtitle).html(v["f_sku_name"]);
										
					$(goodtitle).attr("href","javascript:void(0)");
					$(goodtitle).attr("onclick","getGoodsBySku("+v["f_sku_id"]+")");
					price = $(".price")[i]
					$(price).html("")
					$(price).append("￥" + v["f_price"]);
					count = $(".J_inputCount")[i];
					$(count).attr('value', (v["f_count"]));
					totalMoney = $(".J_smallTotalPrice")[i];
					$(totalMoney).html("");
					var moneyTT = parseInt(v["f_count"])
							* parseFloat(v["f_price"]);
					
					$(totalMoney).append("￥" + moneyTT)
					
					sku_id=$("input[type=hidden]")[i];
					$(sku_id).attr('value',v["f_sku_id"]);
					
				})
				
				}
			},
		})
	}
	
	function getGoodsBySku(i){
		alert(i)
		$.ajax({
			data:{
				sku_id:i
			},
			dataType:"json",
			type:"post",
			url:"/extraday/goods/getGoodsBySku.do",
			success:function(data){
				alert(data);
				window.location.href="goodsDetail.jsp?spu_id="+data;
			}
			
			
			
		})
		
		
	}
	
	
	function createOrder(){
		var skus=setSku();
		if(skus.length!=0){
					
			$.ajax({
				type:"post",
				dataType:"json",
				data:{
					sku:skus
				},
				traditional:true,
				url:"/extraday/goods/pay.do",
				success:function(flag){
					
				window.location.href="pay.jsp";				
				}		
					
					
			
				
				
				
				
			})
			
			
		}
		
	}
	
	function setSku(){
		var goodItem=$(".section3 input[type=checkbox]")
		var sku=new Array();
		var index=0;
		for(var i=0;i<goodItem.length;i++){
			if($(goodItem[i]).prop("checked")){
				sku[index]=$($(goodItem)[i]).next("input[type=hidden]").attr("value");
				index++;
			}
		}
		return sku;
	}
	
	function alterMount(){
		
		
	}
	
	
	
	function chooseAll(){
		var goodItem=$(".section3 input[type=checkbox]")
		if($("#chooseAll").prop("checked")){
			
			for(var i=0;i<goodItem.length;i++){
				$(goodItem[i]).prop("checked",true);
			}
			
		}
		else
			{
			for(var i=0;i<goodItem.length;i++){
				$(goodItem[i]).prop("checked",false);
			}
			
			}
		
	}
	
	
	
</script>
</head>
<body>

	<div class="header">
		<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~网页第一行-->
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

		<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~网页中部~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
		<div class="section" id="contentSection">
			<div class="section1">
				<div class="section1_fl fl">
					<ul>
						<li><a href="#">全部商品<span class="num"></span></a></li>|

					</ul>
				</div>
				<!-- <div class="section1_fr fr">
					<ul>
						<li>已选商品（不含运费）</li>
						<li><span class="num">0.00</span></li>
						<li>结算</li>
					</ul>
				</div> -->
			</div>
			<div class="section2">
				<div class="section2_fl fl">
					<ul>
						<li><input type="checkbox"  id="chooseAll" onclick="chooseAll()"/>全选</li>
						<li>商品信息</li>
					</ul>
				</div>
				<div class="section2_fr fr">
					<ul>
						<li>单价</li>
						<li>数量</li>
						<li>金额</li>
						<li>操作</li>
					</ul>
				</div>
			</div>
			<!--~~~~~~~~~~~~~~~~~~~店铺~~~~~~~~~~~~~~~~-->
			<div class="section3">
				<!--~~~~~~~~~~~~~~~~~~~第一家店铺~~~~~~~~~~~~~~~~-->
				<div class="section31">
					<div class="section3_2">
						<ul>
							<li class="section3_2_1">
								<div>
									<input type="checkbox" />
									<input type="hidden">
								</div>
							</li>
							<li class="section3_2_2">
								<div class="goods-title">
									<a href="#"></a>
								</div>
							</li>
							<li class="section3_2_3">
								<div class="section3_2_3_1"></div>
							</li>
							<li class="section3_2_3">
								<div class="attr"></div>
							</li>
							<li class="section3_2_5 section3_2_3">
								<div>
									<div class="price">¥</div>
								</div>
							</li>
							<li class="section3_2_6">
								<div class="clear">
									<div class="section3_2_6_2 plush">
										<input class="J_btnDelCount" type="button" name="minus"
											value="-" onclick="alterMount"> 
											<input class="J_inputCount" type="text"
											name="amount" value="1" onblur="alterMount()"> 
											<input class="J_btnAddCount" onclick="alterMount()"
											type="button" name="plus" value="+">
									</div>
									<!--<div class="section3_2_6_2 plush">
										<span class="J_btnDelCount">-</span>
										<input class="J_inputCount" type="text" value="1" />
										<span class="J_btnAddCount">+</span>
									</div>-->
								</div>
							</li>
							<li class="section3_2_3">
								<div>
									<div class="J_smallTotalPrice">¥</div>

								</div>
							</li>
							<li class="section3_2_3">
								<div>
								
									<div>
										<a href="#" class="close">删除</a>
									</div>

								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>

	<div class="buySelectShop">
		
		<a href="javascript:void(0)" onclick="createOrder()">去结算</a>
	
	</div>


		</div>
	
	

	



</body>
</html>