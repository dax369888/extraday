<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>搜索页面</title>
		<link rel="stylesheet" href="css/search.css" />
		
	
<%request.setCharacterEncoding("UTF-8");
  response.setCharacterEncoding("UTF-8");
%>	

<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	var map=new Map();
	var mapShow=new Map();
	
	$(function(){
		initDataBy(1)
	})

	function initDataBy(index){
		var cid="${param.cid}";
		var searchStr="${param.searchStr}";
		var index=index;
		$.ajax({
			type:"post",
			data:{
				search:searchStr,
				index:index,
				cid:cid,
			},
			dataType:"json",
			url:"/extraday/goods/searchByStr.do",
			success:function(data){
				var pageSide=$(".page")
				$(".page").html("")
				
				
				
				if(data["pageUtil"]["totalCount"]==0){
					
					$(".goods").html("<h1>您好，查不到您想要的商品</h1>");
				}
				
				
				if(data["pageUtil"]["totalCount"]!=0){	
					
					var page="";
					if(data["pageUtil"]["index"]!=1){
						var pageHead="<a href='javascript:void(0)' onclick='initDataBy(1)'>首页</a>";
						var pageUp="<a href='javascript:void(0)' onclick='initDataBy("+(index-1)+")'>上一页</a>";
					page+=pageHead;
					page+=pageUp;
					}
				
					for(var i=data["pageUtil"]["start"];i<=data["pageUtil"]["end"];i++){
						var aPage="<a href='javascript:void(0)' onclick='initDataBy("+i+")'>"+i+"</a>"	
						page+=aPage;	
					}	
					
					if(data["pageUtil"]["index"]!=data["pageUtil"]["totalPage"]){
						var pageDown="<a href='javascript:void(0)' onclick='initDataBy("+(index+1)+")'>下一页</a>";
						var pageTail="<a href='javascript:void(0)' onclick='initDataBy("+data["totalPage"]+")'>末页</a>";
					page+=pageDown;
					page+=pageTail;
					}		
					$(pageSide).append(page);

					}	
				
					$(".goods a:eq(0)").nextAll().remove();	
				
					$.each(data["pageUtil"]["list"],function(i,v){
						if(i==0){
						var cateId=$("input[type=hidden]");
						$(cateId).val(v["f_category_id"]);						
						}
						
						if(i>=1){
							
							var newData=$(".goods a:eq(0)").clone(true);
				 			/* $(".show111 .middle-column-con").append(newData); */
				 			newData.insertAfter($(".goods a")[i-1])
						}
						
						
						var jump=$(".goods a")[i]			
						$(jump).attr('href',"/extraday/goodsDetail.jsp?spu_id="+v["f_id"])
						var photo=$(".floor-item-img")[i]							
						$(photo).attr('src',v["f_main_img_url"]);
						var title=$(".floor-item-title")[i]
						$(title).html("");
						$(title).append(v["f_good_detail"]);
						
						
						
					})
				
				
					$(".row:eq(0)").nextAll().remove;
					var attrNo=0;
					$.each(data["attrList"],function(i,v){
					
						if(attrNo>=1){
							
							var newData=$(".row:eq(0)").clone(true);
				 			/* $(".show111 .middle-column-con").append(newData); */
				 			newData.insertAfter($(".row")[attrNo-1])
				 			
						}
						var attrName=$(".rowHead")[attrNo];
						$(attrName).find("h4").html("")
						$(attrName).find("h4").append(i);
						var attrValue=$(".rowBody")[attrNo];
						$(attrValue).html("")
						
						$.each(v,function(m,n){
							
							var ah="<a href='javascript:void(0)' onclick='postValue("+n["f_attr_id"]+","+n["f_value_id"]+",\""+n["f_attr_name"]+"\",\""+n["f_value_name"]+"\")'>"+n["f_value_name"]+"</a>"
							
							$(attrValue).append(ah);
						})
						
						
						
						
						attrNo++;	
						
						
					})
				
				
				
				
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
	        var s = "";     
	        for(var i=0;i<this.keys.length;i++,s+=','){     
	            var k = this.keys[i];     
	            s += k+":"+this.data[k];     
	        }     
   
	        return s;     
	    };     
	}
	
	
	function postValue(attrId,valueId,attrName,valueName){
		map.put(attrId,valueId);
		mapShow.put(attrName,valueName);
		
		//前台显示Mapshow
		var show=$(".nav-classify");
		$(show).find("span:eq(0)").nextAll().remove();
		
		for(var k=0;k<mapShow.size();k++){
			var kname="";
				kname+= mapShow.keys[k]+":"+mapShow.get(mapShow.keys[k]);			
			$(show).append("<span>"+kname+"</span>")
		}
		
		postV(1)
		
	}
	function postV(index){

	var cateId=$("input[type=hidden]");		
	var str=$("input[type=search]");
	var valueID=new Array();
	for(var j=0;j<map.size();j++){
		valueID[j]=map.get(map.keys[j]);
	}
	
	$.ajax({
		data:{
			cid:cateId.val(),
			str:str.val(),
			valueID:valueID,
			index:index
		},	
		type:"post",
		dataType:"json",
		traditional:true,
		url:"/extraday/goods/getSpuCom.do",
		success:function(data){
			
			
			
			
			
			
			var pageSide=$(".page")
			$(".page").html("")
			
			
			
			if(data["pageUtil"]["totalCount"]==0){
				
				$(".goods").html("<h1>您好，查不到您想要的商品</h1>");
			}
			
			
			if(data["pageUtil"]["totalCount"]!=0){	
				
				var page="";
				if(data["pageUtil"]["index"]!=1){
					var pageHead="<a href='javascript:void(0)' onclick='initDataBy(1)'>首页</a>";
					var pageUp="<a href='javascript:void(0)' onclick='initDataBy("+(index-1)+")'>上一页</a>";
				page+=pageHead;
				page+=pageUp;
				}
			
				for(var i=data["pageUtil"]["start"];i<=data["pageUtil"]["end"];i++){
					var aPage="<a href='javascript:void(0)' onclick='initDataBy("+i+")'>"+i+"</a>"	
					page+=aPage;	
				}	
				
				if(data["pageUtil"]["index"]!=data["pageUtil"]["totalPage"]){
					var pageDown="<a href='javascript:void(0)' onclick='initDataBy("+(index+1)+")'>下一页</a>";
					var pageTail="<a href='javascript:void(0)' onclick='initDataBy("+data["totalPage"]+")'>末页</a>";
				page+=pageDown;
				page+=pageTail;
				}		
				$(pageSide).append(page);

				}	
			
				$(".goods a:eq(0)").nextAll().remove();	
			
				$.each(data["pageUtil"]["list"],function(i,v){
					if(i==0){
					var cateId=$("input[type=hidden]");
					$(cateId).val(v["f_category_id"]);						
					}
					
					if(i>=1){
						
						var newData=$(".goods a:eq(0)").clone(true);
			 			/* $(".show111 .middle-column-con").append(newData); */
			 			newData.insertAfter($(".goods a")[i-1])
					}
					
					
					var jump=$(".goods a")[i]			
					$(jump).attr('href',"/extraday/goodsDetail.jsp?spu_id="+v["f_id"])
					var photo=$(".floor-item-img")[i]							
					$(photo).attr('src',v["f_main_img_url"]);
					var title=$(".floor-item-title")[i]
					$(title).html("");
					$(title).append(v["f_good_detail"]);
					
				})
			
			
				var test=$(".row:eq(0)").nextAll().remove();
			
				var attrNo=0;
				$.each(data["attrList"],function(i,v){
				
					if(attrNo>=1){
						
						var newData=$(".row:eq(0)").clone(true);
			 			/* $(".show111 .middle-column-con").append(newData); */
			 			newData.insertAfter($(".row")[attrNo-1])
			 			
					}
					var attrName=$(".rowHead")[attrNo];
					$(attrName).find("h4").html("")
					$(attrName).find("h4").append(i);
					var attrValue=$(".rowBody")[attrNo];
					$(attrValue).html("")
					
					$.each(v,function(m,n){
						
						var ah="<a href='javascript:void(0)' onclick='postValue("+n["f_attr_id"]+","+n["f_value_id"]+",\""+n["f_attr_name"]+"\",\""+n["f_value_name"]+"\")'>"+n["f_value_name"]+"</a>"
						
						$(attrValue).append(ah);
					})
					
					
					
					
					attrNo++;	
					
					
				})
			
			
			
			
			
			
			
		}
	})
	
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
									<li><span class="h_1"><a href="center.jsp?action=0">${user.f_user_mobile}</a></span>
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
						<p><a href="index.jsp"><span>星期八</span>Extra day</a></p>
						</div>
					<div class="search">
						<form action="search.jsp" method="post">
							<span>宝贝</span>
							<input type="search" placeholder="纯牛奶" value="${param.searchStr}" name="searchStr" required="required"/>
							<input type="submit" value="搜索" />
						</form>				
					</div>
				</div>
			</div>
		</header>
		
		<section>
			<div class="main">
				<div class="main-total">
					<div class="main-nav">
						<div class="nav-classify">
							<span class="classify-text">所有分类</span>
							<!-- <a class="classify-show">显示筛选</a>	 -->					
						</div>
						<div class="nav-detail">
							<div class="group">
								<div  class="row">
									<div class="rowHead">
										<h4>
											<!-- <span class="head-title">选购热点：</span> -->
										</h4>										
									</div>
									<div class="rowBody">									
									
										<!-- <a href="#">气质淑女</a>
										<a href="#">复古风</a>
										<a href="#">甜美</a>
										<a href="#">小露香肩</a>
										<a href="#">可爱</a>
										<a href="#">田园小清新</a>
										<a href="#">复古风</a>
										<a href="#">甜美</a>
										<a href="#">小露香肩</a> -->
									</div> 									
								</div>
								
							</div>
						</div>
						<div class="goods">
							<a class="goods-show" href="#">
								<div class="goods-content">
									<img class="floor-item-img" src="img/index/girls2.jpg" />
									<div class="floor-item-title">夏装甜美休闲百搭显瘦V领条纹短袖</div>
									<!-- <div class="floor-price">￥69</div> -->
								</div>
							</a>
								
							
						
						</div>
						
						<div class="page">
							
						
						</div>
					</div>
					
						
				</div>
				
			</div>
			<div>
				
			</div>
		</section>
		<footer>
		<input type="hidden" value=${param.cid}>
		</footer>
	</body>
</html>
