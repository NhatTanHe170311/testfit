
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
        <link rel="stylesheet" href="style_1.css">
    </head>
    <body>
        <nav class="navbar navbar-expand-md navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" href="home">NHẬT TÂN BOOKSTORE</a>
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
                        </c:if >
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
                            <input name="txt" type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm" placeholder="Search...">
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
                    <div class="container">
                        <div class="card">
                            <div class="row">
                                <aside class="col-sm-5 border-right">
                                    <article class="gallery-wrap"> 
                                        <div class="img-big-wrap">
                                            <div> <a href="#"><img src="${product.img}"></a></div>
                                        </div> <!-- slider-product.// -->
                                    </article> <!-- gallery-wrap .end// -->
                                </aside>
                                <aside class="col-sm-7">
                                    <article class="card-body p-5">
                                        <h3 class="title mb-3">${product.productName}</h3>

                                        <p class="price-detail-wrap"> 
                                            <span class="price h3 text-warning"> 
                                                <span class="currency">GIÁ </span><span class="num">${product.price} VND</span>
                                            </span> 
                                            <!--<span>/per kg</span>--> 
                                        </p> <!-- price-detail-wrap .// -->
                                        <dl class="item-property">
                                            <dt>Description</dt>
                                            <dd><p>${product.describe} </p></dd>
                                        </dl>

                                    </article> <!-- card-body.// -->
                                </aside> <!-- col.// -->
                            </div> <!-- row.// -->
                        </div> <!-- card.// -->


                    </div>
                </div>
            </div>
        </div>
                                        
        <!-- Footer -->
        <footer class="text-light">
            <div class="footer"> 
                <p>Email : tannguyennhat916@gmail.com</p>
                <p>Địa chỉ: Cẩm Yên, Thạch Thất, tp Hà Nội</p>
                <h1>Điện thoại: 0335625766</h1>
            </div>
        </footer>
    </body>
</html>


