<%-- 
    Document   : detailMember
    Created on : Jul 9, 2022, 3:39:48 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detail Member</title>
    </head>
    <body>
        <h1>Detail Member</h1>
        <nav>
            <a href="AdminListServlet">DashBoard</a>
            <a href="ListMemberServlet">ListMembers</a>
            <a href="#">ListReports</a>
            <a href="#">Post</a>
        </nav>
        <div><img src="${MemberInfo.picture}"/></div>
        <p>Name: ${MemberInfo.memberName}</p>
        <p>Email: ${MemberInfo.memberEmail}</p>
        <div>
            <p>Profile</p>
        <pre>${MemberInfo.memberProfile}</pre>
        </div>
        <p>Account Status: ${MemberInfo.status}</p>
        <p>Number of warning: ${MemberInfo.memberCount}</p>
        <div>
            <h5>More info:</h5>
        <p>Total Posted: ${numberPost}</p>       
        <p>Total post type LOST: ${numberLost}</p>
        <p>Total post type FOUND: ${numberFound}</p>
         </div>
         <div>
             <h3>Ban/Warn</h3>
             <c:if test="${MemberInfo.status eq 1}"><a href="WarningMemberServlet?uId=${MemberInfo.memberID}&adminAction=ban">BAN</a> | <a href="WarningMemberServlet?uId=${MemberInfo.memberID}&adminAction=warnMember">WARNING</a></c:if>
            <c:if test="${MemberInfo.status eq 0}"><a href="WarningMemberServlet?uId=${MemberInfo.memberID}&adminAction=unban">UNBAN</a></c:if>
         </div>
        <c:if test="${not empty listPostWarning}">
        <h3>List post of this member be warning by ADMIN</h3>
        <table>
            <thead>
                <tr>
            <td>Article ID</td>
            <td>Title</td>
            <td>Post Time</td>
            <td>Status</td>           
            <td>Article Type</td>
            </tr>
            </thead>
            <tbody>
                <c:forEach var="dt" items="${listPostWarning}" >                  
                <tr>
                    <td>${dt.articleID}</td>
                    <td>${dt.title}</td>
                    <td>${dt.postTime}</td>
                    <td>${dt.articleStatus}</td>                   
                    <td>${dt.type.typeName}</td>
                </tr>
                </c:forEach>
              
            </tbody>
        </table>
        </c:if>
         <c:if test="${not empty listReports}">
        <h3>List report about this member</h3>
        <table>
            <thead>
                <tr>
            <td>Member Report</td>
            <td>Article Title</td>
            <td>Report Content</td>
            <td>Report Time</td>
            <td>Status</td>
            <td>Confirm Time</td>           
            </tr>
            </thead>
            <tbody>
                <c:forEach var="dt" items="${listReports}" >                  
                <tr>
                    <td>${dt.member.memberName}</td>
                    <td>${dt.article.title}</td>
                    <td>${dt.reportContent}</td>
                    <td>${dt.reportTime}</td>
                    <td>${dt.status}</td>
                    <c:if test="${dt.status eq 0}">
                        <td>${dt.confirmTime}</td>                        
                    </c:if>
                    <c:if test="${dt.status eq 1}">
                        <td>Not yet</td>                        
                    </c:if>
                                       
                </tr>
                </c:forEach>
              
            </tbody>
        </table>
        
       </c:if>
    </body>
</html>


