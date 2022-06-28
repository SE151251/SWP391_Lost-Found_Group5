/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fu.daos;

import fu.dbhelper.DBUtils;
import fu.entities.Comment;
import fu.entities.Hashtag;
import fu.entities.Item;
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
public class HashtagDAO {
    private Connection con;
    private PreparedStatement preStm;
    private ResultSet rs;


    public HashtagDAO() {
        
    }
    
    private void closeConnection() throws Exception{
        if(rs!=null){
            rs.close();
        }
        if(preStm!=null){
            preStm.close();
        }
        if(con!=null){
            con.close();
        }
    }
    public Hashtag getHashtagByName(String name) throws Exception{
     Hashtag result = null;
        try {
            con = DBUtils.makeConnection();
            if(con!=null){
            String sql = "Select * From Hashtag Where HashtagName like ?";
            preStm = con.prepareStatement(sql);
            preStm.setString(1, name);
            rs = preStm.executeQuery();
            if(rs.next()){
                String hId = rs.getString("HashtagID");
                String hName = rs.getString("HashtagName");                           
                result = new Hashtag(hId, hName);
                }
            }
        } finally {
            closeConnection();
        }
        return result;
    }
    public Hashtag getHashtagById(String id) throws Exception{
     Hashtag result = null;
        try {
            con = DBUtils.makeConnection();
            if(con!=null){
            String sql = "Select * From Hashtag Where HashtagID like ?";
            preStm = con.prepareStatement(sql);
            preStm.setString(1, id);
            rs = preStm.executeQuery();
            if(rs.next()){
                String hId = rs.getString("HashtagID");
                String hName = rs.getString("HashtagName");                           
                result = new Hashtag(hId, hName);
                }
            }
        } finally {
            closeConnection();
        }
        return result;
    }
    
    public List<Hashtag> getAllHashtag() throws Exception{
        List<Hashtag> result = null;
        try {         
            con = DBUtils.makeConnection();
            if(con!=null){
                String sql = "Select * From Hashtag";          
            preStm = con.prepareStatement(sql);
            rs = preStm.executeQuery(); 
            result = new ArrayList<>();
            while (rs.next()){
                String hId = rs.getString("HashtagID");
                String hName = rs.getString("HashtagName");    
                Hashtag h = new Hashtag(hId, hName);
                result.add(h);
               }
            }
        } finally {
            closeConnection();
        }
        return result;
    }
    public List<Hashtag> getAllHashtagByArticleID(String aId) throws Exception{
        List<Hashtag> result = null;
        try {         
            con = DBUtils.makeConnection();
            if(con!=null){
                String sql = "select H.HashtagID, H.HashtagName \n" +
                            "from Article A inner join ArticleHashtag AH on A.ArticleID = AH.ArticleID\n" +
                            "inner join Hashtag H on AH.HashtagID = H.HashtagID\n" +
                            "where A.ArticleID = ?";          
            preStm = con.prepareStatement(sql);
            preStm.setString(1, aId);
            rs = preStm.executeQuery(); 
            result = new ArrayList<>();
            while (rs.next()){
                String hId = rs.getString("HashtagID");
                String hName = rs.getString("HashtagName");    
                Hashtag h = new Hashtag(hId, hName);
                result.add(h);
               }
            }
        } finally {
            closeConnection();
        }
        return result;
    }
    public boolean addNewHashtag(Hashtag h) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBUtils.makeConnection();
            if (con != null) {
                String sql = "INSERT INTO Hashtag "
                        + "VALUES (?, ?)";
                stm = con.prepareStatement(sql);
                stm.setString(1, h.getHashtagID());
                stm.setString(2, h.getHashtagName());                
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
