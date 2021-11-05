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

/**
 *
 * @author PC
 */
public class JobDAO {
       Connection conn;
    PreparedStatement pr;
    ResultSet rs;

    public ArrayList<Job> RemoteJob(int start, int size) {
          try {
            ArrayList<Job> list = new ArrayList<>();
            String sql = "select * from job join location on location.id= job.locationid join major on major.id=job.majorid join jobtype on jobtype.id= jobtypeid where jobtypeid= 3 order by job.id offset ? rows fetch next ? rows only";
            conn = DBContext.getConnection();
            pr = conn.prepareStatement(sql);
            pr.setInt(1, start);
            pr.setInt(2, size);
            rs = pr.executeQuery();
            while (rs.next()) {
                Job j = new Job(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),rs.getString(5),rs.getDouble(6),rs.getString(7),rs.getString(8),rs.getString(9),rs.getString(10),rs.getString(11),rs.getString(12),rs.getString(13),rs.getString(18),rs.getString(20),rs.getString(22));
                list.add(j);
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(Job.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    public int getNumberRemoteJob(){
          int count =0;
           try {
               String sql = "select count(*) from job where jobtypeid= 3";
               conn = DBContext.getConnection();
               pr = conn.prepareStatement(sql);
               rs= pr.executeQuery();
               
               while(rs.next()){
                   count= rs.getInt(1);
               }
           } catch (SQLException ex) {
               Logger.getLogger(JobDAO.class.getName()).log(Level.SEVERE, null, ex);
           }
           return count;
      }
      public ArrayList<Job> NearbyJob(int location,int start, int size) {
          try {
            ArrayList<Job> list = new ArrayList<>();
                String sql = "select * from job join location on location.id= job.locationid join major on major.id=job.majorid join jobtype on jobtype.id= jobtypeid where locationid= ? order by job.id offset ? rows fetch next ? rows only";
            conn = DBContext.getConnection();
            pr = conn.prepareStatement(sql);
            pr.setInt(1, location);
            pr.setInt(2, start);
            pr.setInt(3, size);
            rs = pr.executeQuery();
            while (rs.next()) {
                Job j = new Job(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),rs.getString(5),rs.getDouble(6),rs.getString(7),rs.getString(8),rs.getString(9),rs.getString(10),rs.getString(11),rs.getString(12),rs.getString(13),rs.getString(18),rs.getString(20),rs.getString(22));
                list.add(j);
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(Job.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
      public int getNumberNearbyJob(int location){
          int count =0;
           try {
               String sql = "select count(*) from job where locationid= ?";
               conn = DBContext.getConnection();
               pr = conn.prepareStatement(sql);
               pr.setInt(1, location);
               rs= pr.executeQuery();
               
               while(rs.next()){
                   count= rs.getInt(1);
               }
           } catch (SQLException ex) {
               Logger.getLogger(JobDAO.class.getName()).log(Level.SEVERE, null, ex);
           }
           return count;
      }
      public ArrayList<Job> SuitableJob(int major,int start, int size) {
          try {
            ArrayList<Job> list = new ArrayList<>();
            String sql = "select * from job join location on location.id= job.locationid join major on major.id=job.majorid join jobtype on jobtype.id= jobtypeid where majorid= ? order by job.id offset ? rows fetch next ? rows only";
            conn = DBContext.getConnection();
            pr = conn.prepareStatement(sql);
            pr.setInt(1, major);
            pr.setInt(2, start);
            pr.setInt(3, size);
            rs = pr.executeQuery();
            while (rs.next()) {
                Job j = new Job(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),rs.getString(5),rs.getDouble(6),rs.getString(7),rs.getString(8),rs.getString(9),rs.getString(10),rs.getString(11),rs.getString(12),rs.getString(13),rs.getString(18),rs.getString(20),rs.getString(22));
                list.add(j);
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(Job.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
       public int getNumberSuitableJob(int major){
          int count =0;
           try {
               String sql = "select count(*) from job where where majorid= ?";
               conn = DBContext.getConnection();
               pr = conn.prepareStatement(sql);
               pr.setInt(1, major);
               rs= pr.executeQuery();
               
               while(rs.next()){
                   count= rs.getInt(1);
               }
           } catch (SQLException ex) {
               Logger.getLogger(JobDAO.class.getName()).log(Level.SEVERE, null, ex);
           }
           return count;
      }
      public Job GetJobById(int id){
           try {
               String sql = "select * from job join location on location.id= job.locationid join major on major.id=job.majorid join jobtype on jobtype.id= jobtypeid where job.id=?";
               conn= DBContext.getConnection();
               pr= conn.prepareStatement(sql);
               pr.setInt(1, id);
               rs=pr.executeQuery();
               while (rs.next()) {
                   Job j = new Job(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),rs.getString(5),rs.getDouble(6),rs.getString(7),rs.getString(8),rs.getString(9),rs.getString(10),rs.getString(11),rs.getString(12),rs.getString(13),rs.getString(18),rs.getString(20),rs.getString(22));
                   return j;
               }
               
           } catch (SQLException ex) {
               Logger.getLogger(JobDAO.class.getName()).log(Level.SEVERE, null, ex);
           }
           return null;
      }
      public ArrayList<Job> JobPosted(String username,int start, int size) {
          try {
            ArrayList<Job> list = new ArrayList<>();
                String sql = "select * from job join location on location.id= job.locationid join major on major.id=job.majorid join jobtype on jobtype.id= jobtypeid where username= ? order by job.id offset ? rows fetch next ? rows only";
            conn = DBContext.getConnection();
            pr = conn.prepareStatement(sql);
            pr.setString(1, username);
            pr.setInt(2, start);
            pr.setInt(3, size);
            rs = pr.executeQuery();
            while (rs.next()) {
                Job j = new Job(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),rs.getString(5),rs.getDouble(6),rs.getString(7),rs.getString(8),rs.getString(9),rs.getString(10),rs.getString(11),rs.getString(12),rs.getString(13),rs.getString(18),rs.getString(20),rs.getString(22));
                list.add(j);
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(Job.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
      public int getNumberJobPosted(String username){
          int count =0;
           try {
               String sql = "select count(*) from job where username= ?";
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
      public Job DeleteJob(int id){
           try {
            String sql = "delete from job where id=?";
            conn = DBContext.getConnection();
            pr = conn.prepareStatement(sql);
            pr.setInt(1, id);
            pr.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(JobDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
      }
      public Job CreateJob(String name,String company, String website,String address,String salary,String description,String requirement,String email,String phone,String image,String username,int locationid, int majorid, int jobtypeid, String time) {
        try {
            String sql = "insert into job(name,company, website,address,salary,description,requirement,email,phone,image,username, locationid, majorid, jobtypeid, time)values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            conn = DBContext.getConnection();
            pr = conn.prepareStatement(sql);
             pr.setString(1, name);
            pr.setString(2, company);
            pr.setString(3, website);
            pr.setString(4, address);
            pr.setString(5, salary);
            pr.setString(6, description);
            pr.setString(7, requirement);
            pr.setString(8, email);
            pr.setString(9, phone);
            pr.setString(10, image);
            pr.setString(11, username);
            pr.setInt(12, locationid);
            pr.setInt(13, majorid);
            pr.setInt(14, jobtypeid);
            pr.setString(15, time);
            pr.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CvDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
