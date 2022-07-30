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
        <nav class="navbar navbar-dark navbar-expand-md fixed-top">

            <ul style="width: 13%;" class="navbar-nav container ml-5">
                <li class="nav-item active">
                    <a class="nav-link" href="paging"><i class="fa fa-home mr-1"></i> Home </a>
                </li>
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
                                    <form <c:if test="${action eq 'create'}"> enctype='multipart/form-data'</c:if> method="POST">
                                    <table>
                <tr>
                    
                            <td style="font-size: 20px; padding-bottom: 20px"">Title:</td>
                            <td style="padding-bottom: 20px"><input style="width: 500px; height: 50px;" type="text" name="txtTitle" value="${titlePost}"<font color="red">${titleError}</font></td>
			</tr>      
                <tr>
                    
                            <td style="font-size: 20px">Content:</td>
                            <td style=" padding-bottom: 20px">
                            <%--    <input style="width: 500px; height: 100px" type="text" name="txtContent" value="${content}" --%>
                                <textarea rows="9" cols="70" name="txtContent"><c:out value="${content}"/></textarea>
                                <font color="red"> ${contentError} </font>
                            </td>
		</tr> 
                        <tr>                    
                            <td style="font-size: 20px; padding-bottom: 20px"">Hashtag:</td>
                            <td style="padding-bottom: 20px"><input style="width: 500px; height: 50px;" type="text" name="txtHashtag" value="${hashtag}"<font color="red">${hashtagError}</font></td>
			</tr>
                <tr>
                <td  style="font-size: 20px; padding-bottom: 20px">Post type:</td>
                    <td style=" padding-bottom: 20px">
                         <select style="width: 250px; height: 40px; font-size: 20px; text-align: center" name="txtArticleType" >
                             <c:forEach var="dt" items="${ListArticleType}" >                                  
                                 <option  <c:if test="${dt.typeID eq postTypeId && action eq 'update'}">selected </c:if>
                                        <c:if test="${userdata.memberRole eq 0 && action eq 'create' && dt.typeID eq 3}">selected </c:if>                                                                
                                         <c:if test="${userdata.memberRole eq 1 && dt.typeID eq 3}">hidden</c:if>
                                         <c:if test="${userdata.memberRole eq 0 && dt.typeID ne 3}">hidden</c:if>
                                 value="${dt.typeID}"> <c:out value="${dt.typeName}"/> </option>
                             </c:forEach>
                         </select> 
                    </td>            
                </tr>
                <c:if test="${userdata.memberRole eq 1}">
                <tr>
                <td style="font-size: 20px; padding-bottom: 20px">Item type:</td>
                    <td style=" padding-bottom: 20px">
                         <select style="width: 250px; height: 40px; font-size: 20px; text-align: center" name="txtItem">
                             <c:forEach var="dt" items="${ListItemType}" >                                  
                                <option <c:if test="${dt.itemID eq itemId}">selected</c:if>
                       <%--         <c:if test="${userdata.memberRole eq 0 && dt.itemID eq 13}">selected </c:if> --%>
                                value="${dt.itemID}"><c:out value="${dt.itemName}"/></option>
                             </c:forEach>
                         </select> 
                    </td>            
                </tr>
                </c:if>
            <%--    <tr>                   
                    <td style="font-size: 20px; padding-bottom: 20px"">Hastag:</td>
                    <td style="padding-bottom: 20px"><input style="width: 500px; height: 50px;" type="text" name="txtTitle" value="${titlePost}"<font color="red">${titleError}</font></td>
		</tr> --%>
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
                   <td style="font-size: 20px; padding-bottom: 20px">Post status:</td>
                    <td style=" padding-bottom: 20px">
                        <select style="width: 250px; height: 40px; font-size: 20px; text-align: center" name="txtStatus" <c:if test="${isFlag eq 1}"> disabled </c:if> >                                                             
                                <option  <c:if test="${aStatus eq '0'}"> selected </c:if>
                                value="0">In Active</option>
                                <option <c:if test="${aStatus eq '1'}">selected </c:if>
                                                                             value="1">Active</option>                        
                         </select> 
                    </td>              
                </tr>
                </c:if>
                <c:if test="${action eq 'update' && isFlag eq 1}">
                    <input type="hidden" name="txtStatus" value="0">
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
                                    </form>
                                </dl>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
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

    <!-- jQuery first, then Popper.js, then Bootstrap JS. -->
    <script src="js/mycode.js"></script>
    <script src="node_modules/jquery/dist/jquery.slim.min.js"></script>
    <script src="node_modules/popper.js/dist/umd/popper.min.js"></script>
    <script src="node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
</body>

</html>

