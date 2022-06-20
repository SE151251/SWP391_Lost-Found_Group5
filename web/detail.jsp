<%-- 
    Document   : detail
    Created on : Jun 7, 2022, 9:08:56 AM
    Author     : LENOVO
--%>

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
        <nav class="navbar navbar-dark fixed-top">
            <div class="navbar">
                <button class="rounded-circle" type="button" data-toggle="collapse" data-target="#Navbar">
                    <img class="rounded-circle" src="${userdata.picture}" height="30" width="100%">
                </button>
                <span class="Nav-username" style="width: 300px;"><c:out value="${userdata.memberName}"/></span>
            </div>
                <%--        <div class="search col-md-4">
                <div class="search-field">
                    <div class="search-icon"></div>
                    <input type="text" class="search-input" placeholder="Search">
                </div>

                <div class="dropdown">
                    <div class="dropdown-select">
                        <span class="dropdown-value">Search by</span>
                        <span>
                            <svg xmlns="http://www.w3.org/2000/svg" style="width: 20px; height: 10px" fill="none"
                                viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M19 9l-7 7-7-7" />
                            </svg>
                        </span>
                    </div>
                    <div class="dropdown-list">
                        <div class="dropdown-item">Name</div>
                        <div class="dropdown-item">Categories</div>
                    </div>
                </div>
                <button class="search-button">Search</button>
            </div> --%>
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
                    <a class="nav-link" href="ListPostServlet"><i class="fa fa-home fa-lg"></i>Home </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="PersonalServlet?uId=${userdata.memberID}"><span class="fa-solid fa-user"></span> Personal Page</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="./"><span class="fa-regular fa-thumbs-up"></span>
                        Liked list</a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="LogoutServlet"><i class="fa-solid fa-arrow-right-from-bracket"></i> Logout</a>
                </li>
            </ul>
        </div>

    </header>
    <!-- main-content------- -->
    <div style="margin-left: 20px" class="status-field-container write-post-container">
        <div class="user-profile-box">
            <div class="user-profile">                
                <img src="${postDetail.member.picture}" alt="">
                <div>
                    <p><a href="PersonalServlet?uId=${postDetail.member.memberID}">${postDetail.member.memberName}</a></p>
                    <small>${postDetail.postTime}</small>
                </div>
            </div>
            <div>
                <a href="#"><i class="fas fa-ellipsis-v"></i></a>
            </div>
        </div>
        <div class="status-field">
            <pre style="font-size: 20px; margin-top: 15px;"><c:out value="${postDetail.articleContent}"/></pre>
            <div style="width: 400px">
            <img style="width: 100%" src="images/${postDetail.imgUrl}" alt="">
            <span>Trạng thái: 
            <c:if test="${postDetail.articleStatus eq 1}">Đang hoạt động</c:if>
            <c:if test="${postDetail.articleStatus eq 0}">Đã đóng</c:if>
            </span>
            </div>
        </div>
        <div class="post-reaction">
            <div class="activity-icons">
                <c:if test="${postDetail.articleStatus eq 1}">
                <div onclick="testds()">
                    <img src="images/comments.png" alt="">Comment
                </div>
                <c:if test="${userdata.memberID ne postDetail.member.memberID}">
                <div><img src="images/report.png" alt="">Report</div>
                </c:if>
                </c:if>
                <c:if test="${userdata.memberID eq postDetail.member.memberID}">
                <div><a href="UpdateFormServlet?aId=${postDetail.articleID}">UPDATE</a></div>
                <div><a href="DeleteServlet?aId=${postDetail.articleID}" onclick="return confirm('Are you sure?')">REMOVE</a>  </div>
                </c:if>
                </div>

        </div>
    </div> 
            <c:if test="${checkReport ne null}">
                <div>
                    <p>Bạn đã report bài viết này rồi</p>
                </div>
            </c:if>
            <c:if test="${checkReport eq null && postDetail.member.memberID ne userdata.memberID}">
            <div>
                <form action = "CreateReportServlet">
                    <textarea cols="36" rows="6" name="txtReport" placeholder="Write your reason here..." maxlength="200" minlength="10"></textarea>
                     <font color="red"> ${errorReport} </font><br/>
                    <input type="hidden" name="memberReport" value="${userdata.memberID}"/>
                    <input type="hidden" name="aId" value="${postDetail.articleID}"/>
                    <input type="submit" value="Submit"/>
                </form>
            </div>
            </c:if>
            <c:if test="${not empty viewReport}">
                <div>
                <pre><c:out value="${viewReport.reportContent}"/></pre>
                <a href="WarningMemberServlet?adminAction=warn&aId=${postDetail.articleID}">Cảnh cáo lần ${postDetail.member.memberCount + 1}</a>
                <a href="WarningMemberServlet?adminAction=ban&aId=${postDetail.articleID}">Chặn tài khoản này</a>
                <a href="WarningMemberServlet?adminAction=none&aId=${postDetail.articleID}">Không có vấn đề</a>
                </div>
            </c:if>
            

    <div class="test-c " id="test-d">
        <div class="body_comment">
            <div class="row">
                <div class="avatar_comment col-md-1">
                    <img src="${userdata.picture}" alt="avatar" />
                </div>
                <form action="CreateCommentServlet">
                <div class="box_comment col-md-11">                  
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
                             <input style="background-color: #0066FF; font-weight: bold; color: white" type="submit" value="Post"/>
                           <%-- <button formaction="CreateCommentServlet" type="button" >Post</button> --%>
                        </div>
                    </div>
                </div>
                    
                    </form>
            </div>
        </div>
    </div>
                            
                            
        <c:forEach var="dt" items="${listCmt}" >                    
        <div class="user-comment">
            <div class="avatar_comment">                
                <img src="${dt.member.picture}" alt=""></div>
                <div class="title_comment">
                    <p><c:out value="${dt.member.memberName}"/></p>
                    <small><c:out value="${dt.commentTime}"/></small>
                </div>
            
        </div>    
        <div class="comment-content">
            <span class=""><c:out value="${dt.commentContent}"/></span>
            <c:if test="${userdata.memberID eq postDetail.member.memberID}">
            <span><a href="DeleteCommentServlet?aId=${postDetail.articleID}&memberCmt=${userdata.memberID}" onclick="return confirm('Bạn chắc muốn xóa bình luận này?')">Xóa</a></span>
            </c:if>
            </div>
        <br/>
        </c:forEach>        
                
               
        <script src="js/function.js"></script>

</body>
 
</html>
