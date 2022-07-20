/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fu.servlets;

import SendMail.JavaMailUtil;
import fu.daos.ArticleDAO;
import fu.daos.MemberDAO;
import fu.daos.NotificationDAO;
import fu.daos.ReportDAO;
import fu.entities.Article;
import fu.entities.Member;
import fu.entities.Notification;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;
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
@WebServlet(name = "WarningMemberServlet", urlPatterns = {"/WarningMemberServlet"})
public class WarningMemberServlet extends HttpServlet {

    private static final String ADMIN = "AdminListServlet";
    private static final String LIST_MEMBERS_PAGE = "ListMemberServlet";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = ADMIN;
        try {
            HttpSession session = request.getSession(false);
            if (session == null) {
                request.setAttribute("errormessage", "Please login with ADMIN account!");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } else if (session.getAttribute("userdata") != null) {

                Member member = (Member) session.getAttribute("userdata");
                if (member.getStatus() == 1) {
                    String uId = request.getParameter("uId");
                    String aId = request.getParameter("aId");
                    String adminAction = request.getParameter("adminAction");
                    NotificationDAO ndao = new NotificationDAO();
                    ArticleDAO aDao = new ArticleDAO();
//                if(aId!=null){
//                Article a = aDao.find(Integer.parseInt(aId));
//                }
                    MemberDAO mdao = new MemberDAO();
                    ReportDAO rdao = new ReportDAO();
                    // Thêm trường hợp cảnh cáo bài viết
                    // Với bài viết bị cảnh cáo thì close bài viết đó
                    // Với member bị cảnh cáo thì chỉ thay đổi count
                    // Với member bị Ban thì đóng hết các bài viết bị report
                    // Sau khi xử lý 1 report thì các report liên quan tới bài viết đó đều được xử lý theo 1 lượt.

                    // Trường hợp member bị cảnh cáo
                    if (adminAction.equalsIgnoreCase("flag")) {
                        aDao.flagArticle(Integer.parseInt(aId));
                        rdao.updateStatusReportByArticleID(Integer.parseInt(aId));
                        aDao.closeArticle(Integer.parseInt(aId));
                        Article postFlag = aDao.find(Integer.parseInt(aId));
                        String notiContent = "Your post has been FLAGGED by ADMIN";
                        ndao.addNewNotifications(new Notification(0, member, postFlag.getMember(), postFlag, notiContent, LocalDateTime.now().toString(), 1));
                        JavaMailUtil.sendMail(postFlag.getMember().getMemberEmail(), "Your post has been FLAGGED by ADMIN");
                    } else if (adminAction.equalsIgnoreCase("unFlag")) {
                        aDao.unFlagArticle(Integer.parseInt(aId));
                        //rdao.updateStatusReportByArticleID(Integer.parseInt(aId));
                        aDao.openArticle(Integer.parseInt(aId));
                        Article postFlag = aDao.find(Integer.parseInt(aId));
                        String notiContent = "Your post has been UNFLAG by ADMIN";
                        ndao.addNewNotifications(new Notification(0, member, postFlag.getMember(), postFlag, notiContent, LocalDateTime.now().toString(), 1));
                        JavaMailUtil.sendMail(postFlag.getMember().getMemberEmail(), "Your post has been UNFLAG by ADMIN");
                    } else if (adminAction.equalsIgnoreCase("warnMember")) {
                        // Tìm member đăng bài post by id rồi tăng count của member post bài lên +1
//                    if (aId != null) {
//                        Member memberWarn = mdao.find(a.getMember().getMemberID());
//                        memberWarn.setMemberCount(memberWarn.getMemberCount() + 1);
//                        mdao.warningMember(memberWarn);
//
//                        //Thay đổi trạng thái của tất cả report về bài viết này thành 0 (tức là đã xử lý all report của bài viết)
//                        rdao.updateStatusReport(Integer.parseInt(aId));
//
//                        //Thay đổi trạng thái bài viết thành InActive
//                        aDao.closeArticle(Integer.parseInt(aId));
//                    } else if (uId != null) {
                        Member memberWarn = mdao.find(uId);
                        memberWarn.setMemberCount(memberWarn.getMemberCount() + 1);
                        mdao.warningMember(memberWarn);
                        String notiContent = "Your account has been WARNED by ADMIN";
                        ndao.addNewNotifications(new Notification(0, member, memberWarn, null, notiContent, LocalDateTime.now().toString(), 1));
                        JavaMailUtil.sendMail(memberWarn.getMemberEmail(), "Your account has been WARNED by ADMIN");
                        url = LIST_MEMBERS_PAGE;

                        // Trường hợp member bị ban
                    } else if (adminAction.equalsIgnoreCase("ban")) {
                        // Tìm member đăng bài post by id rồi tăng count của member post bài lên +1
//                    if (aId != null) {
//                        Member memberBan = mdao.find(a.getMember().getMemberID());
//                        memberBan.setStatus(0);
//                        mdao.banOrUnbanMember(memberBan);
//
//                        //Thay đổi trạng thái tất cả bài viết của member bị ban thành InActive
//                        aDao.updateStatusArticlesOfMemberBanned(memberBan);
//
//                        //Thay đổi trạng thái của tất cả report của tất cả các bài viết của member bị ban này thành 0
//                        //Step1: Lấy ra tất cả bài viết của member bị ban
//                        ArrayList<Article> listPostOfMemBan = aDao.getAllArticlesByMemberID(memberBan);
//                        for (Article article : listPostOfMemBan) {
//                            //Step 2: Xử lý hết tất cả report liên quan tới member này.
//                            rdao.updateStatusReport(article.getArticleID());
//                        }
//                    } else if (uId != null) {
                        Member memberBan = mdao.find(uId);
                        memberBan.setStatus(0);
                        mdao.banOrUnbanMember(memberBan);

                        // Đóng tất cả bài viết bị report
                        //B1: Lấy ra tất cả bài viết bị report của member này
                        //B2: Đổi all post với status thành 0 (closed), đồng thời đóng các report liên quan đến từng post
                        ArrayList<Integer> list = aDao.getAllArticlesBeReportedOfAMember(memberBan.getMemberID());
                        for (Integer i : list) {
                            aDao.updateStatusArticlesOfMemberBanned(memberBan, i);
                            rdao.updateStatusReportByArticleID(i);
                        }
                        String notiContent = "Your account has been BANNED by ADMIN";
                        ndao.addNewNotifications(new Notification(0, member, memberBan, null, notiContent, LocalDateTime.now().toString(), 1));
                        JavaMailUtil.sendMail(memberBan.getMemberEmail(), "Your account has been BANNED by ADMIN");
                        url = LIST_MEMBERS_PAGE;

                        // Trường hợp member bị tố cáo không có vấn đề gì
                    } else if (adminAction.equalsIgnoreCase("none")) {
                        //Thay đổi trạng thái của tất cả report về bài viết này thành 0 (tức là đã xử lý all report của bài viết)
                        rdao.updateStatusReportByArticleID(Integer.parseInt(aId));
                        // Trả bài viết về trạng thái Active
                        //aDao.openArticle(Integer.parseInt(aId));
                    } else if (adminAction.equalsIgnoreCase("unban")) {
                        Member memberBan = mdao.find(uId);
                        memberBan.setStatus(1);
                        mdao.banOrUnbanMember(memberBan);
                        String notiContent = "Your account has been UNLOCKED by ADMIN";
                        ndao.addNewNotifications(new Notification(0, member, memberBan, null, notiContent, LocalDateTime.now().toString(), 1));
                        JavaMailUtil.sendMail(memberBan.getMemberEmail(), "Your account has been UNLOCKED by ADMIN");
                        url = LIST_MEMBERS_PAGE;
                    }
                } else {
                    request.setAttribute("errormessage", "Your account has been banned!");
                    request.getRequestDispatcher("paging").forward(request, response);
                }

            } else {
                request.setAttribute("errormessage", "Please login!");
                request.getRequestDispatcher("paging").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            log("ERROR at WarningMemberServlet: " + e.getMessage());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
