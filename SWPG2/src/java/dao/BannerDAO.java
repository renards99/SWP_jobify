/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.Banner;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author PC
 */
public class BannerDAO {
     Connection conn;
    PreparedStatement pr;
    ResultSet rs;
     public Banner DeleteBanner(int jobid){
           try {
            String sql = "delete from banner where jobid=?";
            conn = DBContext.getConnection();
            pr = conn.prepareStatement(sql);
            pr.setInt(1, jobid);
            pr.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(BannerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
      }
}
