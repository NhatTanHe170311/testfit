<%-- 
    Document   : orderInfo
    Created on : Mar 17, 2024, 1:41:21 PM
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
                    <th scope="col">Mã khách hàng</th>
                    <th scope="col">Tên sản phẩm</th>
                    <th scope="col">số lượng</th>
                    <th scope="col">Tổng tiền</th>
                    <th scope="col">Ngày đặt hàng</th>
                    <th scope="col">trạng thái</th>
                    <th scope="col"></th>
                </tr>
            </thead>
            <tbody>
                <c:set var="t" value="0"/>
                <c:forEach items="${list}" var="i">
                    <c:set var="t" value="${t+1}"/>  
                    <tr>
                        <td>${t}</td>
                        <td>${i.userID}</td>
                        <td>${i.productName}</td>
                        <td>${i.quantity}</td>                     
                        <td>${i.total}</td>
                        <td>${i.date}</td>
                        <c:if test="${i.status == 0}">
                            <td>Đang chờ sử lí</td>
                        </c:if>
                        <c:if test="${i.status != 0}"> 
                        <td>Đã được chấp nhận</td>
                        </c:if>
                        <td><form action="updateOrder" method="POST">
                                <input type ="submit" value="Duyệt"/>
                                <input type="hidden"  value="${i.oredrID}" name="orderID"/>
                            </form></td>
                    </tr>
                </c:forEach>
            </tbody>
            <a href="homePage">Home
                <hr/>     
                </body>
<style>
    .table {
        width: 100%;
        text-align: center;
        border-collapse: collapse; /* Loại bỏ khoảng cách giữa các ô */
    }

    .table th,
    .table td {
        padding: 10px;
        border: 1px solid #ddd; /* Đường viền cho ô */
    }

    .table th {
        background-color: #f2f2f2; /* Màu nền cho tiêu đề */
    }

    .table tr:hover {
        background-color: #f5f5f5; /* Hiệu ứng hover */
    }
</style>
                </html>
