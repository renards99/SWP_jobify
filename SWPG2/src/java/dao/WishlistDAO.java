/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Job;
import model.Wishlist;

/**
 *
 * @author PC
 */
public class WishlistDAO {
    Connection conn;
    PreparedStatement pr;
    ResultSet rs;
    
    public Wishlist AddWishlist(String username, int jobid){
        try {
            String sql = "insert into wishlist(username, jobid) values (?,?)";
            conn= DBContext.getConnection();
            pr= conn.prepareStatement(sql);
            pr.setString(1, username);
            pr.setInt(2, jobid);
            pr.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(WishlistDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    public ArrayList<Job> GetAllWishlist(String username){
        try {
            ArrayList<Job> list = new ArrayList<>();
            String sql = "select * from wishlist join job on job.id=jobid join location on location.id= job.locationid join major on major.id=job.majorid join jobtype on jobtype.id= jobtypeid where wishlist.username= ?";
            conn = DBContext.getConnection();
            pr = conn.prepareStatement(sql);
            pr.setString(1, username);
            rs = pr.executeQuery();
            while (rs.next()) {
                Job j = new Job(rs.getInt(4), rs.getString(5), rs.getString(6), rs.getString(7),rs.getString(8),rs.getDouble(9),rs.getString(10),rs.getString(11),rs.getString(12),rs.getString(13),rs.getString(14),rs.getString(15),rs.getString(16),rs.getString(21),rs.getString(23),rs.getString(25));
                list.add(j);
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(Job.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
     public Wishlist DeleteWishlist(int jobid){
           try {
            String sql = "delete from wishlist where jobid=?";
            conn = DBContext.getConnection();
            pr = conn.prepareStatement(sql);
            pr.setInt(1, jobid);
            pr.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(WishlistDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
      }
}
