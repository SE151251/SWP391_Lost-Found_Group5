/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fu.servlets;

import fu.daos.ArticleDAO;
import fu.daos.ArticleHashtagDAO;
import fu.daos.HashtagDAO;
import fu.daos.ItemTypeDAO;
import fu.entities.Article;
import fu.entities.ArticleHashTag;
import fu.entities.Hashtag;
import fu.entities.Item;
import fu.entities.Member;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
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
@WebServlet(name = "ListPostServlet", urlPatterns = {"/ListPostServlet"})
public class ListPostServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession(false);
            if (session == null) {
                request.setAttribute("errormessage", "Please login!");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
            if (session.getAttribute("userdata") != null) {
                Member memberLogin = (Member) session.getAttribute("userdata");
                ArticleDAO adao = new ArticleDAO();
                List<Article> listArtsFind = adao.getAllArticlesFind();
                request.setAttribute("articlesFind", listArtsFind);
                List<Article> listArtsReturn = adao.getAllArticlesReturn();
                request.setAttribute("articlesReturn", listArtsReturn);               
                List<Article> listArtsNotice = adao.getAllArticlesNotice();
                request.setAttribute("articlesNotice", listArtsNotice);
                ItemTypeDAO itDao = new ItemTypeDAO();
                List<Item> listI = itDao.getAllItems();
                request.setAttribute("ListItemType", listI);
                ArticleHashtagDAO ahDao = new ArticleHashtagDAO();
                List<ArticleHashTag> listAH = ahDao.getAllArticleHashtag();
                request.setAttribute("listAH", listAH);
            } else {
                request.setAttribute("errormessage", "Please login!");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            request.getRequestDispatcher("home.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
