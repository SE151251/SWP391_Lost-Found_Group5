/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fu.servlets;

import fu.daos.ArticleDAO;
import fu.daos.MemberDAO;
import fu.entities.Article;
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
@WebServlet(name = "PersonalServlet", urlPatterns = {"/PersonalServlet"})
public class PersonalServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession(false);
//            if (session == null) {
//                request.setAttribute("errormessage", "Please login!");
//                request.getRequestDispatcher("login.jsp").forward(request, response);
//                return;
//            }
            if (session.getAttribute("userdata") != null) {
                Member memberLogin = (Member) session.getAttribute("userdata");
                String uId = request.getParameter("uId");
                MemberDAO mdao = new MemberDAO();
                Member memDetail = mdao.find(uId);
//                if(memberLogin.getMemberID().equals(memDetail.getMemberID())){
//                memberLogin.setMemberProfile(memDetail.getMemberProfile());  
//                }
                ArticleDAO adao = new ArticleDAO();
                List<Article> listArts = adao.getAllArticlesByMemberID(memDetail);
                request.setAttribute("articlesPersonal", listArts);              
                request.setAttribute("memberInfo", memDetail);
                request.getRequestDispatcher("personal.jsp").forward(request, response);               
            } else {
                //request.setAttribute("errormessage", "Please login!");
                //request.getRequestDispatcher("login.jsp").forward(request, response);
                String uId = request.getParameter("uId");
                MemberDAO mdao = new MemberDAO();
                Member memDetail = mdao.find(uId);
                ArticleDAO adao = new ArticleDAO();
                List<Article> listArts = adao.getAllArticlesByMemberID(memDetail);
                request.setAttribute("articlesPersonal", listArts);              
                request.setAttribute("memberInfo", memDetail);
                request.getRequestDispatcher("personal.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
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
