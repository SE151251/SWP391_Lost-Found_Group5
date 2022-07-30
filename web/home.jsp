<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LOST Page</title>
    <!-- Bootstrap CSS -->
    <script src="https://kit.fontawesome.com/f2fda88f12.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="css/style.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  <jsp:useBean id="a" class="fu.daos.ArticleDAO" scope="request"></jsp:useBean>
</head>

<body>
    <header>
        <nav class="navbar navbar-dark navbar-expand-md fixed-top">

            <ul style="width: 13%;" class="navbar-nav container ml-5">
                <li class="nav-item active">
                    <a class="nav-link" href="paging"><i class="fa fa-home mr-1"></i> Home </a>
                </li>
            <c:if test="${not empty userdata}">
                <div class="bell-image online"
                    style="display: inline-block; position: absolute; width: 3%; right: -5px;"
                    onclick="UserSettingToggle()">
                    <h3><i class="fa-solid fa-bell text-white bell-counter"></i></h3>
                    <span class="badge badge-danger badge-counter">${totalNotiNew}</span>
                </div>
                <div class="user-settings">
                    <div class="card-header card-center">
                        <div class="align-items-center row">
                            <div class="col">
                                <h6 class="mb-0">Notification</h6>
                            </div>
                        </div>
                    </div>
                    <div class="fw-normal fs--1 scrollbar list-group list-group-flush" style="max-height: 19rem;">
                    </div>
                <c:forEach var="noti" items="${listNoti}" >
                    <div class="list-group-item">
                        <a class="notification" style="text-decoration: none" 
                        <c:if test="${empty noti.article}">href="paging?notiID=${noti.notiId}"</c:if>
                        <c:if test="${not empty noti.article}">href="ViewDetailServlet?aId=${noti.article.articleID}&notiID=${noti.notiId}"</c:if>
                        >
                            <div class="notification-avatar" style="background-color: white;">
                                <div class="avatar avatar-2x1 me-3" style="position: relative; padding-right: 5px">
                                    <img class="rounded-circle" src="${noti.sender.picture}"
                                        style="width: 55px; height: 55px;">
                                </div>
                            </div>
                            <div class="notification-body" style="background-color: white;">
                                <p class="mb-1">
                                    <strong>${noti.sender.memberName}</strong>
                                    ${noti.content}
                                </p>
                                <span class="notification-time">
                                    <span class="me-2" role="img" aria-label="Emoji"></span>
                                    ${noti.notiTime}
                                </span>
                            </div>
                        </a>
                    </div>
                    </c:forEach>
                </div>
                </c:if>
            </ul>

            <div class="navbar">
                <c:if test="${empty userdata}">
                <a type="button" href="https://accounts.google.com/o/oauth2/auth?scope=email profile&redirect_uri=http://localhost:8080/SWP39_LostAndFound/login-google&response_type=code
    &client_id=287706363103-nelsjcm2sdr3ruldha94fink89tk87tg.apps.googleusercontent.com&approval_prompt=force" style="color: rgb(18, 190, 212);" class="btn btn-login">Login <i
                class="fa-solid fa-right-to-bracket"></i></a>
                </c:if>
                <c:if test="${not empty userdata}">
                <a class="rounded-circle p-0" type="button" data-toggle="collapse" data-target="#Navbar"> 
                    <img class="rounded-circle" src="${userdata.picture}" height="30" width="100%">
                </a>
                </c:if>
            </div>
        </nav>
            <c:if test="${not empty userdata}">
        <div class="collapse navbar-collapse" id="Navbar">
            <ul class="navbar-nav container ml-5">
                <li>
                    <span class="Nav-username">${userdata.memberName}</span>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="PersonalServlet?uId=${userdata.memberID}"><span class="fa-solid fa-user"></span> Personal
                        Page</a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="LogoutServlet"><i class="fa-solid fa-arrow-right-from-bracket"></i> Logout</a>
                </li>
            </ul>
        </div>
            </c:if>
    </header>

    <div class="search-form">
        <i class="fa-solid fa-magnifying-glass search-icon"></i>
        <form class="search col-md-4">
            <div class="search-field">
                <input type="text" name="keySearch" class="search-input p-1" placeholder="Input here">
                <input type="hidden" name="searchAction" value="Find"/>
            </div>

            <button formaction="SearchServlet" class="search-button p-1 pl-3 pr-3 ml-2">Search</button>
        </form>
    </div>
    <div id="header-carousel" class="carousel slide mt-3" data-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active" style="height: 410px;">
                <img class="img-fluid" src="images/Logo_LostFound.png" alt="Image">
                <div class="carousel-caption d-flex flex-column align-items-center justify-content-end">
                    <div class="p-3" style="max-width: 700px;">
                        <h4 class="text-uppercase font-weight-medium mb-3">FPTU Lost&Found</h4>
                        <h3 class="display-4 text-white font-weight-semi-bold mb-4">The easy way to find your items</h3>
                        <!-- <a href="" class="btn btn-light py-2 px-3"></a> -->
                    </div>
                </div>
            </div>
            <div class="carousel-item " style="height: 410px;">
                <img class="img-fluid" src="images/Logo_LostFound.png" alt="Image">
                <div class="carousel-caption d-flex flex-column align-items-center justify-content-end">
                    <div class="p-3" style="max-width: 700px;">
                        <h4 class="text-uppercase font-weight-medium mb-3">FPTU Lost&Found</h4>
                        <h3 class="display-4 text-white font-weight-semi-bold mb-4">The easy way to find your items</h3>
                    </div>
                </div>
            </div>
        </div>
        <a class="carousel-control-prev" href="#header-carousel" data-slide="prev">
            <div class="btn btn-primary" style="width: 45px; height: 35px;">
                <span class="carousel-control-prev-icon mb-n2"></span>
            </div>
        </a>
        <a class="carousel-control-next" href="#header-carousel" data-slide="next">
            <div class="btn btn-primary" style="width: 45px; height: 35px;">
                <span class="carousel-control-next-icon mb-n2"></span>
            </div>
        </a>
    </div>
    <div class="tabs">
        <div style="width: 45px;" class="dropdown filter">
            <div style="width: 80px; padding: 0;" class="dropdown-select">
                <span class="dropdown-value filter-btn btn"><i class=" fa-solid fa-filter"></i> Filter</span>
            </div>
            <div style=" min-width: 170px; max-width: 200px;" class="dropdown-list filter-list mt-3">
                <c:forEach var="dt" items="${ListItemType}" > 
                <a href="SearchServlet?txtItem=${dt.itemID}&searchAction=Find" class="dropdown-item filter-item text-white"><c:out value="${dt.itemName}"/></a>
                </c:forEach>               
            </div>
        </div>
       <div class="tab-item active">
            <a href="paging">LOST</a> 
        </div>
        <div class="tab-item">
            <a href="paging1">FOUND</a> 
        </div>  
      
        <div class="tab-item">
            <a href="paging2">NOTICE</a>
        </div>
        <div class="line"></div>
    </div>
    <!-- tab content -->
    <div class="tab-content">
        <c:if test="${not empty userdata && userdata.status eq 1}">
        <a type="button" href="CreateFormServlet" class="center createPost--btn btn rounded-circle"><i
                class="fa-solid fa-arrow-up-right-from-square"></i></a>
        </c:if>
        <div class="row tab-pane active">
            <c:forEach var="dt" items="${articlesFind}" >
            <a href="ViewDetailServlet?aId=${dt.articleID}" >
                <div class="pane mb-3">
                    <div class="card h-100">
                        <div class="pane-img">
                            <c:if test="${not empty dt.imgUrl}">
                        <img class="card-img-top" src="images/${dt.imgUrl}" alt=""> </c:if>
                        <c:if test="${empty dt.imgUrl}">
                        <img class="card-img-top" src="images/Logo_LostFound.png" alt=""> </c:if>
                        </div>
                        <div class="card-body pane-content">
                            <h5 class="card-title"><c:out value="${dt.title}"/></h5>
                            <p class="card-text">Time: <c:out value="${dt.postTime}"/></p>
                            <a href="SearchServlet?txtItem=${dt.item.itemID}&searchAction=Find">    <p><span style="padding: 5px 10px 5px 10px" class="badge badge-pill badge-primary"><c:out value="${dt.item.itemName}"/></span></p>   </a> 
                            <p class="card-text">
                                 <c:forEach var="lah" items="${listAH}" >
                        <c:if test="${dt.articleID eq lah.article.articleID}">
                        <span><a href="SearchServlet?hId=${lah.hashtag.hashtagID}&searchAction=Find"><c:out value="${lah.hashtag.hashtagName}"/></a></span>
                        </c:if>    
                    </c:forEach> 
                            </p>

                        </div>
                    </div>
                </div>
            </a>
            </c:forEach>
            <nav aria-label="...">
            <ul class ="pagination pagination-lg mt-3">
                <c:forEach begin="1" end="${a.numberPage}" var="i">
                    <li class="page-item ${indexPage==i?"active":""}"><a class="page-link" href="paging?index=${i}">${i}</a></li>
                </c:forEach>
            </ul>
        </nav>
        </div>       
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

    <!-- jQuery first, then Popper.js, then Bootstrap JS. -->
    <script src="js/mycode.js"></script>
   <!-- <script src="node_modules/jquery/dist/jquery.slim.min.js"></script>
    <script src="node_modules/popper.js/dist/umd/popper.min.js"></script>
    <script src="node_modules/bootstrap/dist/js/bootstrap.min.js"></script> -->
</body>

</html>
