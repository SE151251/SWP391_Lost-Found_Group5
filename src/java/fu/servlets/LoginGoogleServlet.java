/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fu.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import GoogleAPI.GooglePojo;
import GoogleAPI.GoogleUtils;
import fu.daos.CampusDAO;
import fu.daos.MemberDAO;
import fu.entities.Campus;
import fu.entities.Member;
import javax.servlet.http.HttpSession;

/**
 *
 * @author LENOVO
 */
@WebServlet(name = "LoginGoogleServlet", urlPatterns = {"/login-google"})
public class LoginGoogleServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static final String INDEX_PAGE = "ListPostServlet";
    private static final String LOGIN_PAGE = "LoginServlet";

    public LoginGoogleServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            String uri = INDEX_PAGE;
        try {            
            HttpSession session = request.getSession();
            String code = request.getParameter("code");
            if (code == null || code.isEmpty()) {               
               uri=LOGIN_PAGE;
               request.setAttribute("errormessage", "Please login!");
            } else {
                String accessToken = GoogleUtils.getToken(code);               
                GooglePojo googlePojo = GoogleUtils.getUserInfo(accessToken);

                Member member = new Member(googlePojo.getId(), googlePojo.getName(), googlePojo.getEmail(), googlePojo.getPicture(), "Your profile here", 1, 1, 0);
                MemberDAO mdao = new MemberDAO();
                String[] email = member.getMemberEmail().split("@");
                //check form mail
                if (email[1].equals("fpt.edu.vn") || email[1].equals("fe.edu.vn")) {
                    boolean check = mdao.findMemberById(member.getMemberID());
                    //Nếu user chưa có thì add
                    if (!check) {
                        mdao.addNewMember(member);
                        session.setAttribute("userdata", member);  
                    //Nếu có rồi thì lấy data của user ra để phục vụ hiển thị trên các view khác
                    } else {
                        member = mdao.find(member.getMemberID());
                        session.setAttribute("userdata", member);                       
                    }
                }else{  // mail ko đúng form
                    uri=LOGIN_PAGE;
                    request.setAttribute("errormessage", "Your email can not join this web!");
                }
            }
        } catch (Exception e) {
            System.out.println("error at LoginGoogleServlet");
           uri=LOGIN_PAGE;
           request.setAttribute("errormessage", "Something error here!");
        } finally {
            request.getRequestDispatcher(uri).forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
