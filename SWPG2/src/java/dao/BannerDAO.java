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
import java.util.ArrayList;
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

    public Banner DeleteBanner(int jobid) {
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

    public Banner submitBanner(int jobid, int statusid, String image) {
        try {
            String sql = "insert into Banner(jobid, statusid, image) values (?,?,?)";
            conn = DBContext.getConnection();
            pr = conn.prepareStatement(sql);
            pr.setInt(1, jobid);
            pr.setInt(2, statusid);
            pr.setString(3, image);
            pr.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(BannerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Banner> listBanner(int start, int size) {
        try {
            ArrayList<Banner> list = new ArrayList<>();
            String sql = "select * from banner join job on jobid=job.id join status on statusid= status.id  join Location on job.locationid= Location.id join Major on job.majorid= Major.id join Jobtype on job.jobtypeid= Jobtype.id where statusid =1 order by banner.id offset ? rows fetch next ? rows only ";
            conn = DBContext.getConnection();
            pr = conn.prepareStatement(sql);
            pr.setInt(1, start);
            pr.setInt(2, size);
            rs = pr.executeQuery();
            while (rs.next()) {
                Banner b = new Banner(rs.getInt(1), rs.getString(4), rs.getString(5), rs.getString(23), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getDouble(11), rs.getString(12), rs.getString(13), rs.getString(14), rs.getString(15), rs.getString(16), rs.getString(17), rs.getString(18), rs.getString(25), rs.getString(27), rs.getString(29), rs.getInt(2));
                list.add(b);
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(BannerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
     public ArrayList<Banner> listBanner2() {
        try {
            ArrayList<Banner> list = new ArrayList<>();
            String sql = "select * from banner join job on jobid=job.id join status on statusid= status.id  join Location on job.locationid= Location.id join Major on job.majorid= Major.id join Jobtype on job.jobtypeid= Jobtype.id where statusid=2 ";
            conn = DBContext.getConnection();
            pr = conn.prepareStatement(sql);
            rs = pr.executeQuery();
            while (rs.next()) {
                Banner b = new Banner(rs.getInt(1), rs.getString(4), rs.getString(5), rs.getString(23), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getDouble(11), rs.getString(12), rs.getString(13), rs.getString(14), rs.getString(15), rs.getString(16), rs.getString(17), rs.getString(18), rs.getString(25), rs.getString(27), rs.getString(29), rs.getInt(2));
                list.add(b);
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(BannerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public int numberBanner() {
        int count = 0;
        try {
            String sql = "select count (*) from banner where statusid= 1";
            conn = DBContext.getConnection();
            pr = conn.prepareStatement(sql);
            rs = pr.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(BannerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    public Banner getBannerById(int id) {
        try {
            String sql = "select * from banner join job on jobid=job.id join status on statusid= status.id  join Location on job.locationid= Location.id join Major on job.majorid= Major.id join Jobtype on job.jobtypeid= Jobtype.id where banner.id = ?";
            conn = DBContext.getConnection();
            pr = conn.prepareStatement(sql);
            pr.setInt(1, id);
            rs = pr.executeQuery();
            while (rs.next()) {
                Banner b = new Banner(rs.getInt(1), rs.getString(4), rs.getString(5), rs.getString(23), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getDouble(11), rs.getString(12), rs.getString(13), rs.getString(14), rs.getString(15), rs.getString(16), rs.getString(17), rs.getString(18), rs.getString(25), rs.getString(27), rs.getString(29), rs.getInt(2));
                return b;
            }
        } catch (SQLException ex) {
            Logger.getLogger(BannerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    public Banner AcceptBanner(int statusid, String time, int id){
        try {
            String sql = "update banner set statusid=?, expired=? where id=? ";
            conn = DBContext.getConnection();
            pr = conn.prepareStatement(sql);
            pr.setInt(1, statusid);
            pr.setString(2, time);
            pr.setInt(3, id);
            pr.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(BannerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
     public Banner DeclineBanner(int statusid, int id){
        try {
            String sql = "update banner set statusid=? where id=? ";
            conn = DBContext.getConnection();
            pr = conn.prepareStatement(sql);
            pr.setInt(1, statusid);
            pr.setInt(2, id);
            pr.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(BannerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
}
