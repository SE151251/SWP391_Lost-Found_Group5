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
    private static final String HOME = "paging";

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
                if (member.getMemberRole() == 0) {
                    if (member.getStatus() == 1) {
                        String uId = request.getParameter("uId");
                        String aId = request.getParameter("aId");
                        String adminAction = request.getParameter("adminAction");
                        NotificationDAO ndao = new NotificationDAO();
                        ArticleDAO aDao = new ArticleDAO();
                        MemberDAO mdao = new MemberDAO();
                        ReportDAO rdao = new ReportDAO();
                        // Th??m tr?????ng h???p c???nh c??o b??i vi???t
                        // V???i b??i vi???t b??? c???nh c??o th?? close b??i vi???t ????
                        // V???i member b??? c???nh c??o th?? ch??? thay ?????i count
                        // V???i member b??? Ban th?? ????ng h???t c??c b??i vi???t b??? report
                        // Sau khi x??? l?? 1 report th?? c??c report li??n quan t???i b??i vi???t ???? ?????u ???????c x??? l?? theo 1 l?????t.

                        // Tr?????ng h???p member b??? c???nh c??o
                        if (adminAction.equalsIgnoreCase("flag")) {
                            //Thay ?????i tr???ng th??i warning c???a b??i vi???t
                            aDao.flagArticle(Integer.parseInt(aId));
                            // Thay ?????i h???t tr???ng th??i c???a c??c report li??n quan t???i b??i vi???t
                            rdao.updateStatusReportByArticleID(Integer.parseInt(aId));
                            // Thay ?????i tr???ng th??i b??i vi???t th??nh closed
                            aDao.closeArticle(Integer.parseInt(aId));
                            Article postFlag = aDao.find(Integer.parseInt(aId));
                            String notiContent = "Your post has been FLAGGED by ADMIN";
                            // T???o th??ng b??o
                            ndao.addNewNotifications(new Notification(0, member, postFlag.getMember(), postFlag, notiContent, LocalDateTime.now().toString(), 1));
                            //JavaMailUtil.sendMail(postFlag.getMember().getMemberEmail(), "Your post has been FLAGGED by ADMIN");
                        } else if (adminAction.equalsIgnoreCase("unFlag")) {
                            // Thay ?????i tr???ng th??i warning c???a b??i vi???t
                            aDao.unFlagArticle(Integer.parseInt(aId));
                            //rdao.updateStatusReportByArticleID(Integer.parseInt(aId));
                            // Thay ?????i tr???ng th??i b??i vi???t th??nh open
                            aDao.openArticle(Integer.parseInt(aId));
                            Article postFlag = aDao.find(Integer.parseInt(aId));
                            String notiContent = "Your post has been UNFLAG by ADMIN";
                            // T???o th??ng b??o
                            ndao.addNewNotifications(new Notification(0, member, postFlag.getMember(), postFlag, notiContent, LocalDateTime.now().toString(), 1));
                            //JavaMailUtil.sendMail(postFlag.getMember().getMemberEmail(), "Your post has been UNFLAG by ADMIN");
                        } else if (adminAction.equalsIgnoreCase("warnMember")) {
                            // L???y ra ttin member b??? c???nh c??o
                            Member memberWarn = mdao.find(uId);
                            // C???p nh???t s??? l???n c???nh c??o c???a member b??? c???nh c??o
                            memberWarn.setMemberCount(memberWarn.getMemberCount() + 1);
                            mdao.warningMember(memberWarn);
                            // T???o th??ng b??o
                            String notiContent = "Your account has been WARNED by ADMIN";
                            ndao.addNewNotifications(new Notification(0, member, memberWarn, null, notiContent, LocalDateTime.now().toString(), 1));
                            JavaMailUtil.sendMail(memberWarn.getMemberEmail(), "Your account has been WARNED by ADMIN");
                            url = LIST_MEMBERS_PAGE;

                            // Tr?????ng h???p member b??? ban
                        } else if (adminAction.equalsIgnoreCase("ban")) {
                             // L???y ra ttin member b??? Ban
                            Member memberBan = mdao.find(uId);
                            // C???p nh???t tr???ng th??i account c???a member b??? Ban
                            memberBan.setStatus(0);
                            mdao.banOrUnbanMember(memberBan);

                            // ????ng t???t c??? b??i vi???t b??? report
                            //B1: L???y ra t???t c??? b??i vi???t b??? report c???a member n??y
                            //B2: ?????i all post v???i status th??nh 0 (closed), ?????ng th???i ????ng c??c report li??n quan ?????n t???ng post
                            ArrayList<Integer> list = aDao.getAllArticlesBeReportedOfAMember(memberBan.getMemberID());
                            for (Integer i : list) {
                                aDao.updateStatusArticlesOfMemberBanned(memberBan, i);
                                rdao.updateStatusReportByArticleID(i);
                            }
                            // T???o th??ng b??o khi b??? Ban
                            String notiContent = "Your account has been BANNED by ADMIN";
                            ndao.addNewNotifications(new Notification(0, member, memberBan, null, notiContent, LocalDateTime.now().toString(), 1));
                            JavaMailUtil.sendMail(memberBan.getMemberEmail(), "Your account has been BANNED by ADMIN");
                            url = LIST_MEMBERS_PAGE;

                            // Tr?????ng h???p member b??? t??? c??o kh??ng c?? v???n ????? g??
                        } else if (adminAction.equalsIgnoreCase("none")) {
                            //Thay ?????i tr???ng th??i c???a t???t c??? report v??? b??i vi???t n??y th??nh 0 (t???c l?? ???? x??? l?? all report c???a b??i vi???t)
                            rdao.updateStatusReportByArticleID(Integer.parseInt(aId));                           
                        } else if (adminAction.equalsIgnoreCase("unban")) {
                             // L???y ra ttin member ???????c unBan
                            Member memberBan = mdao.find(uId);
                            // C???p nh???t tr???ng th??i account c???a member ???????c unBan
                            memberBan.setStatus(1);
                            mdao.banOrUnbanMember(memberBan);
                            // T???o th??ng b??o
                            String notiContent = "Your account has been UNLOCKED by ADMIN";
                            ndao.addNewNotifications(new Notification(0, member, memberBan, null, notiContent, LocalDateTime.now().toString(), 1));
                            JavaMailUtil.sendMail(memberBan.getMemberEmail(), "Your account has been UNLOCKED by ADMIN");
                            url = LIST_MEMBERS_PAGE;
                        }
                    } else {
                        request.setAttribute("errormessage", "Your account has been banned! Cannot use this function");
                        //request.getRequestDispatcher("AdminListServlet").forward(request, response);
                        url=ADMIN;
                    }
                } else {
                    request.setAttribute("errormessage", "Incorrect Role! Must be ADMIN");
                    //request.getRequestDispatcher("paging").forward(request, response);
                    url=HOME;
                }

            } else {
                request.setAttribute("errormessage", "Please login!");
                //request.getRequestDispatcher("paging").forward(request, response);
                url=HOME;
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
