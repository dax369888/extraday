<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人中心</title>
<link rel="stylesheet" type="text/css" href="css/center.css" />
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">



	$(function(){
		if(${param.action}==1){
			showOrder();
		}else{
			showPersonInfo();
		}
	})




	function showPersonInfo() {
		$(".main-section-personInfo").show();
		$(".main-section-center").hide();
		$(".main-section-address").hide();
		$(".main-section-order").hide();
		initPersonInfo();//点击的时候调用此方法
		$(".input-1").attr("readonly", true);
		$("input[name=sex]").attr("disabled", true);
		$(".input-3").attr("disabled", true);
		$("#date select").attr("disabled", true);
	}
	function showAddress() {
		$(".main-section-address").show();
		$(".add-address").hide();
		$(".main-section-center").hide();
		$(".main-section-personInfo").hide();
		$(".main-section-order").hide();
		getAddress();
		getRegion(0);
	}

	function showAddAddress() {
		$(".add-address").show()
	}

	function showOrder() {
		$(".main-section-order").show();
		$(".main-section-center").hide();
		$(".main-section-personInfo").hide();
		$(".main-section-address").hide();
		initOrder(-1);
	}
	function initPersonInfo() {
		var userName = $(".input-1");
		/* var userSex=$("input[name='sex'][checked]");	 */
		var userPhone = $(".userPhone");
		var userEmail = $(".input-3");

		var userYear = $("#year option:selected");
		var userMonth = $("#month option:selected");
		var userDay = $("#days option:selected");
		var userEmail = $(".input-3");

		userPhone.html("");
		userEmail.html("");
		var user = ${user.f_user_mobile}
		;
		$.ajax({
			type : "post",
			data : {
				users : user,
			},
			dataType : "json",
			url : "/extraday/user/getInfo.do",
			success : function(data) {

				userName.val(data["user"]["f_username"]);

				if (data["user"]["f_sex"] == 1) {
					$("input[name=sex][value=1]").attr("checked", true);
				} else {
					$("input[name=sex][value=2]").attr("checked", true);
				}

				var date = new Date(data["user"]["f_birthday"]);

				userYear.text(date.getFullYear());
				userMonth.text((date.getMonth() + 1 < 10 ? '0'
						+ (date.getMonth() + 1) : date.getMonth() + 1));
				userDay.text(date.getDate());

				userEmail.val(data["user"]["f_email"])
				userPhone.append(data["user"]["f_user_mobile"]);
			}
		})
	}
	function edit() {
		$(".input-1").attr("readonly", false);
		$("input[name=sex]").attr("disabled", false);
		$(".input-3").attr("disabled", false);
		$("#date select").attr("disabled", false);
	}

	/* 前台输入编辑的资料 */
	function saveInfo() {

		var name = $("input[name=nicheng]");
		var sex = $("input:radio[name='sex']:checked");
		var year = $("#year option:selected");
		var month = $("#month option:selected");
		var day = $("#days option:selected");
		var email = $("input[name=email]");
		var user = ${user.f_user_id};

		$.ajax({
			type : "post",
			data : {
				users : user,
				username : name.val(),
				userSex : sex.val(),
				userYear : year.val(),
				userMonth : month.val(),
				userDay : day.val(),
				userEmail : email.val(),
			},
			dataType : "json",
			url : "/extraday/user/addInfo.do",
			success : function(data) {
				showPersonInfo()
				/* 	initPersonInfo()	 */
			},
		})
	}
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
				
				var tbody = $(".have-add1 tbody");
				tbody.html("");
				$.each(data, function(i, v) {
					var tr = "<tr>" + "<td class='address-exist'>" + v["1"]
							+ "</td>" + "<td class='address-exist'>" + v["2"]
							+ "</td>" + "<td class='address-exist'>" + v["3"]
							+ "</td>" + "<td class='address-exist'>"
							+ v["f_address_det"] + "</td>"
							+ "<td class='address-exist'>" + v["f_rec_name"]
							+ "(收)" + "</td>" + "<td class='address-exist'>"
							+ v["f_rec_mobile"] + "</td>" + "</tr>";
					tbody.append(tr);

				});

			}
		})
	}

	/* 初始化显示下拉框省市区 */
	function getRegion(index) {
		var sel;
		/* alert(index); */
		if (parseInt(index) == 0) {
			sel = $("#province");
		} else if (parseInt(index) % 10000 == 0) {
			sel = $("#city");
		} else {
			sel = $("#town");
		}

		$.ajax({
			type : "post",
			data : {
				areaParentID : index
			},
			dataType : "json",
			url : "/extraday/area/showProvince.do",
			success : function(data) {
				/* alert(data); */
				$(sel).html("");
				$.each(data, function(i, v) {
					/* alert(i); */
					$(sel).append("<option value='"+i+"'>" + v + "</option>");
				})
			},
			error : function() {
				alert("方法错误");
			}
		})
	}
	/* 添加地址 */
	function addAddress() {
		var id = ${user.f_user_id};
		var name = $("input[name=receiver]");
		var address = $("input[name=details]");
		var phone = $("input[name=receiverPhone]");
		var townId = $("#town option:selected");
	
	
		$.ajax({
			type : "post",
			data : {
				userId : id,
				recName : name.val(),
				addressDet : address.val(),
				recMobile : phone.val(),
				townID : townId.val(),

			},

			dataType : "json",
			url : "/extraday/address/addAddress.do",
			success : function(data) {
				showAddress()
			},
			error : function() {
				alert("无法添加收获地址");
			}
		})
	}

	function initOrder(status) {
		var goods = $(".p-msg a");
		var count = $(".goods-number");

		var userid = ${user.f_user_id};

		$
				.ajax({
					type : "post",
					data : {
						userID : userid,
						ostatus : status
					},
					dataType : "json",
					url : "/extraday/order/getOrder.do",
					success : function(data) {
						var tbody = $(".mc tbody");
						tbody.html("")
						if(data==""){
							tbody.append("还没有订单")							
						}
						$
								.each(
										data,
										function(i, v) {
											var stat = "";
											var operate = ""
											if (v["f_order_status"] == 1) {
												stat += "未付款";

												var pay = "<span><a href='alipay.trade.page.pay.jsp?WIDout_trade_no="
														+ v["f_order_id"]
														+ "&WIDtotal_amount="
														+ v["f_sum_price"]
														+ "&WIDsubject="
														+ v["f_order_code"]
														+ "&WIDbody="
														+ null
														+ "'>点击付款</a></span>";
												operate += pay;

											}
											if (v["f_order_status"] == 2) {
												stat += "待收货";
											}
											if (v["f_order_status"] == 3) {
												stat += "待评价"
											}

											var tr1 = "<tr class='order-number'><td colspan='6'><span class='dealtime'></span><span class='number'>订单号：<a href='#'>"
													+ v["f_order_id"]
													+ "</a></span></td></tr>"
											var tr2 = "<tr class='order-information'>"
													+ "<td class='goods'><div class='goods-item'><div class='p-img'><a href='#'><img src='img/order/order.webp.jpg' /></a></div><div class='p-msg'><a href='#'>梅子熟了 复古温柔风连衣裙 碎花雪纺初恋裙少女sukol2018夏新款</a></div></div><div class='goods-number'>x1</div></td>"
													+ "<td rowspan='1'><div><span>"
													+ v["f_rec_name"]
													+ "</span></div></td>"
													+ "<td rowspan='1'><div class='amount'><span>总额：¥"
													+ v["f_sum_price"]
													+ "</span><br /></div></td>"
													+ "<td rowspan='1'><div class='status'><span>"
													+ stat
													+ "</span><br/></div></td>"
													+ "<td rowspan='1'><div class='operate'><span><a href='#'>"
													+ operate
													+ "</a> </span></div></td>"
													+ "</tr>"

											tbody.append(tr1);
											tbody.append(tr2);
										})

					},

				})
	}
</script>

</head>
<body>

	<div class="header">
		<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~网页第一行-->
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
		<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~网页第二行-->
		<div class="top_section">
			<h1>星期八</h1>
			<div class="aa">
				<ul>
					<li><a class="aa-1" href="index.jsp">首页</a></li>
					<li class="aa2">账户设置▼
						<div class="aa21">
							<div class="aa21_1">
								<h3 style="color: black; font-family: '宋体';">安全设置</h3>
								<ul>
									<li><a>修改登录密码</a></li>
									<li><a>手机绑定</a></li>
									<li><a>密保问题</a></li>
								</ul>
							</div>
							<div class="aa21_4">
								<h3 style="color: black; font-family: '宋体';">个人资料</h3>
								<ul>
									<li><a>收获地址</a></li>
									<li><a href="personInfo.jsp">修改头像、昵称</a></li>
									<li><a>消息提醒设置</a></li>
								</ul>
							</div class="aa21_3">
							<div>
								<h3 style="color: black; font-family: '宋体';">账号绑定</h3>
								<ul>
									<li><a>支付宝绑定</a></li>
									<li><a>微博绑定</a></li>
									<li><a>分享绑定</a></li>
								</ul>
							</div>
						</div>
					</li>
					<li>消息</li>
				</ul>
			</div>
		</div>
	</div>
	<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~网页中部~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
	<section>
		<div class="section">
			<!--<div><img src="img/center/backgroud.png" width="1000px"/> </div>-->
			<div class="main-left fl">
				<div class="main-left-1">
					<ul>
						<li><h5>我的账户</h5></li>
						<li><span class="Info" onclick="showPersonInfo()">我的资料</span></li>
						<li><span class="Address" onclick="showAddress()">收获地址</span></li>
					</ul>
				</div>
				<div class="main-left-1">
					<ul>
						<li><h5>我的订单</h5></li>
						<li><span class="Order" onclick="showOrder()">订单管理</span></li>
						<li><span class="Comment">评价晒单</span></li>
					</ul>
				</div>
			</div>
			<div class="main-section">
				<!--个人中心首页-->
				<div class="main-section-center">
					<div class="main-section-center-accountPhoto">
						<a href="#"><img src="img/center/account.jpg" width="80px"
							height="80px" /></a>
						<div class="main-section-center-accountInfo">
							<ul>
								<li><a href="#" class="accountInfo-1">账号名</a></li>
								<li><a href="#" class="accountInfo-2">成长值<span>345</span></a></li>
							</ul>
						</div>
					</div>
				</div>
				<!--我的资料-->
				<div class="main-section-personInfo">
					<div class="section-head">
						<p>
							<span class="line">|</span><a href="center.html"> 我的星期八</a> >
							个人资料
						</p>
					</div>
					<div class="full-personInfo">
						<div class="main-section-personInfo-1">
							<span>个人资料</span>
						</div>
						<div class="main-section-personInfo-2">
							<!--<div class="main_section2">-->
							<a href="#"><img src="img/center/account.jpg" width="90px"
								height="90px" /></a>
							<div class="changePhoto">
								<span>编辑头像</span>
							</div>
							<span>登录名：<strong class="userPhone"></strong></span>
							<div class="photo">编辑头像</div>
							<!--</div>-->
						</div>
						<div class="main-section-personInfo-3">
							<form method="post">
								<div class="form-1">
									<p>
										<span class="num">*</span> 昵称&nbsp;&nbsp; <input
											class="input-1" type="text" name="nicheng"
											placeholder="星期八会员" />
									</p>
									<p>
										<span class="num">*</span> 性别&nbsp;&nbsp; <input
											class="input-2" type="radio" name="sex" value="1" />男 <input
											class="input-2" type="radio" name="sex" value="2" />女
									</p>
									<p>
										<span class="num">*</span> 生日&nbsp;&nbsp;
									<div id="date" style="margin-left: 40px; margin-top: -60px;">
										<select name="year" id="year">
											<option >选择年份</option>
										</select> <select name="month" id="month">
											<option >选择月份</option>
										</select> <select id="days" class="day">
											<option >选择日期</option>
										</select>
									</div>
									<script type="text/javascript">
										$(function(){
												$("#date").selectDate()
													$("#days").focusout(function() {
																		var year = $("#year option:selected").html()
																		var month = $("#month option:selected").html()
																		var day = $("#days option:selected").html()
																		console.log(year+month+day)
																	})

												})
									</script>
									<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
									<script type="text/javascript" src="js/select.js"></script>
									</p>


									<p>
										移动电话：&nbsp;&nbsp;<span class="userPhone"></span>&nbsp;&nbsp;（已验证）&nbsp;&nbsp;
										<a href="#">修改</a>
									</p>
									<p>
										<span class="num">*</span> 邮箱&nbsp;&nbsp; <input
											class="input-3" type="text" name="email" />
									</p>
								</div>
								<div class="form-2">
									<p>
										<input class="input-4" type="button" value="编辑资料"
											onclick="edit()" /> <input class="input-5" type="button"
											value="保存" onclick="saveInfo()" />&nbsp;&nbsp;
										<!--<input class="input-6" type="submit" value="重置" />-->
									</p>
								</div>
							</form>
						</div>
					</div>
				</div>
				<!--收获地址-->
				<div class="main-section-address">
					<div class="section-head">
						<p>
							<span class="line">|</span><a href="center.html"> 我的星期八</a> >
							收货地址
						</p>
					</div>
					<div class="full-address">

						<div class="have-address">
							<div class="address-title">
								<strong>已经保存的收货地址</strong> <a class="add-btn"
									onclick="showAddAddress()">新增收货地址</a>
							</div>
							<div class="have-add1">
								<table border="1px" rules="none" cellspacing="0px">
									<thead>
										<tr class="d2">
											<th colspan="3">地区</th>
											<th>收货人地址</th>
											<th>收货人姓名</th>
											<th>收货人电话</th>
										</tr>
									</thead>

									<tbody>

									</tbody>
								</table>
								<!-- <p>江苏省 南京市 建邺区 莫愁湖街道 云锦路58号万达东坊(Bella 收) 13260907127 </p> -->
							</div>
							<div class="add-address">
								<h3 class="add-title">新增收货地址</h3>
								<h3 class="modify-title">新增收货地址</h3>
								<div class="add-box">
									<div class="u-address-input">
										收货人：<input class="name-input" type="text" name="receiver"
											placeholder="收货人姓名" />
									</div>
									<div class="u-address-input">
										<label class="address-head">地址:</label>
										<div class="outer">
											<!-- $(this).find("option:selected").val() -->
											<select name="province" id="province"
												onblur="getRegion(this.value)">
												<option value="请选择">请选择</option>
											</select> <select name="city" id="city" onblur="getRegion(this.value)">
												<option value="请选择">请选择</option>
											</select> <select name="town" id="town">
												<option value="请选择">请选择</option>
											</select>
										</div>
										<div class="u-address-detailed">
											<input class="detailed-input" type="text" name="details"
												placeholder="详细地址" />
										</div>
									</div>
									<div class="u-address-input">
										手机号：<input class="name-input" type="text" name="receiverPhone"
											placeholder="收货人手机号" />
									</div>

									<div class="submit-button">
										<!-- <a class="button-save" onclick="getAddress()">保存收货地址</a>  -->
										<input class="button-save" type="button" value="保存收货地址"
											onclick="addAddress()" />
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--订单管理-->
				<div>
					<div class="main-section-order">
						<div class="section-head">
							<p>
								<span class="line">|</span><a href="center.html"> 我的星期八</a> >
								订单管理
							</p>
						</div>
						<div class="full-order">
							<div class="main-section-order-1">
								<span><strong>我的订单</strong></span>
							</div>
							<div class="main-section-order-2">
								<div class="mt">
									<ul>
										<li><a href="javascript:void(0)" onclick="initOrder(-1)">全部订单</a></li>
										<li><a href="javascript:void(0)" onclick="initOrder(1)">待付款</a></li>
										<li><a href="javascript:void(0)" onclick="initOrder(2)">待收货</a></li>
										<li><a href="javascript:void(0)" onclick="initOrder(3)">待评价</a></li>
									</ul>
									<!-- <div class="search">
								<input id="ip_keyword" type="text" class="itxt" value="商品名称/商品编号/订单号">
                                <a href="javascript:;" class="search-btn" clstag="click|keycount|orderinfo|search">搜索<b></b></a>
							</div> -->
								</div>
								<div class="mc">
									<table border="1px" cellspacing="0px">


										<thead>
											<tr>
												<th class="or">
													<div class="order-time">订单</div>
													<div class="order-de">订单详情</div>
												</th>
												<th>收货人</th>
												<th>金额</th>
												<th>全部状态</th>
												<th>操作</th>
											</tr>
										</thead>





										<tbody>

											<%-- <c:forEach var="order" items="${orders}">
									
								
									<tr class="order-number">
										<td colspan="6">
											<span class="dealtime">${order.f_create_time}</span>
											<span class="number">订单号：<a href="#">${order.f_order_id }</a> </span>
										</td>
									</tr>
									<tr class="order-information">
										<td class="goods">
											<div class="goods-item">
												<div class="p-img">
													<a href="#"><img src="img/order/order.webp.jpg" /> </a>
												</div>
												<div class="p-msg">
													<a href="#">梅子熟了 复古温柔风连衣裙 碎花雪纺初恋裙少女sukol2018夏新款</a>
												</div>
											</div>
											<div class="goods-number">x1</div>
										</td>
										<td rowspan="1">
											<div>
												<span>王彦昭</span>
											</div>
										</td>
										<td rowspan="1">
											<div class="amount">
												<span>总额：¥188</span><br />
												
											</div>
										</td>
										<td rowspan="1">
											<div class="status">
												<span>已支付</span><br />
												<span><a href="#">查看订单</a> </span>
											</div>
										</td>
										<td rowspan="1">
											<div class="operate">
												<span><a href="#">立即评价</a> </span>
											</div>
										</td>
									</tr>
									
									</c:forEach> --%>
										</tbody>





									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--评价晒单-->
				<div></div>
			</div>
		</div>
	</section>


</body>
</html>
