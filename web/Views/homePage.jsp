<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!------ Include the above in your HEAD tag ---------->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <!--begin of menu-->
        <nav class="navbar navbar-expand-md navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" href="homePage">NHẬT TÂN BOOKSTORE</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse justify-content-end" id="navbarsExampleDefault">
                    <ul class="navbar-nav m-auto">
                        <c:if test="${sessionScope.acc != null}">
                            <li class="nav-item">
                                <a class="nav-link" href="#">Chào ${sessionScope.user.userName}</a>
                            </li>
                        </c:if>
                        <c:if test="${sessionScope.acc != null}">
                            <li class="nav-item">
                                <a class="nav-link" href="orderinfo">Thông Tin</a>
                            </li>
                        </c:if>
                        <c:if test="${(sessionScope.acc != null) && (sessionScope.acc.isAdmin==1)}">
                            <li class="nav-item">
                                <a class="nav-link" href="manage">Quản Lí</a>
                            </li>
                        </c:if>
                        <c:if test="${(sessionScope.acc != null) && (sessionScope.acc.isAdmin==1)}">
                            <li class="nav-item">
                                <a class="nav-link" href="listorderinfo">Đơn hàng</a>
                            </li>
                        </c:if>

                        <c:if test="${sessionScope.acc != null}">
                            <li class="nav-item">
                                <a class="nav-link" href="cart">Giỏ Hàng</a>
                            </li>
                        </c:if>

                        <c:if test="${sessionScope.acc != null}">
                            <li class="nav-item">
                                <a class="nav-link" href="logout">Đăng Xuất</a>
                            </li>
                        </c:if>
                        <c:if test="${sessionScope.acc == null}">
                            <li class="nav-item">
                                <a class="nav-link" href='login'>Đăng Nhập</a>
                            </li>
                        </c:if>
                    </ul>

                    <form action="search" method="post" class="form-inline my-2 my-lg-0">
                        <div class="input-group input-group-sm">
                            <input name="searchName" type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm" placeholder="Tìm Kiếm">
                            <div class="input-group-append">
                                <button type="submit" class="btn btn-secondary btn-number">
                                    <i class="fa fa-search"></i>
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </nav>
        <section class="jumbotron text-center">
            <div class="container">
                <h1 class="jumbotron-heading">CỬA HÀNG BÁN SÁCH CHẤT LƯỢNG CAO</h1>
                <p class="lead text-muted mb-0">Uy tín - Tọa niềm tin</p>
            </div>
        </section>
        <!--end of menu-->
        <div class="container">
            <div class="row">
                <div class="col">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="homePage">Home</a></li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
        <form name="f" action="" method="">        
            <div class="container">
                <div class="row">
                    <div class="col-sm-3">
                        <div class="card bg-light mb-3">
                            <div class="card-header bg-primary text-white text-uppercase"><i class="fa fa-list"></i> THỂ LOẠI</div>
                            <ul class="list-group category_block">
                                <c:forEach items="${cate}" var="c">
                                    <li class="list-group-item text-white"><a href="category?cateID=${c.categoryID}">${c.categoryName}</a></li>
                                    </c:forEach>

                            </ul>
                        </div>
                    </div>

                    <div class="col-sm-9">
                        <div class="row">

                            <c:forEach items="${pro}" var="p">

                                <div class="col-12 col-md-6 col-lg-4 ">
                                    <div class="card product">
                                        <img class="card-img-top img" src="${p.img}" alt="Card image cap">
                                        <div class="card-body">
                                            <h4 class="card-title show_txt"><a href="productDetail?pID=${p.productID}" title="View Product">${p.productName}</a></h4>
                                            <p class="card-text show_txt">${p.describe}</p>
                                            <div class="row">
                                                <div class="col">
                                                    <p class="btn btn-danger btn-block">${p.price} VND</p>
                                                </div>
                                                <c:if test="${p.status==true}">
                                                    <c:if test="${sessionScope.acc == null}">
                                                        <div class="col">
                                                            <a type="submit" href="login" class="btn btn-success btn-block">THÊM VÀO GIỎ</a>
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${sessionScope.acc != null}">
                                                        <div class="col">
                                                            <a type="submit" href="buy?id=${p.productID}" class="btn btn-success btn-block">THÊM VÀO GIỎ</a>
                                                        </div>
                                                    </c:if>
                                                </c:if>
                                                <c:if test="${p.status==false}">
                                                    <div class="col">
                                                        <a style="background-color: #cccccc" class="btn btn-success btn-block">THÊM VÀO GIỎ</a>
                                                    </div>
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </c:forEach>
                        </div>
                    </div>
                    </form>  
                </div>
            </div>

            <!-- Footer -->
            <footer class="text-light">
                <div class="footer"> 

                    <p>Email : tannguyennhat916@gmail.com</p>
                    <p>Địa chỉ: Cẩm Yên, Thạch Thất, tp Hà Nội</p>
                    <h5>Điện thoại: 0335625766</h5>
                </div>
            </footer>
    </body>
</html>

<script type="text/javascript">
    function buy(id) {
        document.f.action = "buy?id=" + id;
        document.f.submit();
    }
</script> 
