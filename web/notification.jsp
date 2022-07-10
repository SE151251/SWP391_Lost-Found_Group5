<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HomePage</title>
    </head>
    <body>
        <h1>Home Page</h1>
    <c:forEach var="dt" items="${articles}" >
        <div>
            <div><c:out value="${dt.articleContent}"/> </div>
            <div style="width: 200px"><img src="images/${dt.imgUrl}" width="100%"></div>
            <div><c:out value="${dt.item.itemName}"/></div>
            <div><c:out value="${dt.type.typeName}"/></div>
            <a href="UpdateFormServlet?aId=${dt.articleID}">Update</a>
            <a href="DeleteServlet?aId=${dt.articleID}" onclick="return confirm('Are you sure?')">REMOVE</a>  
            <a href="index.jsp">Profile</a>
        </div>
        <br/>
            </c:forEach>
    </body>
</html> --%>
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
    <link rel="stylesheet" href="css/style.css" />
    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  <jsp:useBean id="a" class="fu.daos.ArticleDAO" scope="request"></jsp:useBean>
</head>

<body>
     <header>
         <c:if test="${empty userdata}">
            <nav class="navbar navbar-dark navbar-expand-md fixed-top">
                
                <ul style="width: 13%;" class="navbar-nav container ml-5">
           <li class="nav-item active">
                    <a class="nav-link" href="paging"><i class="fa fa-home mr-1"></i> Home </a>
                </li> 
           </ul>
           </nav>
        </c:if>
     <c:if test="${not empty userdata}">
        <nav class="navbar navbar-dark navbar-expand-md fixed-top">
            <div class="navbar">

                <button class="rounded-circle p-0" type="button" data-toggle="collapse" data-target="#Navbar">
                            <img class="rounded-circle" src="${userdata.picture}" height="30" width="100%">
                        </button>
                        <span class="Nav-username">${userdata.memberName}</span>


            </div>
            <ul style="width: 13%;" class="navbar-nav container ml-5">
                <c:if test="${userdata.memberRole eq 1}">
                <li class="nav-item active">
                    <a class="nav-link" href="paging"><i class="fa fa-home mr-1"></i> Home </a>
                </li>
                <li class="nav-item">

                    <a class="nav-link" href="#"><span class="fa-solid fa-bookmark"></span>
                        Saved list</a>
                </li>
                </c:if>
                <c:if test="${userdata.memberRole eq 0}">
                <li class="nav-item active">
                    <a class="nav-link" href="AdminListServlet"><i class="fa fa-home mr-1"></i> Home </a>
                </li>
                 </c:if>
            </ul>


        </nav>
        <div class="collapse navbar-collapse" id="Navbar">
            <ul class="navbar-nav container ml-5">
                <c:if test="${userdata.memberRole eq 1}">
                <li class="nav-item">
                    <a class="nav-link" href="PersonalServlet?uId=${userdata.memberID}"><span class="fa-solid fa-user"></span> Personal
                        Page</a>
                </li>
                </c:if>
                <li class="nav-item active">
                    <a class="nav-link" href="LogoutServlet"><i class="fa-solid fa-arrow-right-from-bracket"></i> Logout</a>
                </li>
            </ul>
        </div>
        </c:if>
    </header>
             <c:if test="${userdata.memberCount ne 0 && not empty userdata}">
            <p class="acc-warning">Tài khoản của bạn bị cảnh cáo lần ${userdata.memberCount}</p>
                </c:if>           
                            
    <div class="search-form">
        
       <div style="width: 45px;" class="dropdown filter">

            <div style="width: 42px; padding: 0;" class="dropdown-select">
                <span class="dropdown-value filter-btn"><i class=" fa-solid fa-filter"></i></span>
            </div>
            <div style=" min-width: 170px; max-width: 200px;" class="dropdown-list filter-list mt-3">
                    <c:forEach var="dt" items="${ListItemType}" > 
                <a href="SearchServlet?txtItem=${dt.itemID}&searchAction=Notice" class="dropdown-item filter-item text-white"><c:out value="${dt.itemName}"/></a>
                </c:forEach>
            </div>
        </div>
        <form class="search col-md-4">
            <div class="search-field">   
                <input type="text" name="keySearch" class="search-input p-1" placeholder="Search here">
            <input type="hidden" name="searchAction" value="Notice"/>
            </div>

            <button formaction="SearchServlet" class="search-button p-1 pl-3 pr-3 ml-2">Search</button>
        </form>
    </div>
    <div class="tabs">
       
        <div class="tab-item ">
            <a href="paging">Find</a> 
        </div>
        <div class="tab-item">
            <a href="paging1">Return</a> 
        </div>  
      
        <div class="tab-item active">
            <a href="paging2">Announcements of ADMIN</a>
        </div>
        <div class="line"></div>
    </div>

    <!-- tab content -->
    <div class="tab-content ">
    <c:if test="${not empty userdata}">
        <a type="button" href="CreateFormServlet" class="center createPost--btn rounded-circle"><i
                class="fa-solid fa-arrow-up-right-from-square"></i></a>
        </c:if>
        <div class="row tab-pane active">
            <c:forEach var="dt" items="${articlesShare}" >
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
                    <a href="SearchServlet?txtItem=${dt.item.itemID}&searchAction=Notice">    <p><span style="padding: 5px 10px 5px 10px" class="badge badge-pill badge-primary"><c:out value="${dt.item.itemName}"/></span></p>   </a>                                 
                   <div class="hashtag-viewmore">
                    <c:forEach var="lah" items="${listAH}" >
                        <c:if test="${dt.articleID eq lah.article.articleID}">
                        <span><a href="SearchServlet?hId=${lah.hashtag.hashtagID}&searchAction=Notice"><c:out value="${lah.hashtag.hashtagName}"/></a></span>
                        </c:if>    
                    </c:forEach> 
                   </div>
                       
                    <a href="ViewDetailServlet?aId=${dt.articleID}">View more >></a>                   
                  
                </div>
            </div>
            </c:forEach>
            <nav aria-label="...">
            <ul class ="pagination pagination-lg">
                <c:forEach begin="1" end="${a.numberPageNotice}" var="i">
                    <li class="page-item ${indexPage2==i?"active":""}"><a class="page-link" href="paging2?index2=${i}">${i}</a></li>
                </c:forEach>
            </ul>
            </nav> 
        </div>
    </div>
            <!-- Footer -->
        <footer class="text-center text-lg-start bg-light text-muted">
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
    <!-- jQuery first, then Popper.js, then Bootstrap JS. -->
    <script src="js/mycode.js"></script>
    <script src="node_modules/jquery/dist/jquery.slim.min.js"></script>
    <script src="node_modules/popper.js/dist/umd/popper.min.js"></script>
    <script src="node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
</body>

</html>
