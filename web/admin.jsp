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
        <title>DashBoard</title>
        <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">

      // Load the Visualization API and the piechart package.
      google.load('visualization', '1.0', {'packages':['corechart']});
      google.setOnLoadCallback(drawChart);

      function drawChart() {

        // Create the data table.
        var data = new google.visualization.DataTable();
        // Create columns for the DataTable
        data.addColumn('string');
        data.addColumn('number', 'Devices');
        // Create Rows with data
        data.addRows([
          ['Lost', ${numberLost}],
          ['Found', ${numberFound}],          
        ]);
		//Create option for chart
        var options = {
          title: 'Lost And Found',
          'width': 800,
          'height': 600
        };

        // Instantiate and draw our chart, passing in some options.
        var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
    </script>
    </head>
    <body>
        <h1>Welcome ${userdata.memberName}</h1>
        <nav>
            <a href="#">DashBoard</a>
            <a href="ListMemberServlet">ListMembers</a>
            <a href="#">ListReports</a>
            <a href="#">Post</a>
        </nav>
        <table style="border: 2px solid black">
            <thead>
                <tr>
            <td>Total Report Not Confirm</td>
            <td>Total Post LOST Today</td>
            <td>Total Post FOUND Today</td>
            <td>Total Post LOST</td>
            <td>Total Post FOUND</td>
            </tr>
            </thead>
            <tbody>
                
                <tr>
                    <td>${numberReport}</td>
                    <td>${numberLostToday}</td>
                    <td>${numberFoundToday}</td>
                    <td>${numberLost}</td>
                    <td>${numberFound}</td>
                    
                </tr>
               
            </tbody>
        </table>
        <div id="chart_div"></div>
    </body>
</html>


