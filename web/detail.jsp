
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

    </header>
    <!-- main-content------- -->
    <div class="container-f">
        <div class="row">
            <div class="top-content">
                 <div style="margin-left: 20px " class="status-field-container write-post-container">
        <div class="user-profile-box">
            <div class="user-profile">                
                <img src="${postDetail.member.picture}" alt="">
                <div>
                    <p>
                        <c:if test="${postDetail.member.memberRole eq 1 && userdata.memberRole eq 1}">
                            <a href="PersonalServlet?uId=${postDetail.member.memberID}">${postDetail.member.memberName}</a>
                        </c:if>
                        <c:if test="${postDetail.member.memberRole eq 0}">
                            <a href="#">${postDetail.member.memberName}</a>
                        </c:if>
                   
            <c:if test="${postDetail.type.typeID eq 1}">
            <span style="padding: 5px 10px 5px 10px" class="badge badge-pill badge-primary">LOST</span>                                                   
            </c:if>
            <c:if test="${postDetail.type.typeID eq 2}">
            <span style="padding: 5px 10px 5px 10px" class="badge badge-pill badge-primary">FOUND</span>                                                   
            </c:if>
            <c:if test="${postDetail.type.typeID eq 3}">
            <span style="padding: 5px 10px 5px 10px" class="badge badge-pill badge-primary">NOTICE</span>                                                   
            </c:if>
                    </p>
                    <small>${postDetail.postTime}</small>
                </div>
            <c:if test="${postDetail.warningStatus eq 1}">
            <span style="padding: 5px 10px 5px 10px" class="badge badge-pill badge-danger">Flagged</span>                                                   
            </c:if>
            </div>
           
        </div>
        <div class="status-field">
            <pre style="font-size: 20px; margin-top: 15px;">${postDetail.articleContent}</pre>
            <c:if test="${postDetail.type.typeID eq 1}">
            <a href="SearchServlet?txtItem=${postDetail.item.itemID}&searchAction=Find">    <p><span style="padding: 5px 10px 5px 10px" class="badge badge-pill badge-primary"><c:out value="${postDetail.item.itemName}"/></span></p>   </a>                                                   
            </c:if>
            <c:if test="${postDetail.type.typeID eq 2}">
            <a href="SearchServlet?txtItem=${postDetail.item.itemID}&searchAction=Return">    <p><span style="padding: 5px 10px 5px 10px" class="badge badge-pill badge-primary"><c:out value="${postDetail.item.itemName}"/></span></p>   </a>                                                   
            </c:if>
            <div style="width: 400px">
            
            <c:forEach var="lah" items="${listAH}" >
            
            <c:if test="${postDetail.type.typeID eq 1}">
                <span><a href="SearchServlet?hId=${lah.hashtagID}&searchAction=Find"><c:out value="${lah.hashtagName}"/></a></span>
                </c:if>             
                <c:if test="${postDetail.type.typeID eq 2}">
                <span><a href="SearchServlet?hId=${lah.hashtagID}&searchAction=Return"><c:out value="${lah.hashtagName}"/></a></span>
                </c:if>
                <c:if test="${postDetail.type.typeID eq 3}">
                <span><a href="SearchServlet?hId=${lah.hashtagID}&searchAction=Notice"><c:out value="${lah.hashtagName}"/></a></span>
                </c:if>
            </c:forEach> 
            
            <br/>
            <div class="circle"></div>
            
            
            <c:if test="${postDetail.articleStatus eq 1 && userdata.memberID eq postDetail.member.memberID || userdata.memberRole eq 0 && postDetail.articleStatus eq 1}"> <div class="circle-open"></div>  <span style="margin-left: 25px;">Active </span></c:if>
            <c:if test="${postDetail.articleStatus eq 0 && userdata.memberID eq postDetail.member.memberID || userdata.memberRole eq 0 && postDetail.articleStatus eq 0}"> <div class="circle-close"></div>  <span style="margin-left: 25px;">Closed  </span></c:if>
             <c:if test="${postDetail.articleStatus eq -1 && userdata.memberRole eq 0}"> <div class="circle-close"></div>  <span style="margin-left: 25px;">Deleted</span></c:if> 
            <img style="width: 169%" src="images/${postDetail.imgUrl}" alt="">
            </div>
        </div>
        <div class="post-reaction">
            <div class="activity-icons">
                <c:if test="${postDetail.articleStatus eq 1 && userdata.memberRole eq 1 && postDetail.type.typeID ne 3 && userdata.status eq 1}">
                <div onclick="comment_dl()">
                    <img src="images/comments.png" alt="">Comment
                </div>
                </c:if>
            <c:if test="${userdata.memberRole eq 1 && userdata.memberID ne postDetail.member.memberID && checkReport eq null && postDetail.type.typeID ne 3 && userdata.status eq 1}">
                <div onclick="report_dl()">
                <div><img style="padding-left: 165px;" src="images/report.png" alt="">Report</div>
                </div>
                </c:if>
            <c:if test="${userdata.memberRole eq 0 && postDetail.articleStatus ne -1}">
                <%-- 
                <div>
                                <a href="WarningMemberServlet?adminAction=ban&aId=${postDetail.articleID}">
                                <img src="images/banned.png" alt="">Banned</a>
                            </div>  --%>                          
                <c:if test="${postDetail.warningStatus eq 0 && postDetail.articleStatus ne -1}">    
                <div>
                            <div>
                                <a href="WarningMemberServlet?adminAction=flag&aId=${postDetail.articleID}">
                                <img src="images/warning.png" alt="">Flag</a>
                            </div>
                        </div>
                </c:if>
                <c:if test="${postDetail.warningStatus eq 1 && postDetail.articleStatus ne -1}">       
                <div>
                            <div>
                                <a href="WarningMemberServlet?adminAction=unFlag&aId=${postDetail.articleID}">
                                <img src="images/warning.png" alt="">Unflag</a>
                            </div>
                        </div>
                </c:if> 
               
                <c:if test="${confirmReport ne null}">
                <c:if test="${confirmReport eq 'no'}"> 
                            <div>
                            <div>
                                <a href="WarningMemberServlet?adminAction=none&aId=${postDetail.articleID}">
                                    <img src="images/confirmation.png" alt="">Confirm</a>                           
                            </div>
                            </div>
                </c:if>
                </c:if>
               
            </c:if>
                           
            <c:if test="${userdata.memberID eq postDetail.member.memberID && postDetail.articleStatus ne -1 && userdata.status eq 1}">
                <div><a style="text-decoration: none; color: black; padding-left: 376px" href="UpdateFormServlet?aId=${postDetail.articleID}"><img src="images/update.png" alt="">Update</a></div>
                <div><a style="text-decoration: none; color: black; padding-left: 0px;" href="DeleteServlet?aId=${postDetail.articleID}" onclick="return confirm('Are you sure?')"><img src="images/remove.png" alt="">Remove</a>  </div>
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
                              
    <div class="test-report " id="test-r">
        <c:if test="${checkReport eq null && postDetail.member.memberID ne userdata.memberID && userdata.memberRole eq 1}">      
        <div class="body_report ">
            
                <div class="avatar_report ">
                    <img src="${userdata.picture}" alt="avatar" />
                </div>
                
                <div class="box_report ">
                    <form action="CreateReportServlet">
                    <textarea class="reportar" name="txtReport" rows="4" cols="100" placeholder="Add a report..."></textarea>
                    <font color="red"> ${errorReport} </font><br/>
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
                             </c:if>
                
    </div>
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
                <br/><span style="display: block; margin-left: 349px"><a href="DeleteCommentServlet?cmtId=${dt.commentId}&aId=${postDetail.articleID}" onclick="return confirm('Bạn chắc muốn bình luận này?')">Xóa</a></span>
            </c:if>
            </div>
            </div>
        <br/>
        </c:forEach>  
        <br/>
        
        <%-- Xem report bằng account Admin --%>
       
            </div>
                        
                        
        </div>
        
    </div>
        
       
                      
        <script src="js/function.js"></script>

</body>
 
</html>
