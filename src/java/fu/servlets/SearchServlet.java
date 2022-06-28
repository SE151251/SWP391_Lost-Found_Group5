/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fu.servlets;

import fu.daos.ArticleDAO;
import fu.daos.ArticleHashtagDAO;
import fu.daos.ItemTypeDAO;
import fu.entities.Article;
import fu.entities.ArticleHashTag;
import fu.entities.Item;
import fu.entities.Member;
import java.io.IOException;
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
@WebServlet(name = "SearchServlet", urlPatterns = {"/SearchServlet"})
public class SearchServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession(false);
            if (session == null) {
                request.setAttribute("errormessage", "Please login!");
                request.getRequestDispatcher("/WEB-INF/view/login.jsp").forward(request, response);
            }
            if (session.getAttribute("userdata") != null) {
                Member memberLogin = (Member) session.getAttribute("userdata");               
                // Xử lý loại đồ cần filter
                String itemId = request.getParameter("txtItem");
                String key = request.getParameter("keySearch");
                String hId = request.getParameter("hId");
                ArticleDAO adao = new ArticleDAO();
                if(itemId != null){
                ItemTypeDAO iDao = new ItemTypeDAO();
                Item i = iDao.getItemByID(Integer.parseInt(itemId));                
                List<Article> listArtsFind = adao.getAllArticlesFindByItemType(i);
                request.setAttribute("articlesFind", listArtsFind); 
                List<Article> listArtsReturn = adao.getAllArticlesReturnByItemType(i);
                request.setAttribute("articlesReturn", listArtsReturn); 
                List<Article> listArtsShare = adao.getAllArticlesShare();
                request.setAttribute("articlesShare", listArtsShare); 
                ItemTypeDAO itDao = new ItemTypeDAO();
                List<Item> listI = itDao.getAllItems();
                request.setAttribute("ListItemType", listI);
                ArticleHashtagDAO ahDao = new ArticleHashtagDAO();
                List<ArticleHashTag> listAH = ahDao.getAllArticleHashtag();
                request.setAttribute("listAH", listAH);
                }
                else if(key !=null){
                List<Article> listArtsFind = adao.searchAllArticlesFindByName(key);
                request.setAttribute("articlesFind", listArtsFind); 
                List<Article> listArtsReturn = adao.searchAllArticlesReturnByName(key);
                request.setAttribute("articlesReturn", listArtsReturn); 
                List<Article> listArtsShare = adao.getAllArticlesShare();
                request.setAttribute("articlesShare", listArtsShare); 
                ItemTypeDAO itDao = new ItemTypeDAO();
                List<Item> listI = itDao.getAllItems();
                request.setAttribute("ListItemType", listI);
                ArticleHashtagDAO ahDao = new ArticleHashtagDAO();
                List<ArticleHashTag> listAH = ahDao.getAllArticleHashtag();
                request.setAttribute("listAH", listAH);
                } else if(hId!=null){
                List<Article> listArtsFind = adao.searchAllArticlesFindByHashtag(hId);
                request.setAttribute("articlesFind", listArtsFind); 
                List<Article> listArtsReturn = adao.searchAllArticlesReturnByHashtag(hId);
                request.setAttribute("articlesReturn", listArtsReturn); 
                List<Article> listArtsShare = adao.searchAllArticlesShareByHashtag(hId);
                request.setAttribute("articlesShare", listArtsShare); 
                ItemTypeDAO itDao = new ItemTypeDAO();
                List<Item> listI = itDao.getAllItems();
                request.setAttribute("ListItemType", listI);  
                ArticleHashtagDAO ahDao = new ArticleHashtagDAO();
                List<ArticleHashTag> listAH = ahDao.getAllArticleHashtag();
                request.setAttribute("listAH", listAH);
                }
                
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
