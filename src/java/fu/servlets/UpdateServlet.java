/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fu.servlets;

import fu.daos.ArticleDAO;
import fu.daos.ArticleTypeDAO;
import fu.daos.ItemTypeDAO;
import fu.entities.Article;
import fu.entities.ArticleType;
import fu.entities.Item;
import fu.entities.Member;
import java.io.IOException;
import java.time.LocalDateTime;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author LENOVO
 */
@WebServlet(name = "UpdateServlet", urlPatterns = {"/UpdateServlet"})
public class UpdateServlet extends HttpServlet {

    private static final String SUCCESS = "ListPostServlet";
    private static final String ERROR = "error.jsp";
    private static final String INVALID = "UpdateFormServlet";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String url = ERROR;
        try {
            HttpSession session = request.getSession(false);
            if (session == null) {
                request.setAttribute("errormessage", "Please login!");
                request.getRequestDispatcher("/WEB-INF/view/login.jsp").forward(request, response);
            }
            if (session.getAttribute("userdata") != null) {
                Member memberLogin = (Member) session.getAttribute("userdata");
                boolean valid = true;
                String titleError = "";
                String contentError = "";
                String errorURL = "";
                String newId;
                String idUpdate = request.getParameter("idUpdate");
                String textURL = request.getParameter("articleURL");
                
                // Xử lý title bài viết    
                String titlePost = request.getParameter("txtTitle");                
                if (titlePost.trim().isEmpty() || titlePost.trim().length() < 10 || titlePost.trim().length() > 50) {
                    titleError = "Title must be at least 10 and at most 100 characters!";
                    valid = false;
                }

                // Xử lý nội dung bài viết  
                String content = request.getParameter("txtContent");
                if (content.isEmpty() || content.trim().length() < 20 || content.trim().length() > 4000) {
                    contentError = "Content must be at least 20 and at most 4000 characters!";
                    valid = false;
                }
                // Xử lý status bài viết:
                String aStatus = request.getParameter("txtStatus");
                
                // Xử lý loại đồ vật của bài viết
                String itemId = request.getParameter("txtItem");
                ItemTypeDAO iDao = new ItemTypeDAO();
                Item i = iDao.getItemByID(Integer.parseInt(itemId));

                // Xử lý loại bài viết
                String postTypeId = request.getParameter("txtArticleType");
                ArticleTypeDAO aTDao = new ArticleTypeDAO();
                ArticleType at = aTDao.getArticleTypeByID(Integer.parseInt(postTypeId));

                ArticleDAO aDao = new ArticleDAO();
                if (valid) {
                    Article a = new Article(idUpdate, titlePost.trim(), content.trim(), textURL, LocalDateTime.now().toString(), Integer.parseInt(aStatus), i, memberLogin, at);
                    aDao.updateContentArticle(a);
                    url = SUCCESS;
                } else {
                    url = INVALID;
                    request.setAttribute("titlePost", titlePost);
                    request.setAttribute("titleError", titleError);
                    request.setAttribute("contentError", contentError);
                    request.setAttribute("errorURL", errorURL);
                    request.setAttribute("content", content);
                    request.setAttribute("aStatus", aStatus);
                    request.setAttribute("postURL", textURL);
                    request.setAttribute("itemId", Integer.parseInt(itemId));
                    request.setAttribute("postTypeId", Integer.parseInt(postTypeId));
                }
            } else {
                request.setAttribute("errormessage", "Please login!");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
