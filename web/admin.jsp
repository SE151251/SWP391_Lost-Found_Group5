<%-- 
    Document   : admin
    Created on : Jun 19, 2022, 9:42:10 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>List Report not confirm</h1>
        <table>
            <thead>
                <tr>
            <td>Người báo cáo</td>
            <td>ID bài post bị tố cáo</td>
            <td>Người bị tố cáo</td>
            <td>Nội dung tố cáo</td>
            <td>Thời gian tố cáo</td>
            <td>Xem chi tiết</td>
            </tr>
            </thead>
            <tbody>
                <c:forEach var="dt" items="${listReportsNotConfirm}" >
                <tr>
                    <td>${dt.member.memberName}</td>
                    <td>${dt.article.articleID}</td>
                    <td>${dt.article.member.memberName}</td>
                    <td>${dt.reportContent}</td>
                    <td>${dt.reportTime}</td>
                    <td><a href="ViewDetailServlet?aId=${dt.article.articleID}&memReportID=${dt.member.memberID}">View more >></a></td>
                </tr>
                </c:forEach>
            </tbody>
        </table>
        <br/>
        <h1>List Report confirmed</h1>
        <table>
            <thead>
            <td>Người báo cáo</td>
            <td>ID bài post bị tố cáo</td>
            <td>Người bị tố cáo</td>
            <td>Nội dung tố cáo</td>
            <td>Thời gian tố cáo</td>
            <td>Thời gian xử lý</td>
            <td>Xem chi tiết</td>
            </thead>
            <tbody>
                <c:forEach var="dt" items="${listReportsConfirmed}" >
                <tr>
                    <td>${dt.member.memberName}</td>
                    <td>${dt.article.articleID}</td>
                    <td>${dt.article.member.memberName}</td>
                    <td>${dt.reportContent}</td>
                    <td>${dt.reportTime}</td>
                    <td>${dt.confirmTime}</td>
                    <td><a href="ViewDetailServlet?aId=${dt.article.articleID}">View more >></a></td>
                </tr>
                </c:forEach>
            </tbody>
        </table>
    </body>
</html>
--%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- Bootstrap CSS -->
    <script src="https://kit.fontawesome.com/f2fda88f12.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="node_modules/bootstrap/dist/css/bootstrap.min.css" />
    <link rel="stylesheet" href="node_modules/bootstrap-social/bootstrap-social.css" />
    <link rel="stylesheet" href="css/styleAdmin.css" />
    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>

<body>
    <header>
        <nav class="navbar navbar-dark fixed-top">
            <div class="navbar">
                <button class="rounded-circle" type="button" data-toggle="collapse" data-target="#Navbar">
                    <img class="rounded-circle" src="${userdata.picture}" height="30" width="100%">
                </button>
                <span class="Nav-username" style="width: 300px;"><c:out value="${userdata.memberName}"/></span>
            </div>
            <form>
            <div class="search col-md-11">
               
                <div class="search-field">
                    <div class="search-icon"></div>
                    <input type="text" name="keySearch" class="search-input" placeholder="Từ khóa">
                </div>
        <button formaction="SearchServlet" class="search-button">Tìm</button>
         
            </div>
            </form>
                
                

        </nav>
        <div class="collapse navbar-collapse" id="Navbar">
            <ul class="navbar-nav container ml-5">
                <li class="nav-item">
                    <a class="nav-link" href="AdminListServlet"><i class="fa fa-home fa-lg"></i>Home </a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="LogoutServlet"><i class="fa-solid fa-arrow-right-from-bracket"></i> Logout</a>
                </li>
            </ul>
        </div>

    </header>

    <div class="tabs">
        <div class="tab-item active">
            Report xử lý
        </div>
        <div class="tab-item">
            Report chưa xử lý
        </div>
        <div class="tab-item">
            Thông báo
        </div>
        <div class="line"></div>
    </div>
    <!-- tab content -->
    <div class="tab-content">
        <a type="button" href="CreateFormServlet" class="center createPost--btn btn rounded-circle">+</a>
        <div class="tab-pane active">
         <table width="1300" border="2" cellspacing="0" cellpadding="0">
            <thead>
                <tr>
            <td>Người báo cáo</td>
            <td>ID bài post bị tố cáo</td>
            <td>Người bị tố cáo</td>
            <td>Nội dung tố cáo</td>
            <td>Thời gian tố cáo</td>
            <td>Xem chi tiết</td>
            </tr>
            </thead>
            <tbody>
                <c:forEach var="dt" items="${listReportsNotConfirm}" >
                <tr>
                    <td>${dt.member.memberName}</td>
                    <td>${dt.article.articleID}</td>
                    <td>${dt.article.member.memberName}</td>
                    <td>${dt.reportContent}</td>
                    <td>${dt.reportTime}</td>
                    <td><a href="ViewDetailServlet?aId=${dt.article.articleID}&memReportID=${dt.member.memberID}">View more >></a></td>
                </tr>
                </c:forEach>
            </tbody>
        </table>
         </div>
         <div class="tab-pane">
            <table width="1300" border="2" cellspacing="0" cellpadding="0">
            <thead>
            <td>Người báo cáo</td>
            <td>ID bài post bị tố cáo</td>
            <td>Người bị tố cáo</td>
            <td>Nội dung tố cáo</td>
            <td>Thời gian tố cáo</td>
            <td>Thời gian xử lý</td>
            <td>Xem chi tiết</td>
            </thead>
            <tbody>
                <c:forEach var="dt" items="${listReportsConfirmed}" >
                <tr>
                    <td>${dt.member.memberName}</td>
                    <td>${dt.article.articleID}</td>
                    <td>${dt.article.member.memberName}</td>
                    <td>${dt.reportContent}</td>
                    <td>${dt.reportTime}</td>
                    <td>${dt.confirmTime}</td>
                    <td><a href="ViewDetailServlet?aId=${dt.article.articleID}">View more >></a></td>
                </tr>
                </c:forEach>
            </tbody>
        </table>
            </div>
         <div class="row tab-pane active">
            <c:forEach var="dt" items="${articlesNotice}" >
            <div class="pane col-md-2">
                <div class="pane-img">
                    <c:if test="${not empty dt.imgUrl}">
                        <img src="images/${dt.imgUrl}" alt=""> </c:if>
                        <c:if test="${empty dt.imgUrl}">
                        <img src="images/Logo_LostFound.png" alt=""> </c:if>
                </div>
                <div class="pane-content">
                    <p style="font-size: 12px">Thời gian: <c:out value="${dt.postTime}"/></p>                 
                    <p style="font-size: 15px; font-weight: bold"><c:out value="${dt.title}"/></p>                                
                        <a href="ViewDetailServlet?aId=${dt.articleID}">View more >></a>                   
                    

                </div>
            </div>
            </c:forEach>
        </div>  
    </div>
        
    <!-- Footer -->
    <footer class=" text-center text-lg-start bg-light text-muted">
        <!-- Section: Social media -->
        <section class="text-white d-flex justify-content-center justify-content-lg-between p-4 border-bottom">
            <!-- Left -->
            <div class="me-5 d-none d-lg-block">
                <span>Get connected with us on social networks:</span>
            </div>
            <!-- Left -->

            <!-- Right -->
            <div>
                <a href="" class="me-4 text-reset">
                    <i class="fab fa-facebook-f text-white"></i>
                </a>
                <a href="" class="me-4 text-reset">
                    <i class="fab fa-twitter text-white"></i>
                </a>
                <a href="" class="me-4 text-reset">
                    <i class="fab fa-google text-white"></i>
                </a>
                <a href="" class="me-4 text-reset">
                    <i class="fab fa-instagram text-white"></i>
                </a>
                <a href="" class="me-4 text-reset">
                    <i class="fab fa-github text-white"></i>
                </a>
            </div>
            <!-- Right -->
        </section>
        <!-- Section: Social media -->

        <!-- Section: Links  -->
        <section class="text-white">
            <div class="container text-center text-md-start mt-5">
                <!-- Grid row -->
                <div class="row mt-3">
                    <!-- Grid column -->
                    <div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
                        <!-- Content -->
                        <h6 class="text-uppercase fw-bold mb-4">
                            <i class="fas fa-gem me-3 mr-1"></i>FPTU Lost&Found
                        </h6>
                        <p>
                            Here you can use rows and columns to organize your footer content. Lorem ipsum
                            dolor sit amet, consectetur adipisicing elit.
                        </p>
                    </div>
                    <!-- Grid column -->

                    <!-- Grid column -->
                    <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
                        <!-- Links -->
                        <h6 class="text-uppercase fw-bold mb-4">
                            Products
                        </h6>
                        <p>
                            <a href="#!" class="text-white">Angular</a>
                        </p>
                        <p>
                            <a href="#!" class="text-white">React</a>
                        </p>
                        <p>
                            <a href="#!" class="text-white">Vue</a>
                        </p>
                        <p>
                            <a href="#!" class="text-white">Laravel</a>
                        </p>
                    </div>
                    <!-- Grid column -->

                    <!-- Grid column -->
                    <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">
                        <!-- Links -->
                        <h6 class="text-uppercase fw-bold mb-4">
                            Useful links
                        </h6>
                        <p>
                            <a href="#!" class="text-white">Pricing</a>
                        </p>
                        <p>
                            <a href="#!" class="text-white">Settings</a>
                        </p>
                        <p>
                            <a href="#!" class="text-white">Orders</a>
                        </p>
                        <p>
                            <a href="#!" class="text-white">Help</a>
                        </p>
                    </div>
                    <!-- Grid column -->

                    <!-- Grid column -->
                    <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
                        <!-- Links -->
                        <h6 class="text-uppercase fw-bold mb-4">
                            Contact
                        </h6>
                        <p><i class="fas fa-home me-3"></i> New York, NY 10012, US</p>
                        <p>
                            <i class="fas fa-envelope me-3"></i>
                            info@example.com
                        </p>
                        <p><i class="fas fa-phone me-3"></i> + 01 234 567 88</p>
                        <p><i class="fas fa-print me-3"></i> + 01 234 567 89</p>
                    </div>
                    <!-- Grid column -->
                </div>
                <!-- Grid row -->
            </div>
        </section>
        <!-- Section: Links  -->

        <!-- Copyright -->
        <div class="text-center text-white p-4">
            © 2022 Copyright:
            <a class="text-reset text-white fw-bold" href="https://mdbootstrap.com/">Group 5</a>
        </div>
        <!-- Copyright -->
    </footer>
    <!-- Footer -->
    <!-- modal -->
    <!-- <div id="postModal" class="modal fade" role="dialog">
        <div class="modal-dialog modal-lg" role="content">
           
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="font-strong text-white">Create post</h3>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    <div id="postform" class=" col-sm-6 col-md-12 align-self-center">
                        <div class="">
                            <div class="card-body">
                                <dl class="">
                                    <div class="modal-post--user">
                                        <button class="rounded-circle" type="button" data-toggle="collapse"
                                            data-target="#Navbar">
                                            <img class="rounded-circle" src="img/logo.jpg" height="30" width="100%">
                                        </button>
                                        <span>User name</span>
                                    </div>
                                    <div class="modal-post--input">
                                        <input type="text" class="form-control form-control-lg form-control-plaintext">
                                        <input type="file" class="form-control-file border">
                                    </div>
                                </dl>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div> -->
    <!-- drop down filteer -->

    <!-- jQuery first, then Popper.js, then Bootstrap JS. -->
    <script src="js/mycode.js"></script>
    <script src="node_modules/jquery/dist/jquery.slim.min.js"></script>
    <script src="node_modules/popper.js/dist/umd/popper.min.js"></script>
    <script src="node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
</body>

</html>
