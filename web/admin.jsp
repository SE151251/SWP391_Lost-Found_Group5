<%-- 
    Document   : admin
    Created on : Jun 19, 2022, 9:42:10 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
