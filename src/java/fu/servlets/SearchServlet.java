/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fu.servlets;

import fu.daos.ArticleDAO;
import fu.daos.ArticleHashtagDAO;
import fu.daos.ItemTypeDAO;
import fu.daos.MemberDAO;
import fu.daos.NotificationDAO;
import fu.entities.Article;
import fu.entities.ArticleHashTag;
import fu.entities.Item;
import fu.entities.Member;
import fu.entities.Notification;
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

    private static final String HOME_FIND = "home.jsp";
    private static final String HOME_RETURN = "homeReturn.jsp";
    private static final String HOME_NOTICE = "notification.jsp";
    private static final String ADMIN = "AdminListServlet";
    private static final String MemberList = "listMember.jsp";
    private static final String LOGIN = "login.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String uri = LOGIN;
        try {

            HttpSession session = request.getSession(false);
//            if (session == null) {
//                request.setAttribute("errormessage", "Please login!");
//                //request.getRequestDispatcher("/WEB-INF/view/login.jsp").forward(request, response);
//            }
            if (session.getAttribute("userdata") != null) {
                Member memberLogin = (Member) session.getAttribute("userdata");
                if(memberLogin.getMemberRole()==1){
                NotificationDAO ndao = new NotificationDAO();
                List<Notification> listNoti = ndao.getAllNotificationsByMember(memberLogin.getMemberID());
                request.setAttribute("listNoti", listNoti);
                }
                // Xử lý loại đồ cần filter
                String itemId = request.getParameter("txtItem");
                String key = request.getParameter("keySearch");
                String hId = request.getParameter("hId");
                String mName = request.getParameter("txtMemberName");
                String searchAction = request.getParameter("searchAction");
                // if (memberLogin.getMemberRole() == 1) {
                ArticleDAO adao = new ArticleDAO();
                ItemTypeDAO iDao = new ItemTypeDAO();
                ArticleHashtagDAO ahDao = new ArticleHashtagDAO();
                // search theo filter
                if (itemId != null) {
                    if (searchAction.equals("Find")) {
                        Item i = iDao.getItemByID(Integer.parseInt(itemId));
                        List<Article> listArtsFind = adao.getAllArticlesFindByItemType(i);
                        request.setAttribute("articlesFind", listArtsFind);
                        List<Item> listI = iDao.getAllItems();
                        request.setAttribute("ListItemType", listI);

                        List<ArticleHashTag> listAH = ahDao.getAllArticleHashtag();
                        request.setAttribute("listAH", listAH);
                        uri = HOME_FIND;
                    } else if (searchAction.equals("Return")) {

                        Item i = iDao.getItemByID(Integer.parseInt(itemId));
                        List<Article> listArtsReturn = adao.getAllArticlesReturnByItemType(i);
                        request.setAttribute("articlesReturn", listArtsReturn);
                        List<Item> listI = iDao.getAllItems();
                        request.setAttribute("ListItemType", listI);

                        List<ArticleHashTag> listAH = ahDao.getAllArticleHashtag();
                        request.setAttribute("listAH", listAH);
                        uri = HOME_RETURN;
                    } else if (searchAction.equals("Notice")) {

                        Item i = iDao.getItemByID(Integer.parseInt(itemId));
                        List<Article> listArtsShare = adao.getAllArticlesNoticeByItemType(i);
                        request.setAttribute("articlesShare", listArtsShare);
                        List<Item> listI = iDao.getAllItems();
                        request.setAttribute("ListItemType", listI);

                        List<ArticleHashTag> listAH = ahDao.getAllArticleHashtag();
                        request.setAttribute("listAH", listAH);
                        uri = HOME_NOTICE;
                    }
                } else if (key != null) {
                    // search theo từ khóa
                    if (searchAction.equals("Find")) {
                        List<Article> listArtsFind = adao.searchAllArticlesFindByName(key);
                        request.setAttribute("articlesFind", listArtsFind);

                        List<Item> listI = iDao.getAllItems();
                        request.setAttribute("ListItemType", listI);

                        List<ArticleHashTag> listAH = ahDao.getAllArticleHashtag();
                        request.setAttribute("listAH", listAH);
                        uri = HOME_FIND;
                    } else if (searchAction.equals("Return")) {
                        List<Article> listArtsReturn = adao.searchAllArticlesReturnByName(key);
                        request.setAttribute("articlesReturn", listArtsReturn);

                        List<Item> listI = iDao.getAllItems();
                        request.setAttribute("ListItemType", listI);

                        List<ArticleHashTag> listAH = ahDao.getAllArticleHashtag();
                        request.setAttribute("listAH", listAH);
                        uri = HOME_RETURN;
                    } else if (searchAction.equals("Notice")) {
                        List<Article> listArtsShare = adao.searchAllArticlesNoticeByName(key);
                        request.setAttribute("articlesShare", listArtsShare);

                        List<Item> listI = iDao.getAllItems();
                        request.setAttribute("ListItemType", listI);

                        List<ArticleHashTag> listAH = ahDao.getAllArticleHashtag();
                        request.setAttribute("listAH", listAH);
                        uri = HOME_NOTICE;
                    }
                } //search theo hashtag
                else if (hId != null) {
                    if (searchAction.equals("Find")) {
                        List<Article> listArtsFind = adao.searchAllArticlesFindByHashtag(hId);
                        request.setAttribute("articlesFind", listArtsFind);

                        List<Item> listI = iDao.getAllItems();
                        request.setAttribute("ListItemType", listI);

                        List<ArticleHashTag> listAH = ahDao.getAllArticleHashtag();
                        request.setAttribute("listAH", listAH);
                        uri = HOME_FIND;
                    } else if (searchAction.equals("Return")) {
                        List<Article> listArtsReturn = adao.searchAllArticlesReturnByHashtag(hId);
                        request.setAttribute("articlesReturn", listArtsReturn);

                        List<Item> listI = iDao.getAllItems();
                        request.setAttribute("ListItemType", listI);

                        List<ArticleHashTag> listAH = ahDao.getAllArticleHashtag();
                        request.setAttribute("listAH", listAH);
                        uri = HOME_RETURN;
                    } else if (searchAction.equals("Notice")) {
                        List<Article> listArtsShare = adao.searchAllArticlesNoticeByHashtag(hId);
                        request.setAttribute("articlesShare", listArtsShare);

                        List<Item> listI = iDao.getAllItems();
                        request.setAttribute("ListItemType", listI);

                        List<ArticleHashTag> listAH = ahDao.getAllArticleHashtag();
                        request.setAttribute("listAH", listAH);
                        uri = HOME_NOTICE;

                    }

                } else if (mName != null) {
                    MemberDAO mdao = new MemberDAO();
                    request.setAttribute("listMembersResult", mdao.findMemberByName(mName));
                    uri = MemberList;
                } else {
                    request.setAttribute("errorRole", "Your account can not use this function!");
                    uri = ADMIN;
                }

            } else {
                //request.setAttribute("errormessage", "Please login!");
                //request.getRequestDispatcher("login.jsp").forward(request, response);
                // Xử lý loại đồ cần filter
                String itemId = request.getParameter("txtItem");
                String key = request.getParameter("keySearch");
                String hId = request.getParameter("hId");
                String searchAction = request.getParameter("searchAction");
                ArticleDAO adao = new ArticleDAO();
                ItemTypeDAO iDao = new ItemTypeDAO();
                ArticleHashtagDAO ahDao = new ArticleHashtagDAO();
                // search theo filter
                if (itemId != null) {
                    if (searchAction.equals("Find")) {
                        Item i = iDao.getItemByID(Integer.parseInt(itemId));
                        List<Article> listArtsFind = adao.getAllArticlesFindByItemType(i);
                        request.setAttribute("articlesFind", listArtsFind);
                        List<Item> listI = iDao.getAllItems();
                        request.setAttribute("ListItemType", listI);

                        List<ArticleHashTag> listAH = ahDao.getAllArticleHashtag();
                        request.setAttribute("listAH", listAH);
                        uri = HOME_FIND;
                    } else if (searchAction.equals("Return")) {

                        Item i = iDao.getItemByID(Integer.parseInt(itemId));
                        List<Article> listArtsReturn = adao.getAllArticlesReturnByItemType(i);
                        request.setAttribute("articlesReturn", listArtsReturn);
                        List<Item> listI = iDao.getAllItems();
                        request.setAttribute("ListItemType", listI);

                        List<ArticleHashTag> listAH = ahDao.getAllArticleHashtag();
                        request.setAttribute("listAH", listAH);
                        uri = HOME_RETURN;
                    } else if (searchAction.equals("Notice")) {

                        Item i = iDao.getItemByID(Integer.parseInt(itemId));
                        List<Article> listArtsShare = adao.getAllArticlesNoticeByItemType(i);
                        request.setAttribute("articlesShare", listArtsShare);
                        List<Item> listI = iDao.getAllItems();
                        request.setAttribute("ListItemType", listI);

                        List<ArticleHashTag> listAH = ahDao.getAllArticleHashtag();
                        request.setAttribute("listAH", listAH);
                        uri = HOME_NOTICE;
                    }
                } else if (key != null) {
                    // search theo từ khóa
                    if (searchAction.equals("Find")) {
                        List<Article> listArtsFind = adao.searchAllArticlesFindByName(key);
                        request.setAttribute("articlesFind", listArtsFind);

                        List<Item> listI = iDao.getAllItems();
                        request.setAttribute("ListItemType", listI);

                        List<ArticleHashTag> listAH = ahDao.getAllArticleHashtag();
                        request.setAttribute("listAH", listAH);
                        uri = HOME_FIND;
                    } else if (searchAction.equals("Return")) {
                        List<Article> listArtsReturn = adao.searchAllArticlesReturnByName(key);
                        request.setAttribute("articlesReturn", listArtsReturn);

                        List<Item> listI = iDao.getAllItems();
                        request.setAttribute("ListItemType", listI);

                        List<ArticleHashTag> listAH = ahDao.getAllArticleHashtag();
                        request.setAttribute("listAH", listAH);
                        uri = HOME_RETURN;
                    } else if (searchAction.equals("Notice")) {
                        List<Article> listArtsShare = adao.searchAllArticlesNoticeByName(key);
                        request.setAttribute("articlesShare", listArtsShare);

                        List<Item> listI = iDao.getAllItems();
                        request.setAttribute("ListItemType", listI);

                        List<ArticleHashTag> listAH = ahDao.getAllArticleHashtag();
                        request.setAttribute("listAH", listAH);
                        uri = HOME_NOTICE;
                    }
                } //search theo hashtag
                else if (hId != null) {
                    if (searchAction.equals("Find")) {
                        List<Article> listArtsFind = adao.searchAllArticlesFindByHashtag(hId);
                        request.setAttribute("articlesFind", listArtsFind);

                        List<Item> listI = iDao.getAllItems();
                        request.setAttribute("ListItemType", listI);

                        List<ArticleHashTag> listAH = ahDao.getAllArticleHashtag();
                        request.setAttribute("listAH", listAH);
                        uri = HOME_FIND;
                    } else if (searchAction.equals("Return")) {
                        List<Article> listArtsReturn = adao.searchAllArticlesReturnByHashtag(hId);
                        request.setAttribute("articlesReturn", listArtsReturn);

                        List<Item> listI = iDao.getAllItems();
                        request.setAttribute("ListItemType", listI);

                        List<ArticleHashTag> listAH = ahDao.getAllArticleHashtag();
                        request.setAttribute("listAH", listAH);
                        uri = HOME_RETURN;
                    } else if (searchAction.equals("Notice")) {
                        List<Article> listArtsShare = adao.searchAllArticlesNoticeByHashtag(hId);
                        request.setAttribute("articlesShare", listArtsShare);

                        List<Item> listI = iDao.getAllItems();
                        request.setAttribute("ListItemType", listI);

                        List<ArticleHashTag> listAH = ahDao.getAllArticleHashtag();
                        request.setAttribute("listAH", listAH);
                        uri = HOME_NOTICE;

                    }

                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            request.getRequestDispatcher(uri).forward(request, response);
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
