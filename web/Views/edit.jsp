

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <link rel="stylesheet" href="style_3.css">
        <style>
            img{
                width: 200px;
                height: 120px;
            }
        </style>
    <body>
        <div class="container">
                    <!-- Edit Modal HTML -->
        <div id="addEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    
                    
                    <form action="update" method="post">
                        <div class="modal-header">						
                            <h2 class="modal-title">Edit Product</h2>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>Mã sản phẩm</label>
                                <input  value="${product.productID}" name="id" type="text" class="form-control" readonly required>
                            </div>
                            <div class="form-group">
                                <label>Tên sản phẩm</label>
                                <input  value="${product.productName}" name="name" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Giá</label>
                                <input value="${product.price}" name="price" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Link ảnh</label>
                                <input value="${product.img}" name="img" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Mô tả</label>
                                <textarea  name="describe" class="form-control" required>${product.describe}</textarea>
                            </div>
                            <div class="form-group">
                                <label>Trạng thái</label>
                                <select name="status" class="form-select" aria-label="Default select example">
                                        <option value="1">còn hàng</option>
                                        <option value="0">hết hàng</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Thể loại</label>
                                <select name="category" class="form-select" aria-label="Default select example">
                                    <c:forEach items="${cate}" var="c">
                                        <option value="${c.categoryID}">${c.categoryName}</option>
                                    </c:forEach>
                                </select>
                            </div>

                        </div>
                        <div class="modal-footer">
                            <input type="submit" class="btn btn-success" value="Update">
                            <a href="manage">Home Manager</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        </div>

       
        <script src="js/manager.js" type="text/javascript"></script>
        <script>
               
        </script>
    </body>
</html>