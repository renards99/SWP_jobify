/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author PC
 */
public class Wishlist {
    int wishlistID;
    String user;
    int jobid;

  // for wishlist

    public Wishlist(String user, int jobid) {
        this.user = user;
        this.jobid = jobid;
    }
    
    public int getWishlistID() {
        return wishlistID;
    }

    public void setWishlistID(int wishlistID) {
        this.wishlistID = wishlistID;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public int getJobid() {
        return jobid;
    }
    public void setJobid(int jobid) {
        this.jobid = jobid;
    }

   
}