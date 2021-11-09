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
import model.CV;

/**
 *
 * @author PC
 */
public class CvDAO {

    Connection conn;
    PreparedStatement pr;
    ResultSet rs;

    
//    Empployee
    public CV UpdateCV(String fullname, String dob, String gender, int locationid, String phone, String contact, int educationid, String school, String experience, String image,int id) {
        try {
            String sql = "update cv set fullname=?, dob=?, gender=?, locationid=?, phone=?, contact=?, educationid=?, school=?, image=?,experience=? where id=?";
            conn = DBContext.getConnection();
            pr = conn.prepareStatement(sql);
            pr.setString(1, fullname);
            pr.setString(2, dob);
            pr.setString(3, gender);
            pr.setInt(4, locationid);
            pr.setString(5, phone);
            pr.setString(6, contact);
            pr.setInt(7, educationid);
            pr.setString(8, school);
            pr.setString(9, image);
            pr.setString(10, experience);
            pr.setInt(11, id);
            pr.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CvDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public CV GetCVByUser(String username) {
        try {
            String sql = "select * from cv join education on educationid= education.id join location on locationid=location.id  where username=?";
            conn = DBContext.getConnection();
            pr = conn.prepareStatement(sql);
            pr.setString(1, username);
            rs=pr.executeQuery();
            while(rs.next()){
                CV c = new CV (rs.getInt(1),rs.getString(3), rs.getString(4), rs.getString(5),rs.getInt(6),rs.getString(7),rs.getString(8),rs.getInt(9),rs.getString(10),rs.getString(11),rs.getString(16),rs.getString(18));
                return c;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CvDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
        public ArrayList<CV> GetCVByUser2(String username,int start, int size) {
        try {
            ArrayList<CV> list = new ArrayList<>();
            String sql = "select * from cv join education on educationid= education.id join location on locationid=location.id  where username=? and jobid is null order by cv.id offset ? rows fetch next ? rows only";
            conn = DBContext.getConnection();
            pr = conn.prepareStatement(sql);
            pr.setString(1, username);
            pr.setInt(2, start);
            pr.setInt(3, size);
            rs=pr.executeQuery();
            while(rs.next()){
                CV c = new CV (rs.getInt(1),rs.getString(3), rs.getString(4), rs.getString(5),rs.getInt(6),rs.getString(7),rs.getString(8),rs.getInt(9),rs.getString(10),rs.getString(11),rs.getString(16),rs.getString(18), rs.getString(15));
                list.add(c);
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(CvDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
        public int getNumberCv2(String username){
          int count =0;
           try {
               String sql = "select count(*) from cv where username=? and jobid is null";
               conn = DBContext.getConnection();
               pr = conn.prepareStatement(sql);
               pr.setString(1, username);
               rs= pr.executeQuery();
               
               while(rs.next()){
                   count= rs.getInt(1);
               }
           } catch (SQLException ex) {
               Logger.getLogger(JobDAO.class.getName()).log(Level.SEVERE, null, ex);
           }
           return count;
      }
    public CV CreateCV(String fullname, String dob, boolean gender, int locationid, String phone, String contact, int educationid, String school, String experience, String username,int statusid, String image, String time) {
        try {
            String sql = "insert into cv(fullname,dob, gender,locationid,phone,contact,educationid,school,experience,username, statusid, image,time)values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
            conn = DBContext.getConnection();
            pr = conn.prepareStatement(sql);
             pr.setString(1, fullname);
            pr.setString(2, dob);
            pr.setBoolean(3, gender);
            pr.setInt(4, locationid);
            pr.setString(5, phone);
            pr.setString(6, contact);
            pr.setInt(7, educationid);
            pr.setString(8, school);
            pr.setString(9, experience);
            pr.setString(10, username);
            pr.setInt(11, statusid);
            pr.setString(12, image);
            pr.setString(13, time);
            pr.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CvDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    public CV SubmitCV(String fullname, String dob, String gender, int locationid, String phone, String contact, int educationid, String school, String experience, String username,int statusid, int jobid){
         try {
            String sql = "insert into cv(fullname,dob, gender,locationid,phone,contact,educationid,school,experience,username, statusid, jobid)values(?,?,?,?,?,?,?,?,?,?,?,?)";
            conn = DBContext.getConnection();
            pr = conn.prepareStatement(sql);
             pr.setString(1, fullname);
            pr.setString(2, dob);
            pr.setString(3, gender);
            pr.setInt(4, locationid);
            pr.setString(5, phone);
            pr.setString(6, contact);
            pr.setInt(7, educationid);
            pr.setString(8, school);
            pr.setString(9, experience);
            pr.setString(10, username);
            pr.setInt(11, statusid);
            pr.setInt(12, jobid);
            pr.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CvDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    public  ArrayList<CV> NotificationForEmployee (String username){
         try {
            ArrayList<CV> list=new ArrayList<>();
            String sql = "select * from cv join status on status.id=statusid join job on job.id=jobid where cv.username=? and statusid=2 or statusid=3";
            conn = DBContext.getConnection();
            pr = conn.prepareStatement(sql);
            pr.setString(1, username);
            rs=pr.executeQuery();
            while(rs.next()){
                CV c = new CV (rs.getInt(13),rs.getString(16),rs.getInt(14),rs.getString(18),rs.getString(19),rs.getString(26),rs.getString(27));
                list.add(c);
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(CvDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    public  ArrayList<CV> NotificationForEmployeePending (String username){
         try {
            ArrayList<CV> list=new ArrayList<>();
            String sql = "select * from cv join status on status.id=statusid join job on job.id=jobid where cv.username=? and statusid=1";
            conn = DBContext.getConnection();
            pr = conn.prepareStatement(sql);
            pr.setString(1, username);
            rs=pr.executeQuery();
            while(rs.next()){
                CV c = new CV (rs.getInt(13),rs.getString(16),rs.getInt(14),rs.getString(18),rs.getString(19),rs.getString(26),rs.getString(27));
                list.add(c);
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(CvDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
     public  ArrayList<CV> NotificationForEmployer (String username){
         try {
            ArrayList<CV> list=new ArrayList<>();
            String sql = "select * from cv join status on status.id=statusid join job on job.id=jobid where job.username=? and statusid=1";
            conn = DBContext.getConnection();
            pr = conn.prepareStatement(sql);
            pr.setString(1, username);
            rs=pr.executeQuery();
            while(rs.next()){
                CV c = new CV (rs.getInt(13),rs.getString(16),rs.getInt(14),rs.getString(18),rs.getString(19),rs.getString(26),rs.getString(27));
                list.add(c);
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(CvDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    //Employer
     public  ArrayList<CV> ListCV (int jobid, int start, int size){
         try {
            ArrayList<CV> list=new ArrayList<>();
            String sql = "select * from cv join status on status.id=statusid join education on educationid= education.id join job on job.id=jobid where jobid=? and statusid=1 order by cv.id offset ? rows fetch next ? rows only";
            conn = DBContext.getConnection();
            pr = conn.prepareStatement(sql);
            pr.setInt(1, jobid);
            pr.setInt(2, start);
            pr.setInt(3, size);
            rs=pr.executeQuery();
            while(rs.next()){
                CV c = new CV (rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(7),rs.getString(18),rs.getString(10),rs.getString(16));
                list.add(c);
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(CvDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
      public int getNumberCv(int jobid){
          int count =0;
           try {
               String sql = "select count(*) from cv join status on status.id=statusid join education on educationid= education.id join job on job.id=jobid where jobid=? and statusid=1";
               conn = DBContext.getConnection();
               pr = conn.prepareStatement(sql);
               pr.setInt(1, jobid);
               rs= pr.executeQuery();
               
               while(rs.next()){
                   count= rs.getInt(1);
               }
           } catch (SQLException ex) {
               Logger.getLogger(JobDAO.class.getName()).log(Level.SEVERE, null, ex);
           }
           return count;
      }
     public CV GetCVById(int id) {
        try {
            String sql = "select * from cv join education on educationid= education.id join location on locationid=location.id  where cv.id=?";
            conn = DBContext.getConnection();
            pr = conn.prepareStatement(sql);
            pr.setInt(1, id);
            rs=pr.executeQuery();
            while(rs.next()){
                CV c = new CV (rs.getInt(1),rs.getString(3), rs.getString(4), rs.getString(5),rs.getInt(6),rs.getString(7),rs.getString(8),rs.getInt(9),rs.getString(10),rs.getString(11),rs.getString(16),rs.getString(18),rs.getString(12));
                return c;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CvDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
     public CV ApproveCV(int id, int statusid) {
        try {
            String sql = "update cv set statusid=? where id=?";
            conn = DBContext.getConnection();
            pr = conn.prepareStatement(sql);
            pr.setInt(1, statusid);
            pr.setInt(2, id);
            pr.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CvDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
     public CV DeleteCV(int jobid){
          try {
            String sql = "delete from cv where jobid=?";
            conn = DBContext.getConnection();
            pr = conn.prepareStatement(sql);
            pr.setInt(1, jobid);
            pr.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CvDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
     }
      public CV checkCVExist(String username) {
        String query = "select * from [CV] where username=? ";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            pr = conn.prepareStatement(query);
            pr.setString(1, username);
            rs = pr.executeQuery();
            while (rs.next()) {
                return new CV(
                        rs.getString(2)
                );
            }
        } catch (Exception e) {
        }
        return null;
    }
}
