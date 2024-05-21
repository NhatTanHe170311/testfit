<%-- 
    Document   : myCarst
    Created on : Mar 15, 2024, 9:05:35 PM
    Author     : tanng
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">STT</th>
                    <th scope="col">Tên sản phẩm</th>
                    <th scope="col">số lượng</th>
                    <th scope="col">giá</th>
                    <th scope="col">thành tiền</th>
                    <th scope="col"></th>
                </tr>
            </thead>
            <tbody>
                <c:set var="o" value="${sessionScope.cart}"/>
                <c:set var="t" value="0"/>
                <c:forEach items="${o.items}" var="i">
                    <c:set var="t" value="${t+1}"/>  
                    <tr>
                        <td>${t}</td>
                        <td>${i.product.productName}</td>
                        <td>
                            <form action="updatequa" method="post">                                
                                <input type="number" name="quantity" value="${i.quantity}">
                                <input type="hidden" name="id" value="${i.product.productID}"/>
                                <input type="submit" value="cập nhật"/>
                            </form>

                        </td>
                        <td>${i.price}</td>
                        <td>${i.quantity*i.price}</td>
                        <td>
                            <form action="remove" method="get">
                                <input type="hidden" name="id" value="${i.product.productID}"/>
                                <input type="submit" value="xóa"/>

                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
          
            
            <form action="checkout" method="get">
                <input type="submit" value="Thanh toán"/>
            </form>
              
              
              <a href="homePage">Tiếp tục mua hàng
            <hr/>     
    </body>
    <style>
        .table {
            width: 100%;
            text-align: center;
        }

        .table th,
        .table td {
            padding: 10px;
        }
    </style>
</html>
