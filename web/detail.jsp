
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/styleDetail.css">
    <title>Lost And Found</title>
    <!-- Bootstrap CSS -->
    <script src="https://kit.fontawesome.com/f2fda88f12.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="node_modules/bootstrap/dist/css/bootstrap.min.css" />
    <link rel="stylesheet" href="node_modules/bootstrap-social/bootstrap-social.css" />
    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>

<body>
    <header>
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
                    <a class="nav-link" href="ListPostServlet"><i class="fa fa-home mr-1"></i> Home </a>
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

    </header>
    <!-- main-content------- -->
    <div class="container-f">
        <div class="row">
            <div>
                 <div style="margin-left: 20px" class="status-field-container write-post-container">
        <div class="user-profile-box">
            <div class="user-profile">                
                <img src="${postDetail.member.picture}" alt="">
                <div>
                    <p><a href="PersonalServlet?uId=${postDetail.member.memberID}">${userdata.memberName}</a></p>
                    <small>${postDetail.postTime}</small>
                </div>
            </div>
           
        </div>
        <div class="status-field">
            <pre style="font-size: 20px; margin-top: 15px;">${postDetail.articleContent}</pre>
            <div style="width: 400px">
            <img style="width: 174%" src="images/${postDetail.imgUrl}" alt="">
            <span>Status: 
            <c:if test="${postDetail.articleStatus eq 1}">Active</c:if>
            <c:if test="${postDetail.articleStatus eq 0}">Closed</c:if>
            </span>
            </div>
        </div>
        <div class="post-reaction">
            <div class="activity-icons">
                <div onclick="comment_dl()">
                    <img src="images/comments.png" alt="">Comment
                </div>
            <c:if test="${userdata.memberRole eq 1 && userdata.memberID ne postDetail.member.memberID}">
                <div onclick="report_dl()">
                <div><img src="images/report.png" alt="">Report</div>
                </div>
                </c:if>
            <c:if test="${userdata.memberRole eq 0}">
                            <div>
                                <a href="WarningMemberServlet?adminAction=ban&aId=${postDetail.articleID}">
                                <img src="images/banned.png" alt="">Banned</a>
                            </div>                            
                        <div>
                            <div>
                                <a href="WarningMemberServlet?adminAction=warn&aId=${postDetail.articleID}">
                                <img src="images/warning.png" alt="">Warning ${postDetail.member.memberCount + 1}</a>
                            </div>
                        </div>
                            <div>
                            <div>
                                <a href="WarningMemberServlet?adminAction=none&aId=${postDetail.articleID}">
                                    <img src="images/confirmation.png" alt="">Confirmation</a>                           
                            </div>
                            </div>
            </c:if>
                           
            <c:if test="${userdata.memberID eq postDetail.member.memberID}">
                <div><a style="text-decoration: none; color: black;" href="UpdateFormServlet?aId=${postDetail.articleID}"><img src="images/update.png" alt="">UPDATE</a></div>
                <div><a style="text-decoration: none; color: black" href="DeleteServlet?aId=${postDetail.articleID}" onclick="return confirm('Are you sure?')"><img src="images/remove.png" alt="">REMOVE</a>  </div>
            </c:if>   
                </div>

        </div>
    </div>
            
 <!--Report -->
        <c:if test="${checkReport ne null}">
                <div>
                    <p>Bạn đã report bài viết này rồi</p>
                </div>
            </c:if>
        <%--    <c:if test="${checkReport eq null && postDetail.member.memberID ne userdata.memberID && userdata.memberID eq 1}">
            <%-- Tạo report --%>
         <%--       <div>
                <form action = "CreateReportServlet">
                    <textarea cols="36" rows="6" name="txtReport" placeholder="Write your reason here..." maxlength="200" minlength="10"></textarea>
                     <font color="red"> ${errorReport} </font><br/>
                    <input type="hidden" name="memberReport" value="${userdata.memberID}"/>
                    <input type="hidden" name="aId" value="${postDetail.articleID}"/>
                    <input type="submit" value="Submit"/>
                </form>
            </div>
            </c:if> --%>
            <%-- Xem report bằng account Admin 
            <c:if test="${not empty viewReport && userdata.memberID eq 0}">
                <div>
                <div class="user-profile">                
                <img src="${viewReport.member.picture}" alt="">
                <div>
                    <p><a href="PersonalServlet?uId=${viewReport.member.memberID}">${viewReport.member.memberName}</a></p>
                    <small>${viewReport.reportTime}</small>
                </div>
                </div>
                <pre><c:out value="${viewReport.reportContent}"/></pre>
                <a href="WarningMemberServlet?adminAction=warn&aId=${postDetail.articleID}">Cảnh cáo lần ${postDetail.member.memberCount + 1}</a>
                <a href="WarningMemberServlet?adminAction=ban&aId=${postDetail.articleID}">Chặn tài khoản này</a>
                <a href="WarningMemberServlet?adminAction=none&aId=${postDetail.articleID}">Không có vấn đề</a>
                </div>
            </c:if>
            --%>
            
            

    <div class="test-c " id="test-d">
        <div class="body_comment ">
            
                <div class="avatar_comment  ">
                    <img src="${userdata.picture}" alt="avatar" />
               
                </div>
             
                <div class="box_comment  ">
                    <form action="CreateCommentServlet">
                        <textarea class="commentar" name="txtCmt" rows="4" cols="100" placeholder="Add a comment..."></textarea>
                        <font color="red"> ${errorCmt} </font>
                        <div class="box_post">
                            <div class="pull-left">
                            </div>
                            <div class="pull-right">
                                <span>
                                </span>
                                <input type="hidden" name="memberCmt" value="${userdata.memberID}"/>
                                 <input type="hidden" name="aId" value="${postDetail.articleID}"/>
                                 <input type="submit" value="Post"/>
                               
                            </div>
                        </div>
                    </form>
                </div>
                    
                    
           
        </div>
    </div>
        <c:if test="${checkReport eq null && postDetail.member.memberID ne userdata.memberID && userdata.memberRole eq 1}">                            
    <div class="test-report " id="test-r">
        <div class="body_report ">
            
                <div class="avatar_report ">
                    <img src="${userdata.picture}" alt="avatar" />
                </div>
                
                <div class="box_report ">
                    <form action="CreateReportServlet">
                    <textarea class="reportar" name="txtReport" rows="4" cols="100" placeholder="Add a report..."></textarea>
                    
                    <div class="box_post">
                        <div class="pull-left">
                        </div>
                        <div class="pull-right">
                            <span>
                            </span>
                            <input type="hidden" name="memberReport" value="${userdata.memberID}"/>
                             <input type="hidden" name="aId" value="${postDetail.articleID}"/>
                             <input type="submit" value="Post"/>
                           
                        </div>
                    </div>
                    </form>
                </div>
            
                    
                    
            
        </div>
    </div>
        </c:if>
                                 
        <c:forEach var="dt" items="${listCmt}" > 
            <div class="tab-commnent">
        <div class="user-comment">
            <div class="avatar_comment">                
                <img src="${dt.member.picture}" alt=""></div>
                <div class="title_comment">
                    <p><a href="PersonalServlet?uId=${dt.member.memberID}">${dt.member.memberName}</a></p>
                    <small><c:out value="${dt.commentTime}"/></small>
                </div>
            
        </div>    
        <div class="comment-content">
            <span class=""><c:out value="${dt.commentContent}"/></span>
            <c:if test="${userdata.memberID eq postDetail.member.memberID}">
                <br/><span><a href="DeleteCommentServlet?cmtId=${dt.commentId}&aId=${postDetail.articleID}" onclick="return confirm('Bạn chắc muốn xóa bình luận này?')">Xóa</a></span>
            </c:if>
            </div>
            </div>
        <br/>
        </c:forEach>  
        <br/>
        
        <%-- Xem report bằng account Admin --%>
        <c:if test="${not empty viewReport}">
                       <div>
                      <div class="tab-report">
                               <div  class="user-report" >
                        <div class="avatar_report">                
                            <img src="${viewReport.member.picture}" alt=""></div>
                            
                            <div class="title_report">
                                <p><a href="PersonalServlet?uId=${viewReport.member.memberID}">${viewReport.member.memberName}</a></p>
                                <small>${viewReport.reportTime}</small>
                            </div>

                            </div>
                            
                            <div class="report-content">
                                <pre><c:out value="${viewReport.reportContent}"/></pre>
                            </div>    
                           

                                        </div>
                            
                        </div>     
                            </c:if>
            </div>
                        
                        
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
                      
        <script src="js/function.js"></script>

</body>
 
</html>
