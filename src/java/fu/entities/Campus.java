/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fu.entities;

import java.io.Serializable;

/**
 *
 * @author Admin
 */
public class Campus implements Serializable {
    private int campusID;
    private String campusName;

    public Campus() {
        campusID=1;
        campusName="";
    }

    public Campus(int campusID, String campusName) {
        this.campusID = campusID;
        this.campusName = campusName;
    }

    public int getCampusID() {
        return campusID;
    }

    public void setCampusID(int campusID) {
        this.campusID = campusID;
    }

    public String getCampusName() {
        return campusName;
    }

    public void setCampusName(String campusName) {
        this.campusName = campusName;
    }
    
    
    
}
