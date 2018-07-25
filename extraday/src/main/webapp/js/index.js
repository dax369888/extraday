$(function(){
	
	   
   $(".asset-item").bind({
    	mouseover:function(){
    		$(".sidebar-asset").find(".sidebar-hover1").show();
    	},
    	mouseout:function(){
    		$(".sidebar-asset").find(".sidebar-hover1").hide();
    	}
    });	
  
    $(".fav-item").bind({
    	mouseover:function(){
    		$(".sidebar-fav").find(".sidebar-hover2").show(200);
    	},
    	mouseout:function(){
    		$(".sidebar-fav").find(".sidebar-hover2").hide();
    	}
    });
    $(".foot-item").bind({
    	mouseover:function(){
    		$(".sidebar-foot").find(".sidebar-hover3").show(200);
    	},
    	mouseout:function(){
    		$(".sidebar-foot").find(".sidebar-hover3").hide();
    	}
    });
 			
})

//*********************************图片轮播
		//要用的图片
				var imgs = new Array("Background2.jpg","Background1.jpg","Background3.jpg");
				//数组下标
				var index = 0;
				//定时器				
				$(function(){
					autoPlay()
				})
				function autoPlay() {
					timer = setInterval(function() {
						//更改图片的src属性
						$(".focus-banner-con img").attr("src", "img/index/"+imgs[index]);
						$(".fbc-trigger  ul li").removeClass("active");
		    			$(".fbc-trigger  ul li:nth-of-type("+(index+1)+")").addClass("active"); 				
						index++;
						if(index > imgs.length - 1) {
							index = 0;
						}
					}, 1000);
				}
				$(function(){						
						$(".fbc-trigger ul li").click(function(){
		    				index = $(".fbc-trigger ul li").index(this);
		    				$(".focus-banner-con img").attr("src","img/index/"+imgs[index]);
		    				$(".fbc-trigger  ul li").removeClass("active");
		    				$(".fbc-trigger  ul li:nth-of-type("+(index+1)+")").addClass("active");  
		    			});
		    			$(".fbc-list-item,.fbc-trigger-con li").mouseover(function(){
	  						clearInterval(timer);
	  						$(".arrowLeft,.arrowRight").show();
	  					}).mouseout(function(){
	  						autoPlay()
	  					});
					})	
				
				var myScrollTop=document.body || document.documentElement; 
	 			window.onscroll=function(){	
				if(myScrollTop.scrollTop > 190){//获取垂直滚动的距离，即滚动了多少
					$(".main-nav").slideDown(1000);
					$(".main-nav").addClass("box_div222");
					$(".main-nav").slideDown(1000);
				}else{
					$(".main-nav").removeClass("box_div222");
				}
				
				if(myScrollTop.scrollTop > 190){
					$(".left-bar").slideDown();
				}else{
					$(".left-bar").hide();
				}
				
			}