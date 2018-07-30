<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>

<html>

<head>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<title>商品详情</title>
<link rel="stylesheet" href="<%=basePath%>/css/details.css" />
<script type="text/javascript"
	src="<%=basePath%>/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
		<%-- 	var imgs=["good_big0.jpg","good_big1.jpg","good_big2.jpg","good_big3.jpg","good_big4.jpg"];
    		var index=0;  		
			$(function(){						
				$(".sec_img ul li").click(function(){
    				index = $(".sec_img ul li").index(this);
    				$(".sec_1 img").attr("src","<%=basePath%>/img/details/"+imgs[index]);			
    				$(".sec_img  ul li").removeClass("active");
    				$(".sec_img  ul li:nth-of-type("+(index+1)+")").addClass("active");  
    			});
			})
		  --%>
			
			
					var map=new Map();
					var buySku=-1;
					var imgsBan=new Array();
					var flag=true;
					$(function(){
						initData(${param.spu_id});
				})	
			function initData(i){
				$.ajax({
					data:{
						spu_id:i
					},
					dataType:"json",
					url:"/extraday/goods/getSpuDetails.do",
					type:"post",
					success:function(json){
						
						
						/* 绑定spu商品详情*/
						var spu=$("#details");
						$(spu).find("p").html(json["spu"]["f_good_detail"]);
						/*绑定spu商品图片*/
						
						/* 绑定sku属性*/
						var index=0;
						$.each(json["attr"],function(i,v){
						
						
							if(index>=1){
					 			var newData=$(".select_attr").clone(true);
					 			/* $(".show111 .middle-column-con").append(newData); */
					 			newData.insertAfter($(".select_attr")[index-1])
					 		}
							var attrDD=$(".select_attr")[index]
							$(attrDD).html("")
							$(attrDD).append("<span>"+i+"</span><ul></ul>")
							
							/* alert($(attrDD).html()) */
							
							$.each(v,function(ind,value){
					
								var li="<li title='"+value["f_value_id"]+"' value='"+value["f_attr_name"]+"' onmousedown='checkattr("+index+","+ind+","+value["f_attr_id"]+","+value["f_value_id"]+")' onclick='postattr()'>"+value["f_value_name"]+"</li>"
								map.put(value["f_attr_id"],0);
							
								$(attrDD).find("ul").append(li);
								
							})
							
							index++;
						})
						
						
						/*绑定图片*/
						$.each(json["img"],function(i,v){
							imgsBan[i]=v["f_pic_url"];
							var imgLi="<li onclick='changeImg("+i+")'><img src='"+v["f_pic_url"]+"'></li>"
							$(".sec_img ul").append(imgLi);
							
						})
						
						$(".sec_1 img").attr("src","<%=basePath%>/"+imgsBan[0]);
						
						//动态点击事件待添加	
						
						
					 
						
						
					},
					error:function(){
						alert("请求超时")
					}
				})
				
			}
			
					
					function changeImg(i){
						index = i
		
	    				$(".sec_1 img").attr("src","<%=basePath%>/"+imgsBan[index]);			
	    				$(".sec_img  ul li").removeClass("active");
	    				$(".sec_img  ul li:nth-of-type("+(index+1)+")").addClass("active"); 
		
						
					}
					
					
					function checkattr(index,ind,a,b){
						var selectDD=$(".select_attr").find("ul").eq(index)
						var selectVal=$(selectDD).find("li").eq(ind);
						$(selectVal).css("border","2px solid red")
						$(selectVal).siblings().css("border","1px solid black");
						
						map.put(a,b);						
					}
			
					function postattr(){
						var skuV=new Array()
						for(var i=0;i<map.keys.length;i++){
							var k=map.keys[i];
							skuV[i]=map.get(k);
						}
						$.ajax({
							type:"post",
							data:{
								spu_id:${param.spu_id},
								skus:skuV,
								},
							traditional: true,
							url:"/extraday/goods/getSku.do",
							dataType:"json",
							/* traditional:true, */
							success:function(data){
								if(data!=null){
									var spu=$("#details");
									$(spu).find("p").html(data["f_sku_name"]);								
									$("#price").html("")
									$("#price").html(data["f_price"]);
									
									//动态绑定数据
								
									buySku=data["f_sku_id"];
									
									
									$(".inventory").html("")
									
									$(".inventory").html("库存："+"<a>"+data["f_inventory"]+"</a>")
								}
							}
							
							
						})
						
						
					}
					
					
			function Map() {     
			    /** 存放键的数组(遍历用到) */    
			    this.keys = new Array();     
			    /** 存放数据 */    
			    this.data = new Object();     
			         
			    /**   
			     * 放入一个键值对   
			     * @param {String} key   
			     * @param {Object} value   
			     */    
			    this.put = function(key, value) {     
			        if(this.data[key] == null){     
			            this.keys.push(key);     
			        }     
			        this.data[key] = value;     
			    };     
			         
			    /**   
			     * 获取某键对应的值   
			     * @param {String} key   
			     * @return {Object} value   
			     */    
			    this.get = function(key) {     
			        return this.data[key];     
			    };     
			         
			    /**   
			     * 删除一个键值对   
			     * @param {String} key   
			     */    
			    this.remove = function(key) {     
			        this.keys.remove(key);     
			        this.data[key] = null;     
			    };     
			         
			    /**   
			     * 遍历Map,执行处理函数   
			     *    
			     * @param {Function} 回调函数 function(key,value,index){..}   
			     */    
			    this.each = function(fn){     
			        if(typeof fn != 'function'){     
			            return;     
			        }     
			        var len = this.keys.length;     
			        for(var i=0;i<len;i++){     
			            var k = this.keys[i];     
			            fn(k,this.data[k],i);     
			        }     
			    };     
			         
			    /**   
			     * 获取键值数组(类似Java的entrySet())   
			     * @return 键值对象{key,value}的数组   
			     */    
			    this.entrys = function() {     
			        var len = this.keys.length;     
			        var entrys = new Array(len);     
			        for (var i = 0; i < len; i++) {     
			            entrys[i] = {     
			                key : this.keys[i],     
			                value : this.data[i]     
			            };     
			        }     
			        return entrys;     
			    };     
			         
			    /**   
			     * 判断Map是否为空   
			     */    
			    this.isEmpty = function() {     
			        return this.keys.length == 0;     
			    };     
			         
			    /**   
			     * 获取键值对数量   
			     */    
			    this.size = function(){     
			        return this.keys.length;     
			    };     
			         
			    /**   
			     * 重写toString    
			     */    
			    this.toString = function(){     
			        var s = "{";     
			        for(var i=0;i<this.keys.length;i++,s+=','){     
			            var k = this.keys[i];     
			            s += k+"="+this.data[k];     
			        }     
			        s+="}";     
			        return s;     
			    };     
			}
			
			
			
			
			
			function addSku(){
				
				if(buySku<0){
					alert("请选择商品款式");
				}else if(!flag){
					alert("库存不足")	
				}
				else{
					var count=$("#getCount")
					$.ajax({
						type:"post",
						data:{
							sku:buySku,
							count:count.val()
							},
						traditional: true,
						url:"/extraday/goods/addCart.do",
						dataType:"json",
						/* traditional:true, */
						success:function(data){
							alert("加入购物车成功,跳转中.....")
							window.location.href="shopCar.jsp";
						}
						
						
					})
					
					
				}
			
				
				
				
				/* window.location.href="shopCar.jsp"; */
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
						<li class="coll_bg"><a href="#">我的特卖</a>
							<div class="coll_list">
								<ul>
									<li>收藏宝贝</li>
									<li>我的足迹</li>
								</ul>
							</div></li>

						<li><a href="#">联系客服</a></li>|
						<li><a href="shopCar.jsp">购物车</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="h_bottom">
			<div class="h_bottom1 ">
				<div class="logo">
					<a href="index.jsp"><span>星期八 </span> My Day</a>
				</div>
				<!-- <div class="search fr">
					<form>
						<input type="search" placeholder="请输入心仪宝贝" /> <input
							type="submit" value="搜索" />
					</form>
				</div> -->
			</div>
		</div>
	</header>
	<section>
		<div class="sec_s">
			<div class="sec_s_left fl">
				<div class="sec_1">
					<img src="" />
				</div>
				<div class="sec_img">
					<ul></ul>
				</div>

				<div class="sec_coll">
					<dl>
						<dt>
							<a href="#"><img src="img/details/E_s.png" />收藏宝贝</a>(181...人气)
						</dt>

					</dl>
					<dl>
						<dt>
							<a><img src="img/details/E_f.png" />分享</a>
						</dt>
						<dd class="fr"></dd>
					</dl>
				</div>
			</div>
			<div class="sec_s_right fl" id="details">
				<p></p>
				<div class="sec_price ">
					<div class="sec_p1 fl ">
						<ul>
							<!-- 	<li>价格<span class="sec_number1">￥149</span></li> -->
							<li>会员价<span class="sec_number2" id="price">???</span></li>
						</ul>
					</div>
					<div class="sec_p2 fr">
						<ul>
							<a>
								<li>7260</li>
								<li class="sec_comm">累计评价</li>
							</a>
						</ul>
						<ul>
							<li>1856</li>
							<li class="sec_suc">交易成功</li>
						</ul>
					</div>
				</div>
				<div class="sec_select">
					<dl>

						<dd class="select_attr">

							<ul class="sec_colors fr">

							</ul>
						</dd>
						<dd>
							<span>数量</span>
							<div class="sec_num fr">
								<button class="DelCount" onclick="delCount()">-</button>
								<input id="getCount" class="inputCount" title="请输入购买量"
									type="text" value="1" onblur="changeCount()" />
								<button class="AddCount" onclick="addCount()">+</button>
								件
							</div>
							<span class="inventory"></span>
						</dd>
					</dl>
				</div>


				<script>
				function isInteger(obj) {
					 return Math.floor(obj) == obj
					}
		
				function changeCount(){						
						var count=$("#getCount");
						if(count.val()<=0){
							alert("商品数量不合法")
							count.val(1);
						}
						var countnum=count.val()
					
						if(!isInteger(countnum)){
							alert("请输入整数值");
							count.val(1);
						}
						
						
						var inventory=parseInt($(".inventory a").html())
						if(count.val()>inventory){
							flag=false;
						}
					}
					
					function addCount(){
						var count1=$("#getCount");
						var count=$(count1).val()
						count++;
						count1.val(count);
						var inventory=parseInt($(".inventory a").html())
						if(count>inventory){
							alert("超出库存")
							flag=false;
						}
						
					}
					
					function delCount(){
						var count1=$("#getCount");
						var count=$(count1).val()
						count--;
						if(count<=0){
							alert("商品数量不合法")
							count=1;
						}
						count1.val(count);
						
					}
					
					
				
				
				</script>

























				<div class="sec_buy">
					<a href="#" id="buy">立即购买 </a> <a href="javascript:void(0)"
						id="car" onclick="addSku()">加入购物车</a>
				</div>
				<div class="sec_extra">
					<dl>
						<dt>承诺</dt>
						<dd>
							<a href="#"
								title="满足7天无理由退换货申请的前提下，包邮商品需要买家承担退货邮费，
										非包邮商品需要买家承担发货和退货邮费"><img
								src="img/details/E_sd.jpg" /> 7天无理由</a>
						</dd>
					</dl>
					<dl>
						<dt>支付</dt>
						<dd>
							<a href="#" title=""><img src="img/details/E_mayi.png" />
								蚂蚁花呗</a> <a href="#"><img src="img/details/E_yu.png" />余额</a>
						</dd>
					</dl>
				</div>
			</div>
		</div>

		<div class="sec_detail_list">
			<ul>
				<li><a href="#">宝贝详情</a></li>
				<li><a href="#">累计评论<span>8016</span></a></li>
				<li><a href="#">专享服务</a></li>
			</ul>
		</div>
		<div class="sec_all">
			<!--商品详情-->
			<div class="sec_details">
				<ul>
					<li title="A型">廓形:&nbsp;A型</li>
					<li title="01180150">货号:&nbsp;01180150</li>
					<li title="通勤">风格:&nbsp;通勤</li>
					<li title="文艺">通勤:&nbsp;文艺</li>
					<li title="单件">组合形式:&nbsp;单件</li>
					<li title="中裙">裙长:&nbsp;中裙</li>
					<li title="其他/other">款式:&nbsp;其他/other</li>
					<li title="九分袖">袖长:&nbsp;九分袖</li>
					<li title="半开领">领型:&nbsp;半开领</li>
					<li title="灯笼袖">袖型:&nbsp;灯笼袖</li>
					<li title="高腰">腰型:&nbsp;高腰</li>
					<li title="套头">衣门襟:&nbsp;套头</li>
					<li title="其他">裙型:&nbsp;其他</li>
					<li title="碎花">图案:&nbsp;碎花</li>
					<li title="系带 绑带">流行元素/工艺:&nbsp;系带 绑带</li>
					<li title="梅子熟了">品牌:&nbsp;星期八</li>
					<li title="雪纺">面料:&nbsp;雪纺</li>
					<li title="95%以上">成分含量:&nbsp;95%以上</li>
					<li title="其他">材质:&nbsp;其他</li>
					<li title="2018年春季">年份季节:&nbsp;2018年春季</li>
					<li title="米底红花">颜色分类:&nbsp;米底红花</li>
					<li title="S M">尺码:&nbsp;S M</li>
				</ul>
			</div>

			<div class="sec_detail_img">
				<img src="img/details/E_de1.jpg" />
				<p class="sec_heading">面料细节描写</p>
				<img src="img/details/E_det3.png" />
				<p class="sec_heading">尺码表</p>
				<img src="img/details/E_det4.png"
					style="width: 780px; height: 1100px;" />
				<p class="sec_heading">星期八效果图</p>
				<img src="img/details/E_det2.png" style="width: 800px;" />
				<p class="sec_heading">星期八模特展示</p>
				<img src="img/details/E_det5.png"
					style="width: 800px; height: 1200px;" />
				<p class="sec_words">和飘逸的长裙相比，短裙更显精灵俏皮哦</p>
				<p class="sec_words">系带的镂空领，轻松演绎复古文艺。</p>
				<img src="img/details/E_det6.jpg"
					style="width: 800px; height: 1200px;" />
				<p class="sec_words">浪漫的荷叶摆，短裙也爱飘逸!</p>
				<p class="sec_words">腰线自然不能少，</p>
				<p class="sec_words">小个子姑娘显高的秘诀在这里哦！</p>
				<img src="img/details/E_det7.jpg"
					style="width: 800px; height: 1000px;" />
				<p class="sec_words">颜色是低调又明艳的那种，</p>
				<p class="sec_words">米色打底，大部分姑娘都适合，</p>
				<p class="sec_words">气质还不怎么挑人。</p>
				<img src="img/details/E_det8.jpg" /> <img
					src="img/details/E_det9.jpg" /> <img src="img/details/E_det10.jpg" />
				<img src="img/details/E_det11.jpg" /> <img
					src="img/details/E_det12.jpg" /> <img
					src="img/details/E_det13.jpg" /> <img
					src="img/details/E_det14.jpg" /> <img
					src="img/details/E_det15.jpg" /> <img
					src="img/details/E_det16.jpg" /> <img
					src="img/details/E_det17.jpg" /> <img
					src="img/details/E_det18.jpg" /> <img
					src="img/details/E_det19.jpg" />
				<p class="sec_heading">细节展示</p>
				<img src="img/details/E_det20.png" style="width: 800px;" /> <img
					src="img/details/E_det21.png" style="width: 800px;" /> <img
					src="img/details/E_det22.png" style="width: 800px;" /> <img
					src="img/details/E_det23.jpg" style="width: 800px;" /> <img
					src="img/details/E_det24.png" style="width: 800px;" /> <img
					src="img/details/E_det25.png" style="width: 800px;" />
			</div>
			<!--评论-->
			<div class="sec_comment">
				<ul class="comment">
					<li>宝贝评论</li>
				</ul>
				<div class="sec_comment_list">
					<h3>大家印象:</h3>
					<ul>
						<li><a href="#">版式好(547)</a></li>
						<li><a href="#">整体不错(167)</a></li>
						<li><a href="#">穿着效果好(164)</a></li>
						<li><a href="#">衣服很舒服(77)</a></li>
						<li><a href="#">款式漂亮(57)</a></li>
						<li><a href="#">尺码标准(50)</a></li>
						<li><a href="#">布料好(37)</a></li>
						<li><a href="#">做工很赞(11)</a></li>
						<li><a href="#" class="gray">有色差</a></li>
						<li><a href="#" class="gray">颜色一般</a></li>
					</ul>
				</div>
				<div class="sec_bar">
					<ul class="secBar_bars">
						<li><label> <input value="" checked="" type="radio" />全部
						</label></li>
						<li><label> <input value="3" type="radio" />图片 <span>
									<span>(751)</span>
							</span>
						</label></li>
						<li><label> <input value="2" type="radio" />追评 <span>
									<span>(189)</span>
							</span>
						</label></li>
						<li><label> <input value="1" type="radio" />好评 <span>
									<span>(8321)</span>
							</span>
						</label></li>
						<li><label> <input value="0" type="radio" />中评 <span>
									<span>(24)</span>
							</span>
						</label></li>
						<li><label> <input value="-1" type="radio" />差评 <span>
									<span>(2)</span>
							</span>
						</label></li>
					</ul>
					<!--<div class="sorting">
							<div>
								<span>推荐排序</span>
								<i class="arrow"></i>
							</div>
							<ul>
								<li></li>
								<li></li>
							</ul>
						</div>-->
					<div class="sec_main">
						<ul>
							<li class="sec_main_first">
								<div class="from-whom">
									<img src="img/details/photo_1.jpg" />

									<div>故***说</div>
									<img src="img/details/1zuan.gif" />
								</div>
								<div class="review-details">
									<div class="review-content">买给妹妹去乌镇旅游穿的，很好看的啦，
										只吃梅子家，我妹一米六，九十五斤emmmm.</div>
									<div class="review-media">
										<ul>
											<li><img
												mp4-src="//cloud.video.taobao.com/play/u/77794e4b5664726a444e4344414e6c2f5479507732413d3d/p/1/d/ud/e/6/t/1/50169954804.mp4"
												swf-src="//cloud.video.taobao.com/play/u/77794e4b5664726a444e4344414e6c2f5479507732413d3d/p/1/d/ud/e/1/t/1/50169954804.swf"
												src="//img.alicdn.com/imgextra/i3/TB2V65Ryb1YBuNjSszeXXablFXa_!!2-tbbala.png" />
											</li>
											<li><img src="img/details/item_1.jpg" /></li>
											<li><img src="img/details/item_2.jpg" /></li>
											<li><img src="img/details/item_3.jpg" /></li>
											<li><img src="img/details/item_4.jpg" /></li>
										</ul>
									</div>
									<div class="review-bar">
										<div class="review-bar-info">
											<span class="review-bar-date">2018年6月16日 20:03</span>
											颜色分类：米底红花 尺寸：M码
										</div>
										<ul class="review-bar-actions">
											<li class="review-bar-action"><span
												class="review-bar-btn">有用</span> <span
												class="review-bar-num">(0)</span></li>
										</ul>
									</div>
								</div>
							</li>
							<li class="sec_main_first">
								<div class="from-whom">
									<img src="img/details/photo_2.jpg" />

									<div>s***5</div>
									<img src="img/details/4heart.gif" />
								</div>
								<div class="review-details">
									<div class="review-content">这是一个好评模板，因为本仙女很懒，不想每个产品都写好评，
										所以特地模仿一位网友写下了这个模板，但是这个产品无论是质 量和外观肯定都是仙女喜欢的，如果不喜欢仙女收到东西会很生气，
										然后这个模板就会变成仙女喋喋不休的抱怨书，自然不可能撒下这个好评， 这里写下也给各位淘友一个参考，这个物品还是值得购买的。
										---来自一位懒惰的只爱购物不爱写评语却想换积分的仙女。</div>
									<div class="review-media">
										<ul>
											<li><img src="img/details/item_5.jpg" /></li>
											<li><img src="img/details/item_6.jpg" /></li>
											<li><img src="img/details/item_7.jpg" /></li>
											<li><img src="img/details/item_8.jpg" /></li>
											<li><img src="img/details/item_9.jpg" /></li>
										</ul>
									</div>
									<div class="review-bar">
										<div class="review-bar-info">
											<span class="review-bar-date">2018年6月20日 19:57</span>
											颜色分类：米底红花 尺寸：S码
										</div>
										<ul class="review-bar-actions">
											<li class="review-bar-action"><span
												class="review-bar-btn">有用</span> <span
												class="review-bar-num">(0)</span></li>
										</ul>
									</div>
								</div>
							</li>
							<li class="sec_main_first">
								<div class="from-whom">
									<img src="img/details/photo_3.jpg" />

									<div>时***一</div>
									<img src="img/details/3heart.gif" />
								</div>
								<div class="review-details">
									<div class="review-content">
										效果不错，但是刚穿上觉得很像睡裙，衣服不透，外面的料子特别薄，
										真怕不一个不小心就会扯坏，穿的时候小心翼翼，胸大的妹子不建议买， 衣服整体上身效果还是不错的，具体看图</div>
									<div class="review-media">
										<ul>
											<li><img src="img/details/item_10.jpg" /></li>

										</ul>
									</div>
									<div class="review-bar">
										<div class="review-bar-info">
											<span class="review-bar-date">2018年6月23日 10:47</span>
											颜色分类：米底红花 尺寸：M码
										</div>
										<ul class="review-bar-actions">
											<li class="review-bar-action"><span
												class="review-bar-btn">有用</span> <span
												class="review-bar-num">(0)</span></li>
										</ul>
									</div>
								</div>
							</li>
							<li class="sec_main_first">
								<div class="from-whom">
									<img src="img/details/photo_4.jpg" />

									<div>a***6</div>
									<img src="img/details/4heart.gif" />
								</div>
								<div class="review-details">
									<div class="review-content">
										因为相机的缘故，所以照片里看上去是白色，但其实它是杏色的啦，穿上特别好看，
										买了的人一定不会后悔的！以前看到的时候就想买，结果一拖再拖，现在终于入手了， 特别特别漂亮，看到衣服有种很惊艳的感觉呢！</div>
									<div class="review-media">
										<ul>
											<li><img src="img/details/item_11.jpg" /></li>

										</ul>
									</div>
									<div class="review-bar">
										<div class="review-bar-info">
											<span class="review-bar-date">2018年6月23日 07:07</span>
											颜色分类：米底红花 尺寸：S码
										</div>
										<ul class="review-bar-actions">
											<li class="review-bar-action"><span
												class="review-bar-btn">有用</span> <span
												class="review-bar-num">(0)</span></li>
										</ul>
									</div>
								</div>
								<div class="review-details_append">
									<div class="review-content">
										<span>[追加评论]</span> 原谅我忍不住出来放图，端午前一天拍的，后期是我，摄影是室友😏
									</div>
									<div class="review-media">
										<ul>
											<li><img src="img/details/item_12.jpg" /></li>
											<li><img src="img/details/item_13.jpg" /></li>
										</ul>
									</div>
									<div class="review-bar">
										<div class="review-bar-info">
											<span class="review-bar-date">确认收货后 3 天追加</span>

										</div>

									</div>
								</div>
							</li>
							<li class="sec_main_first">
								<div class="from-whom">
									<img src="img/details/photo_5.jpg" />

									<div>t***0</div>
									<img src="img/details/2heart.gif" />
								</div>
								<div class="review-details">
									<div class="review-content">
										穿上感觉还是不错的，裙子刚刚到膝盖上面。感觉裙子材质容易勾丝，
										要小心点，穿着可能会感觉有点热，不过我这里本来也比较热，总之还 是很满意的，以后也会继续支持的。</div>
									<div class="review-bar">
										<div class="review-bar-info">
											<span class="review-bar-date">2018年6月23日 13:58</span>
											颜色分类：米底红花 尺寸：S码
										</div>
										<ul class="review-bar-actions">
											<li class="review-bar-action"><span
												class="review-bar-btn">有用</span> <span
												class="review-bar-num">(0)</span></li>
										</ul>
									</div>
								</div>
							</li>
							<li class="sec_main_first">
								<div class="from-whom">
									<img src="img/details/photo_3.jpg" />

									<div>李***3</div>
									<img src="img/details/5heart.gif" />
								</div>
								<div class="review-details">
									<div class="review-content">评价方未及时做出评价,系统默认好评!</div>
									<div class="review-bar">
										<div class="review-bar-info">
											<span class="review-bar-date">2018年5月09日 15:53</span>
										</div>
										<ul class="review-bar-actions">
											<li class="review-bar-action"><span
												class="review-bar-btn">有用</span> <span
												class="review-bar-num">(0)</span></li>
										</ul>
									</div>
								</div>
								<div class="review-details_append">
									<div class="review-content">
										<span>[追加评论]</span> 好看好看～表白表白～
									</div>
									<div class="review-media">
										<ul>
											<li><img src="img/details/item_14.jpg" /></li>

										</ul>
									</div>
									<div class="review-bar">
										<div class="review-bar-info">
											<span class="review-bar-date">确认收货后 24天追加</span>

										</div>

									</div>
								</div>
							</li>

						</ul>
						<div class="page">
							<ul>
								<li class="pg-pre">上一页</li>
								<li class="page-first">1</li>
								<li>2</li>
								<li>3</li>
								<li>4</li>
								<li>5</li>
								<li class="pg-next">下一页</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<!--其他公有的-->
			<div class="others">
				<div class="price-spec">
					<h3 class="spec-title">价格说明</h3>
					<p class="title">划线价格</p>
					<p class="info">
						指商品的专柜价、吊牌价、正品零售价、厂商指导价或该商品的曾经展示过的销售价等， <strong>并非原价</strong>，仅供参考。
					</p>
					<p class="title">未划线价格</p>
					<p class="info">
						指商品的<strong>实时标价</strong>，不因表述的差异改变性质。具体成交价格根据商品参加活动，
						或会员使用优惠券、积分等发生变化，最终以订单结算页价格为准。
					</p>
					<p class="info">商家详情页（含主图）以图片或文字形式标注的一口价、促销价、优惠价等价格可能是在使用优惠券、
						满减或特定优惠活动和时段等情形下的价格，具体请以结算页面的标价、优惠条件或活动规则为准。</p>

				</div>
				<div class="still-look">
					<h5>看了该宝贝的人还看了</h5>
					<div class="small-dec"></div>
					<div class="item-lists">
						<ul>
							<li>
								<div class="item">
									<div class="pic">
										<a class="side-item"> <img
											src="img/details/still-look1.jpg" />
										</a>
									</div>
									<div class="desc">
										<a class="side-item">文艺清新碎花雪纺连衣裙 复古chic森系仙</a>
									</div>
									<p>
										<span class="tuijian-price"> <b class="yen">￥</b> <b
											class="price">169.00</b>
										</span>
									</p>
								</div>
							</li>
							<li>
								<div class="item">
									<div class="pic">
										<a class="side-item"> <img
											src="img/details/still-look2.jpg" />
										</a>
									</div>
									<div class="desc">
										<a class="side-item">文艺小碎花雪纺裙 复古港味中长款连衣裙女</a>
									</div>
									<p>
										<span class="tuijian-price"> <b class="yen">￥</b> <b
											class="price">149.00</b>
										</span>
									</p>
								</div>
							</li>
							<li>
								<div class="item">
									<div class="pic">
										<a class="side-item"> <img
											src="img/details/still-look3.jpg" />
										</a>
									</div>
									<div class="desc">
										<a class="side-item">文艺雪纺连衣裙初恋裙复古娃娃裙少</a>
									</div>
									<p>
										<span class="tuijian-price"> <b class="yen">￥</b> <b
											class="price">169.00</b>
										</span>
									</p>
								</div>
							</li>
							<li>
								<div class="item">
									<div class="pic">
										<a class="side-item"> <img
											src="img/details/still-look4.jpg" />
										</a>
									</div>
									<div class="desc">
										<a class="side-item">复古温柔风仙气连衣裙港味碎花雪纺中长初恋裙</a>
									</div>
									<p>
										<span class="tuijian-price"> <b class="yen">￥</b> <b
											class="price">149.00</b>
										</span>
									</p>
								</div>
							</li>
							<li>
								<div class="item">
									<div class="pic">
										<a class="side-item"> <img
											src="img/details/still-look5.jpg" />
										</a>
									</div>
									<div class="desc">
										<a class="side-item">复古温柔风连衣裙 中长吊带裙少女初</a>
									</div>
									<p>
										<span class="tuijian-price"> <b class="yen">￥</b> <b
											class="price">149.00</b>
										</span>
									</p>
								</div>
							</li>
					</div>

				</div>
				<div class="still-look">
					<h5>买了该宝贝的人还买了</h5>
					<div class="small-dec"></div>
					<div class="item-lists">
						<ul>
							<li>
								<div class="item">
									<div class="pic">
										<a class="side-item"> <img
											src="img/details/still_buy1.jpg" />
										</a>
									</div>
									<div class="desc">
										<a class="side-item">文艺清新碎花雪纺连衣裙 复古chic森系仙</a>
									</div>
									<p>
										<span class="tuijian-price"> <b class="yen">￥</b> <b
											class="price">165.00</b>
										</span>
									</p>
								</div>
							</li>
							<li>
								<div class="item">
									<div class="pic">
										<a class="side-item"> <img
											src="img/details/still_buy2.jpg" />
										</a>
									</div>
									<div class="desc">
										<a class="side-item"> 文艺清新荷叶边雪纺衫 复古喇叭袖</a>
									</div>
									<p>
										<span class="tuijian-price"> <b class="yen">￥</b> <b
											class="price">169.00</b>
										</span>
									</p>
								</div>
							</li>
							<li>
								<div class="item">
									<div class="pic">
										<a class="side-item"> <img
											src="img/details/still_buy3.jpg" />
										</a>
									</div>
									<div class="desc">
										<a class="side-item">文艺V领灯笼袖雪纺衫 复古印花衬衫女</a>
									</div>
									<p>
										<span class="tuijian-price"> <b class="yen">￥</b> <b
											class="price">98.00</b>
										</span>
									</p>
								</div>
							</li>
							<li>
								<div class="item">
									<div class="pic">
										<a class="side-item"> <img
											src="img/details/still_buy4.jpg" />
										</a>
									</div>
									<div class="desc">
										<a class="side-item">小清新半身裙高腰复古港味格子包臀裙女</a>
									</div>
									<p>
										<span class="tuijian-price"> <b class="yen">￥</b> <b
											class="price">89.00</b>
										</span>
									</p>
								</div>
							</li>
							<li>
								<div class="item">
									<div class="pic">
										<a class="side-item"> <img
											src="img/details/still_buy5.jpg" />
										</a>
									</div>
									<div class="desc">
										<a class="side-item">文艺设计感印花衬衫复古港风小心机雪纺衫女</a>
									</div>
									<p>
										<span class="tuijian-price"> <b class="yen">￥</b> <b
											class="price">98.00</b>
										</span>
									</p>
								</div>
							</li>
					</div>

				</div>
			</div>
			<!--商品咨询-->
			<div class="consult">
				<div class="question">
					<div class="q-tit">
						购买前如有问题，请向星期八咨询。 <a class="q-tit-btn" href=""> <span>咨询客服</span></a>
					</div>
					<dl class="q-tit-item">
						<dt class="qti-title">
							<i class="qti-question"></i>
							<p class="qti-txt">衣服图片上搭配的腰带、项链等配件，会连商品一同送货吗？</p>
						</dt>
						<dd class="qti-content">
							<i class="qti-answer"></i>
							<p class="qti-txt">这点请注意咯，如非特别说明，服装类商品图片中的腰带、饰品等配件均为拍摄搭配之用，是不包含在所售商品中的。</p>
						</dd>
					</dl>
					<dl class="q-tit-item">
						<dt class="qti-title">
							<i class="qti-question"></i>
							<p class="qti-txt">尺码表上的尺码标准吗？</p>
						</dt>
						<dd class="qti-content">
							<i class="qti-answer"></i>
							<p class="qti-txt">星期八所售商品尺寸均为人工测量，可能会存在1-2cm的正常误差范围。</p>
						</dd>
					</dl>
					<dl class="q-tit-item">
						<dt class="qti-title">
							<i class="qti-question"></i>
							<p class="qti-txt">图片颜色和实物颜色是否相同？</p>
						</dt>
						<dd class="qti-content">
							<i class="qti-answer"></i>
							<p class="qti-txt">星期八所有商品均采用专业拍摄，力求将最真实的信息传达至你的视线。但由于个人显示器不同，可能导致实物与图片存在色差，最终颜色以实物为准。</p>
						</dd>
					</dl>

					<dl class="q-tit-item">
						<dt class="qti-title">
							<i class="qti-question"></i>
							<p class="qti-txt">为什么我收到的商品包装和图片显示的不一致？</p>
						</dt>
						<dd class="qti-content">
							<i class="qti-answer"></i>
							<p class="qti-txt">由于部分商品生产批次不一，你收到货品的包装有可能与网站上图片不完全一致，商品包装请以实物为准。</p>
						</dd>
					</dl>
				</div>
			</div>
		</div>
	</section>
	<footer>
		<div class="foot_1">
			<dl>
				<dt>
					<img src="img/A1.png" /><span>消费者保障</span>
				</dt>
				<dd>保障范围 退货退款流程</dd>
				<dd>服务中心 更多特色服务</dd>
			</dl>
			<dl>
				<dt>
					<img src="img/A2.png" /><span>新手指导</span>
				</dt>
				<dd>新手专区 消费警示 交易安全</dd>
				<dd>24小时在线帮助 免费开店</dd>
			</dl>
			<dl>
				<dt>
					<img src="img/A3.png" /><span>支付方式</span>
				</dt>
				<dd>快捷支付 信用卡</dd>
				<dd>货到付款</dd>
			</dl>
		</div>
		<div class="foot-nav">
			<div class="foot_2">
				<ul>
					<li><a href="#">关于我们</a></li>
					<li><a href="#">联系客服</a></li>
					<li><a href="#">合作伙伴</a></li>
					<li><a href="#">法律声明及隐私权政策</a></li>
					<li><a href="#">关于我们</a></li>
				</ul>
				<br />
				<p>© 2018 MyDay.com 版权所有</p>
			</div>
		</div>
	</footer>
</body>
</html>