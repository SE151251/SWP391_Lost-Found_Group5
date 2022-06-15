/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fu.daos;

import fu.dbhelper.DBUtils;
import fu.entities.Article;
import fu.entities.ArticleType;
import fu.entities.Comment;
import fu.entities.Item;
import fu.entities.Member;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author LENOVO
 */
public class CommentDAO {


    public ArrayList<Article> getAllCommentsByArticles(Article a) throws ClassNotFoundException, SQLException, Exception {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        ArrayList<Article> lb = new ArrayList<>();
        try {
            con = DBUtils.makeConnection();
            if (con != null) {
                String sql = "Select * From Comment "
                        + "Where ArticleStatus = 1 and ArticleID Like ? "
                        + "Order By PostTime DESC";
                stm = con.prepareStatement(sql);
                stm.setString(1, a.getArticleID());
                rs = stm.executeQuery();
                while (rs.next()) {
                    String articleId = rs.getString("ArticleID");
                    String title = rs.getString("ArticleTitle");
                    String articleContent = rs.getString("ArticleContent");
                    String articleURL = rs.getString("ImgURL");
                    String articleTime = rs.getString("PostTime");                    
                    int articleStatus = rs.getInt("ArticleStatus");
                    String memberId = rs.getString("MemberID");
                    int articleTypeId = rs.getInt("ArticleTypeID");
                    int itemId = rs.getInt("ItemID");
                    MemberDAO mdao = new MemberDAO();
                    Member m = mdao.find(memberId);
                    ItemTypeDAO idao = new ItemTypeDAO();
                    Item i = idao.getItemByID(itemId);
                    ArticleTypeDAO adao = new ArticleTypeDAO();
                    ArticleType at = adao.getArticleTypeByID(articleTypeId);
                    Article art = new Article(articleId, title, articleContent, articleURL, articleTime, articleStatus, i, m, at);
                    lb.add(art);
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return lb;
    }    

    public boolean addNewComment(Comment b) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBUtils.makeConnection();
            if (con != null) {
                String sql = "INSERT INTO Comment "
                        + "VALUES (?, ?, ?, ?, ?, ?)";
                stm = con.prepareStatement(sql);
                stm.setString(1, b.getArticle().getArticleID());
                stm.setString(2, b.getMember().getMemberID());
                stm.setString(3, b.getCommentContent());
                stm.setString(4, b.getCommentTime().toString());
                stm.setInt(5, 1);               
                int row = stm.executeUpdate();
                if (row > 0) {
                    return true;
                }
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }

    public boolean deleteComment(String aId, String mId)
            throws Exception, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBUtils.makeConnection();
            if (con != null) {
                String sql = "UPDATE Comment "
                        + "SET CommentStatus = 0 "
                        + "Where ArticleID = ? and MemberID = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, aId);
                stm.setString(2, mId);
                int row = stm.executeUpdate();
                if (row > 0) {
                    return true;
                }
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }
}
