<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>
<script>

	var oid=${param.out_trade_no};
	$(function(){
		
		paySuccess(oid)
		
	})
	function paySuccess(index){
		$.ajax({
			
			data:{
				oid:oid
			},
			type:"post",
			dataType:"json",
			url:"/extraday/order/paySuccess.do",
			success:function(data){
				window.location.href="center.jsp?action=1";	
			}
			
			
		})
		
		
		
	}


</script>

</head>
<body>



</body>
</html>