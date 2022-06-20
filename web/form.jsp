<%-- 
    Document   : form.jsp
    Created on : Jun 4, 2022, 9:13:59 PM
    Author     : LENOVO
--%>

<%-- 
    Document   : bookform
    Created on : Mar 1, 2022, 11:21:05 PM
    Author     : Masterkien
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- <!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FPTU Lost And Found</title>
    </head>
    <body>
        <h3>
            Article Form
        </h3> <br>

        <c:if test="${!postURL.isEmpty()}"><p>Your image: </p><br/> 
                    <div style="width: 300px"><img src="images/${postURL}" width="100%"></div></c:if>
        <form <c:if test="${action eq 'create'}"> enctype='multipart/form-data'</c:if> method="POST">
            <table>
                <tr>
                            <td>Content</td>
                            <td>: <input type="description" name="txtContent" value="${content}"<font color="red">${contentError}</font></td>
			</tr>      
                    
                <tr>
                <td>Article Type</td>
                    <td>:
                         <select name="txtArticleType" >
                             <c:forEach var="dt" items="${ListArticleType}" >                                  
                                 <option <c:if test="${dt.typeID eq postTypeId}">selected </c:if>
                                 value="${dt.typeID}"> <c:out value="${dt.typeName}"/> </option>
                             </c:forEach>
                         </select> 
                    </td>            
                </tr>
                <tr>
                <td>Item Type</td>
                    <td>:
                         <select name="txtItem" >
                             <c:forEach var="dt" items="${ListItemType}" >                                  
                                <option <c:if test="${ dt.itemID eq itemId}">selected </c:if>
                                value="${dt.itemID}"><c:out value="${dt.itemName}"/></option>
                             </c:forEach>
                         </select> 
                    </td>            
                </tr>
                <c:if test="${action eq 'create'}">         
                <tr>
                    <td>Post image </td>
                    <td>: <input type="file" name="photo"/><font color="red"> ${errorURL} </font></td>               
                </tr>
                </c:if>
                 <tr>
                    <td colspan="2">                   
                    <c:if test="${action eq 'create'}">
                    <input type="hidden" name="articleURL" value="${postURL}">
                    <button formaction="CreateServlet" type="submit">Create</button></c:if>
                    <c:if test="${action eq 'update'}">
                    <input type="hidden" name="articleURL" value="${postURL}">
                    <input type="hidden" name="idUpdate" value="${idUpdate}">
                    <button formaction="UpdateServlet" type="submit">Update</button></c:if>
                    </td>
                </tr>
            </table>         
        </form>
                        <a href="ListPostServlet">Home</a>
       
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
</head>

<body>
    <header>
        <nav class="navbar navbar-dark fixed-top">
            <div class="navbar">
                <button class="rounded-circle" type="button" data-toggle="collapse" data-target="#Navbar">
                    <img class="rounded-circle" src="${userdata.picture}" height="30" width="100%">
                </button>
               <span class="Nav-username" style="width: 400px;"><c:out value="${userdata.memberName}"/></span>
            </div>
            <div class="search col-md-4">
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
            </div>
        </nav>
        <div class="collapse navbar-collapse" id="Navbar">
            <ul class="navbar-nav container ml-5">
                <li class="nav-item">
                    <a class="nav-link" href="ListPostServlet"><i class="fa fa-home fa-lg"></i>Home </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#"><span class="fa-solid fa-user"></span> Personal Page</a>
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
            <div style="margin-left: 20%" id="" class="" role="dialog">
        <div class="m" role="content">
            <!-- Modal content-->
            <div class="">
                <div class="">
                    <div id="postform" class=" col-sm-6 col-md-12 align-self-center">
                        <div class="">
                            <div class="card-body">
                                <dl class="">
                                    <c:if test="${action eq 'create'}">
                                    <h3 style="margin-left: 30%; padding-top: 50px; padding-bottom: 50px " class="mt-4 font-strong">CREATE POST</h3>
                                    </c:if>
                                    <c:if test="${action eq 'update'}">
                                    <h3 style="margin-left: 30%; padding-top: 50px; padding-bottom: 50px " class="mt-4 font-strong">UPDATE POST</h3>
                                    </c:if>
                                    <form <c:if test="${action eq 'create'}"> enctype='multipart/form-data'</c:if> method="POST" class="modal-post--input">
                                    <table>
                <tr>
                    
                            <td style="font-size: 20px; padding-bottom: 20px"">Tiêu đề:</td>
                            <td style="padding-bottom: 20px"><input style="width: 500px; height: 50px;" type="text" name="txtTitle" value="${titlePost}"<font color="red">${titleError}</font></td>
			</tr>      
                  <tr>
                    
                            <td style="font-size: 20px">Nội dung:</td>
                            <td style=" padding-bottom: 20px">
                            <%--    <input style="width: 500px; height: 100px" type="text" name="txtContent" value="${content}" --%>
                                <textarea rows="9" cols="70" name="txtContent"><c:out value="${content}"/></textarea>
                                <font color="red"> ${contentError} </font>
                            </td>
			</tr>   
                <tr>
                <td style="font-size: 20px; padding-bottom: 20px">Loại bài viết:</td>
                    <td style=" padding-bottom: 20px">
                         <select style="width: 250px; height: 40px; font-size: 20px; text-align: center" name="txtArticleType" >
                             <c:forEach var="dt" items="${ListArticleType}" >                                  
                                 <option <c:if test="${dt.typeID eq postTypeId}">selected </c:if>
                                         <c:if test="${userdata.memberRole eq 1 && dt.typeID eq 4}">hidden</c:if>
                                 value="${dt.typeID}"> <c:out value="${dt.typeName}"/> </option>
                             </c:forEach>
                         </select> 
                    </td>            
                </tr>
                <tr>
                <td style="font-size: 20px; padding-bottom: 20px">Đồ vật loại:</td>
                    <td style=" padding-bottom: 20px">
                         <select style="width: 250px; height: 40px; font-size: 20px; text-align: center" name="txtItem" >
                             <c:forEach var="dt" items="${ListItemType}" >                                  
                                <option <c:if test="${ dt.itemID eq itemId}">selected </c:if>
                                value="${dt.itemID}"><c:out value="${dt.itemName}"/></option>
                             </c:forEach>
                         </select> 
                    </td>            
                </tr>
                <c:if test="${action eq 'create'}">         
                <tr>
                    <td style="font-size: 20px">Post image:</td>
                    <td><input type="file" name="photo"/><font color="red"> ${errorURL} </font></td>               
                </tr>
                </c:if>
    <%--            <c:if test="${action eq 'update'}">         
                <tr>
                    <td style="font-size: 20px">Article image: </td>
                    <td>
                        <div style="width: 200px;">
                            <img style="width: 100%; box-sizing: content-box" src="images/${postURL}" />
                        </div>
                    </td>               
                </tr>
                </c:if> --%>
                <c:if test="${action eq 'update'}">         
                <tr>
                   <td style="font-size: 20px; padding-bottom: 20px">Trạng thái bài viết:</td>
                    <td style=" padding-bottom: 20px">
                         <select style="width: 250px; height: 40px; font-size: 20px; text-align: center" name="txtStatus" >                                                             
                                <option <c:if test="${aStatus eq '0'}"> selected </c:if>
                                value="0">In Active</option>
                                <option <c:if test="${aStatus eq '1'}">selected </c:if>
                                                                             value="1">Active</option>                        
                         </select> 
                    </td>              
                </tr>
                </c:if>
                 <tr>
                    <td  colspan="2">                   
                    <c:if test="${action eq 'create'}">
                    <input type="hidden" name="articleURL" value="${postURL}">
                    <button style="margin-left: 112px; margin-top: 20px; width: 130px; font-size: 20px; background-color: orange; font-weight: bold" formaction="CreateServlet" type="submit">Create</button></c:if>
                    <c:if test="${action eq 'update'}">
                    <input type="hidden" name="articleURL" value="${postURL}">
                    <input type="hidden" name="idUpdate" value="${idUpdate}">
                    <button style="margin-left: 112px; margin-top: 20px; width: 130px; font-size: 20px; background-color: orange; font-weight: bold" formaction="UpdateServlet" type="submit">Update</button></c:if>
                    </td>
                </tr>
            </table>         
                    <%--                 
                                        <textarea class="pb-100 form-control form-control-lg form-control-plaintext"
                                            placeholder="What's up ?" name="txtContent" id="" cols="245" value="${content}"
                                            rows="2"></textarea>
                                            <font color="red">${contentError}</font>
                                        <input type="file" name="photo" class="form-control-file border">
                                       <div class="mt-3 input-group">
                                            <p>Article Type</p>
                                            <div class="input-group-append">
                                                <div class="dropdown">
                                                    <div class="dropdown-select">
                                                        <span class="dropdown-value">Search by</span>
                                                        <span>
                                                            <svg xmlns="http://www.w3.org/2000/svg"
                                                                style="width: 20px; height: 10px" fill="none"
                                                                viewBox="0 0 24 24" stroke="currentColor">
                                                                <path stroke-linecap="round" stroke-linejoin="round"
                                                                    stroke-width="2" d="M19 9l-7 7-7-7" />
                                                            </svg>
                                                        </span>
                                                    </div>
                                                    <div class="dropdown-list">
                                                        <div class="dropdown-item">Name</div>
                                                        <div class="dropdown-item">Categories</div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="input-group">
                                            <p>Items Type</p>
                                            <div class="input-group-append">
                                                <div class="dropdown">
                                                    <div class="dropdown-select">
                                                        <span class="dropdown-value">Search by</span>
                                                        <span>
                                                            <svg xmlns="http://www.w3.org/2000/svg"
                                                                style="width: 20px; height: 10px" fill="none"
                                                                viewBox="0 0 24 24" stroke="currentColor">
                                                                <path stroke-linecap="round" stroke-linejoin="round"
                                                                    stroke-width="2" d="M19 9l-7 7-7-7" />
                                                            </svg>
                                                        </span>
                                                    </div>
                                                    <div class="dropdown-list">
                                                        <div class="dropdown-item">Name</div>
                                                        <div class="dropdown-item">Categories</div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>  
                            
                                        <button class="search-button btn btn-lg">Post</button> --%>
                                    </form>
                                </dl>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <footer>
        Footer
    </footer>
    <!-- modal -->

    <!-- jQuery first, then Popper.js, then Bootstrap JS. -->
    <script src="js/mycode.js"></script>
    <script src="node_modules/jquery/dist/jquery.slim.min.js"></script>
    <script src="node_modules/popper.js/dist/umd/popper.min.js"></script>
    <script src="node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
</body>

</html>

