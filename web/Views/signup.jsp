<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!------ Include the above in your HEAD tag ---------->

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link rel="stylesheet" href="/style_2.css">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

        <title>Bootstrap 4 Login/Register Form</title>
    </head>
    <body>
        <div class="container-fluid">
            <div class="container">
                <h2 class="text-center" id="title">Đăng kí ngay để mua các sản phẩm từ chúng mình nhé</h2>
                <hr>
                <div class="row">
                    <div class="col-md-5">
                        <form role="form" method="post" action="signup">						
                                <div class="form-group">
                                    <input type="text" name="account" class="form-control input-lg" placeholder="Tài khoản">
                                </div>
                                <div class="form-group">
                                    <input type="text" name="password1" class="form-control input-lg" placeholder="Mật khẩu">
                                </div>
                                <div class="form-group">
                                    <input type="text" name="password2"class="form-control input-lg" placeholder="Nhập lại mật khẩu">
                                </div>
                                <p class="text-danger">${smg}</p>
                                <div>
                                    <input type="submit" class="btn btn-lg btn-primary" value="ĐĂNG KÍ">
                                </div>
                        </form>
                                 <br><!-- comment -->
                                <input type="submit" class="btn btn-lg btn-primary" onclick="location.href = 'userinfo'" value="ĐĂNG NHẬP">
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
