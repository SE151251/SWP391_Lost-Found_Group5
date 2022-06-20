/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fu.entities;

/**
 *
 * @author LENOVO
 */
public class Hashtag {
    private String hashtagID;
    private String hashtagName;

    public Hashtag() {
    }

    public Hashtag(String hashtagID, String hashtagName) {
        this.hashtagID = hashtagID;
        this.hashtagName = hashtagName;
    }

    public String getHashtagID() {
        return hashtagID;
    }

    public void setHashtagID(String hashtagID) {
        this.hashtagID = hashtagID;
    }

    public String getHashtagName() {
        return hashtagName;
    }

    public void setHashtagName(String hashtagName) {
        this.hashtagName = hashtagName;
    }
    
    
}
