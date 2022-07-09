<%-- 
    Document   : listMember
    Created on : Jul 1, 2022, 11:01:45 PM
    Author     : LENOVO
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List Members</title>
    </head>
    <body>
        <a href="AdminListServlet">Home</a>
        <h1>Search Member</h1>
        <form action="SearchServlet">
           Input Name of Member:<input type="text" name="txtMemberName" value=""/>
           <input type="hidden" name="searchAction" value="Member"/>
            <input type="submit" value="Search"/>
        </form>       
        <h1>List Members</h1>
        
        <table>
            <thead>
                <tr>
            <td>Member Name</td>
            <td>Member Email</td>
            <td>Number Warnings Of This Member</td>
            <td>Function</td>
            <td>Detail</td>
            </tr>
            </thead>
            <tbody>
                <c:if test="${not empty listMembers}">
                <c:forEach var="dt" items="${listMembers}" >
                    
                <tr>
                    <td>${dt.memberName}</td>
                    <td>${dt.memberEmail}</td>
                    <td>${dt.memberCount}</td>
                    <td>
                    <c:if test="${dt.status eq 0}"><a href="WarningMemberServlet?uId=${dt.memberID}&adminAction=unban">UNBAN</a></c:if>
                    <c:if test="${dt.status eq 1}"><a href="WarningMemberServlet?uId=${dt.memberID}&adminAction=ban">BAN</a> | <a href="WarningMemberServlet?uId=${dt.memberID}&adminAction=warnMember">WARNING</a></c:if>
                    
                    </td>
                    <td><a href="ViewDetailMemberByAdminServlet?uId=${dt.memberID}">View detail >></a></td>
                </tr>
                
                </c:forEach>
                </c:if>
                <c:if test="${not empty listMembersResult}">
                <c:forEach var="dt" items="${listMembersResult}" >                  
                <tr>
                    <td>${dt.memberName}</td>
                    <td>${dt.memberEmail}</td>
                    <td>${dt.memberCount}</td>
                    <td>
                    <c:if test="${dt.status eq 0}"><a href="WarningMemberServlet?uId=${dt.memberID}&adminAction=unban">UNBAN</a></c:if>
                    <c:if test="${dt.status eq 1}"><a href="WarningMemberServlet?uId=${dt.memberID}&adminAction=ban">BAN</a> | <a href="WarningMemberServlet?uId=${dt.memberID}&adminAction=warnMember">WARNING</a></c:if>
                    </td>
                    <td><a href="ViewDetailMemberByAdminServlet?uId=${dt.memberID}">View detail >></a></td>
                </tr>
                </c:forEach>
                </c:if>
            </tbody>
        </table>
        
    </body>
</html>
