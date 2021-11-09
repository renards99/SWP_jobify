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
public class SearchDAO {

    Connection conn;
    PreparedStatement pr;
    ResultSet rs;

    public ArrayList<Job> searchJob(String input, String location, String specialized, String type, String salaryfrom, String salaryto, int start, int size) {
//        , String location, String specialized, String type, String salaryfrom, String salaryto
        try {
            ArrayList<Job> list = new ArrayList<>();
            if (input != null && location.equals("all") && specialized.equals("all") && type.equals("all") && salaryfrom == null && salaryto == null) {
                String sql = "select * from job join location on location.id= job.locationid join major on major.id=job.majorid join jobtype on jobtype.id= jobtypeid where (job.name like '%" + input + "%' or company like '%" + input + "%') order by job.id offset ? rows fetch next ? rows only";
                conn = DBContext.getConnection();
                pr = conn.prepareStatement(sql);
                pr.setInt(1, start);
                pr.setInt(2, size);
            } else if (input != null && !location.equals("all") && specialized.equals("all") && type.equals("all") && salaryfrom == null && salaryto == null) {
                String sql = "select * from job join location on location.id= job.locationid join major on major.id=job.majorid join jobtype on jobtype.id= jobtypeid where (job.name like '%" + input + "%' or company like '%" + input + "%') and locationid = ? order by job.id offset ? rows fetch next ? rows only";
                conn = DBContext.getConnection();
                pr = conn.prepareStatement(sql);
                pr.setString(1, location);
                pr.setInt(2, start);
                pr.setInt(3, size);
            } else if (input != null && !location.equals("all") && !specialized.equals("all") && type.equals("all") && salaryfrom == null && salaryto == null) {
                String sql = "select * from job join location on location.id= job.locationid join major on major.id=job.majorid join jobtype on jobtype.id= jobtypeid where (job.name like '%" + input + "%' or company like '%" + input + "%') and locationid = ? and job.majorid= ? order by job.id offset ? rows fetch next ? rows only";
                conn = DBContext.getConnection();
                pr = conn.prepareStatement(sql);
                pr.setString(1, location);
                pr.setString(2, specialized);
                pr.setInt(3, start);
                pr.setInt(4, size);
            } else if (input != null && !location.equals("all") && !specialized.equals("all") && !type.equals("all") && salaryfrom == null && salaryto == null) {
                String sql = "select * from job join location on location.id= job.locationid join major on major.id=job.majorid join jobtype on jobtype.id= jobtypeid where (job.name like '%" + input + "%' or company like '%" + input + "%') and locationid = ? and job.majorid= ? and jobtypeid = ? order by job.id offset ? rows fetch next ? rows only";
                conn = DBContext.getConnection();
                pr = conn.prepareStatement(sql);
                pr.setString(1, location);
                pr.setString(2, specialized);
                pr.setString(3, type);
                pr.setInt(4, start);
                pr.setInt(5, size);
            } else if (input != null && !location.equals("all") && !specialized.equals("all") && !type.equals("all") && salaryfrom != null && salaryto != null) {
                String sql = "select * from job join location on location.id= job.locationid join major on major.id=job.majorid join jobtype on jobtype.id= jobtypeid where (job.name like '%" + input + "%' or company like '%" + input + "%') and locationid = ? and job.majorid = ? and jobtypeid = ? and salary >= ? and salary <= ? order by job.id offset ? rows fetch next ? rows only";
                conn = DBContext.getConnection();
                pr = conn.prepareStatement(sql);
                pr.setString(1, location);
                pr.setString(2, specialized);
                pr.setString(3, type);
                pr.setString(4, salaryfrom);
                pr.setString(5, salaryto);
                pr.setInt(6, start);
                pr.setInt(7, size);
            } else if (input != null && location.equals("all") && !specialized.equals("all") && type.equals("all") && salaryfrom == null && salaryto == null) {
                String sql = "select * from job join location on location.id= job.locationid join major on major.id=job.majorid join jobtype on jobtype.id= jobtypeid where (job.name like '%" + input + "%' or company like '%" + input + "%') and job.majorid= ? order by job.id offset ? rows fetch next ? rows only";

                conn = DBContext.getConnection();
                pr = conn.prepareStatement(sql);
                pr.setString(1, specialized);
                pr.setInt(2, start);
                pr.setInt(3, size);

            } else if (input != null && location.equals("all") && specialized.equals("all") && !type.equals("all") && salaryfrom == null && salaryto == null) {
                String sql = "select * from job join location on location.id= job.locationid join major on major.id=job.majorid join jobtype on jobtype.id= jobtypeid where (job.name like '%" + input + "%' or company like '%" + input + "%') and jobtypeid = ? order by job.id offset ? rows fetch next ? rows only";

                conn = DBContext.getConnection();
                pr = conn.prepareStatement(sql);
                pr.setString(1, type);
                pr.setInt(2, start);
                pr.setInt(3, size);

            } else if (input != null && location.equals("all") && specialized.equals("all") && type.equals("all") && salaryfrom != null && salaryto != null) {
                String sql = "select * from job join location on location.id= job.locationid join major on major.id=job.majorid join jobtype on jobtype.id= jobtypeid where (job.name like '%" + input + "%' or company like '%" + input + "%') and salary >= ? and salary <= ? order by job.id offset ? rows fetch next ? rows only";

                conn = DBContext.getConnection();
                pr = conn.prepareStatement(sql);
                pr.setString(1, salaryfrom);
                pr.setString(2, salaryto);
                pr.setInt(3, start);
                pr.setInt(4, size);

            } else if (input != null && !location.equals("all") && specialized.equals("all") && !type.equals("all") && salaryfrom == null && salaryto == null) {
                String sql = "select * from job join location on location.id= job.locationid join major on major.id=job.majorid join jobtype on jobtype.id= jobtypeid where (job.name like '%" + input + "%' or company like '%" + input + "%') and locationid = ?  and jobtypeid = ? order by job.id offset ? rows fetch next ? rows only";

                conn = DBContext.getConnection();
                pr = conn.prepareStatement(sql);
                pr.setString(1, location);
                pr.setString(2, type);
                pr.setInt(3, start);
                pr.setInt(4, size);

            } else if (input != null && !location.equals("all") && specialized.equals("all") && type.equals("all") && salaryfrom != null && salaryto != null) {
                String sql = "select * from job join location on location.id= job.locationid join major on major.id=job.majorid join jobtype on jobtype.id= jobtypeid where (job.name like '%" + input + "%' or company like '%" + input + "%') and locationid = ? and salary >= ? and salary <= ? order by job.id offset ? rows fetch next ? rows only";
                conn = DBContext.getConnection();
                conn = DBContext.getConnection();
                pr = conn.prepareStatement(sql);
                pr.setString(1, location);
                pr.setString(2, salaryfrom);
                pr.setString(3, salaryto);
                pr.setInt(4, start);
                pr.setInt(5, size);
            } else if (input != null && location.equals("all") && !specialized.equals("all") && !type.equals("all") && salaryfrom == null && salaryto == null) {
                String sql = "select * from job join location on location.id= job.locationid join major on major.id=job.majorid join jobtype on jobtype.id= jobtypeid where (job.name  like '%" + input + "%' or company like '%" + input + "%') and job.majorid = ? and jobtypeid = ? order by job.id offset ? rows fetch next ? rows only";
                conn = DBContext.getConnection();
                pr = conn.prepareStatement(sql);
                pr.setString(1, specialized);
                pr.setString(2, type);
                pr.setInt(3, start);
                pr.setInt(4, size);

            } else if (input != null && location.equals("all") && !specialized.equals("all") && type.equals("all") && salaryfrom != null && salaryto != null) {
                String sql = "select * from job join location on location.id= job.locationid join major on major.id=job.majorid join jobtype on jobtype.id= jobtypeid where (job.name like '%" + input + "%' or company like '%" + input + "%')  and job.majorid = ? and salary >= ?and salary <= ? order by job.id offset ? rows fetch next ? rows only";
                conn = DBContext.getConnection();
                conn = DBContext.getConnection();
                pr = conn.prepareStatement(sql);
                pr.setString(1, specialized);
                pr.setString(2, salaryfrom);
                pr.setString(3, salaryto);
                pr.setInt(4, start);
                pr.setInt(5, size);
            } else if (input != null && location.equals("all") && specialized.equals("all") && !type.equals("all") && salaryfrom != null && salaryto != null) {
                String sql = "select * from job join location on location.id= job.locationid join major on major.id=job.majorid join jobtype on jobtype.id= jobtypeid where (job.name like '%" + input + "%' or company like '%" + input + "%')   and jobtypeid = ? and salary >= ? and salary <= ? order by job.id offset ? rows fetch next ? rows only";
                conn = DBContext.getConnection();
                conn = DBContext.getConnection();
                pr = conn.prepareStatement(sql);
                pr.setString(1, type);
                pr.setString(2, salaryfrom);
                pr.setString(3, salaryto);
                pr.setInt(4, start);
                pr.setInt(5, size);
            } else if (input != null && !location.equals("all") && !specialized.equals("all") && type.equals("all") && salaryfrom != null && salaryto != null) {
                String sql = "select * from job join location on location.id= job.locationid join major on major.id=job.majorid join jobtype on jobtype.id= jobtypeid where (job.name like '%" + input + "%' or company like '%" + input + "%') and locationid = ? and job.majorid = ? and salary >= ?and salary <= ? order by job.id offset ? rows fetch next ? rows only";
                conn = DBContext.getConnection();
                pr = conn.prepareStatement(sql);
                pr.setString(1, location);
                pr.setString(2, specialized);
                pr.setString(3, salaryfrom);
                pr.setString(4, salaryto);
                pr.setInt(5, start);
                pr.setInt(6, size);
            } else if (input != null && !location.equals("all") && specialized.equals("all") && !type.equals("all") && salaryfrom != null && salaryto != null) {
                String sql = "select * from job join location on location.id= job.locationid join major on major.id=job.majorid join jobtype on jobtype.id= jobtypeid where (job.name like '%" + input + "%' or company like '%" + input + "%') and locationid = ? and job.majorid = ? and salary >= ? and salary <= ? order by job.id offset ? rows fetch next ? rows only";
                conn = DBContext.getConnection();
                pr = conn.prepareStatement(sql);
                pr.setString(1, location);
                pr.setString(2, type);
                pr.setString(3, salaryfrom);
                pr.setString(4, salaryto);
                pr.setInt(5, start);
                pr.setInt(6, size);
            } else if (input != null && location.equals("all") && !specialized.equals("all") && !type.equals("all") && salaryfrom != null && salaryto != null) {
                String sql = "select * from job join location on location.id= job.locationid join major on major.id=job.majorid join jobtype on jobtype.id= jobtypeid where (job.name like '%" + input + "%' or company like '%" + input + "%') and job.majorid = ? and job.majorid = ? and salary >= ?and salary <= ? order by job.id offset ? rows fetch next ? rows only";
                conn = DBContext.getConnection();
                pr = conn.prepareStatement(sql);
                pr.setString(1, specialized);
                pr.setString(2, type);
                pr.setString(3, salaryfrom);
                pr.setString(4, salaryto);
                pr.setInt(5, start);
                pr.setInt(6, size);
            } else if (input == "" && !location.equals("all") && specialized.equals("all") && type.equals("all") && salaryfrom == null && salaryto == null) {
                String sql = "select * from job join location on location.id= job.locationid join major on major.id=job.majorid join jobtype on jobtype.id= jobtypeid where  locationid= ? order by job.id offset ? rows fetch next ? rows only";
                conn = DBContext.getConnection();
                pr = conn.prepareStatement(sql);
                pr.setString(1, location);
                pr.setInt(2, start);
                pr.setInt(3, size);
            } else if (input == "" && !location.equals("all") && !specialized.equals("all") && type.equals("all") && salaryfrom == null && salaryto == null) {
                String sql = "select * from job join location on location.id= job.locationid join major on major.id=job.majorid join jobtype on jobtype.id= jobtypeid where  locationid= ? and job.majorid = ? order by job.id offset ? rows fetch next ? rows only";
                conn = DBContext.getConnection();
                pr = conn.prepareStatement(sql);
                pr.setString(1, location);
                pr.setString(2, specialized);
                pr.setInt(3, start);
                pr.setInt(4, size);
            } else if (input == "" && !location.equals("all") && specialized.equals("all") && !type.equals("all") && salaryfrom == null && salaryto == null) {
                String sql = "select * from job join location on location.id= job.locationid join major on major.id=job.majorid join jobtype on jobtype.id= jobtypeid where  locationid= ? and jobtypeid = ? order by job.id offset ? rows fetch next ? rows only";
                conn = DBContext.getConnection();
                pr = conn.prepareStatement(sql);
                pr.setString(1, location);
                pr.setString(2, type);
                pr.setInt(3, start);
                pr.setInt(4, size);
            } else if (input == "" && !location.equals("all") && specialized.equals("all") && type.equals("all") && salaryfrom != null && salaryto != null) {
                String sql = "select * from job join location on location.id= job.locationid join major on major.id=job.majorid join jobtype on jobtype.id= jobtypeid where  locationid= ? and salary >= ? and salary <= ? order by job.id offset ? rows fetch next ? rows only";
                conn = DBContext.getConnection();
                pr = conn.prepareStatement(sql);
                pr.setString(1, location);
                pr.setString(2, salaryfrom);
                pr.setString(3, salaryto);
                pr.setInt(4, start);
                pr.setInt(5, size);
            } else if (input == "" && !location.equals("all") && !specialized.equals("all") && !type.equals("all") && salaryfrom == null && salaryto == null) {
                String sql = "sselect * from job join location on location.id= job.locationid join major on major.id=job.majorid join jobtype on jobtype.id= jobtypeid where locationid= ? and job.majorid = ? and jobtypeid = ? order by job.id offset ? rows fetch next ? rows only";
                conn = DBContext.getConnection();
                pr = conn.prepareStatement(sql);
                pr.setString(1, location);
                pr.setString(2, specialized);
                pr.setString(3, type);
                pr.setInt(4, start);
                pr.setInt(5, size);
            } else if (input == "" && !location.equals("all") && !specialized.equals("all") && type.equals("all") && salaryfrom != null && salaryto != null) {
                String sql = "select * from job join location on location.id= job.locationid join major on major.id=job.majorid join jobtype on jobtype.id= jobtypeid where locationid= ? and job.majorid = ? and salary >= ? and salary <= ? order by job.id offset ? rows fetch next ? rows only";
                conn = DBContext.getConnection();
                pr = conn.prepareStatement(sql);
                pr.setString(1, location);
                pr.setString(2, specialized);
                pr.setString(3, salaryfrom);
                pr.setString(4, salaryto);
                pr.setInt(5, start);
                pr.setInt(6, size);
            } else if (input == "" && !location.equals("all") && specialized.equals("all") && !type.equals("all") && salaryfrom != null && salaryto != null) {
                String sql = "select * from job join location on location.id= job.locationid join major on major.id=job.majorid join jobtype on jobtype.id= jobtypeid where  locationid= ? and jobtypeid = ? and salary >= ?and salary <= ? order by job.id offset ? rows fetch next ? rows only";
                conn = DBContext.getConnection();
                pr = conn.prepareStatement(sql);
                pr.setString(1, location);
                pr.setString(2, type);
                pr.setString(3, salaryfrom);
                pr.setString(4, salaryto);
                pr.setInt(5, start);
                pr.setInt(6, size);
            } else if (input == "" && !location.equals("all") && !specialized.equals("all") && !type.equals("all") && salaryfrom != null && salaryto != null) {
                String sql = "select * from job join location on location.id= job.locationid join major on major.id=job.majorid join jobtype on jobtype.id= jobtypeid where  locationid= ? and job.majorid = ?  and jobtypeid = ? and salary >= ? and salary <= ? order by job.id offset ? rows fetch next ? rows only";
                conn = DBContext.getConnection();
                pr = conn.prepareStatement(sql);
                pr.setString(1, location);
                pr.setString(2, specialized);
                pr.setString(3, type);
                pr.setString(4, salaryfrom);
                pr.setString(5, salaryto);
                pr.setInt(6, start);
                pr.setInt(7, size);
            } else if (input == "" && location.equals("all") && !specialized.equals("all") && type.equals("all") && salaryfrom == null && salaryto == null) {
                String sql = "select * from job join location on location.id= job.locationid join major on major.id=job.majorid join jobtype on jobtype.id= jobtypeid where job.majorid = ? order by job.id offset ? rows fetch next ? rows only";
                conn = DBContext.getConnection();
                pr = conn.prepareStatement(sql);
                pr.setString(1, specialized);
                pr.setInt(2, start);
                pr.setInt(3, size);
            } else if (input == "" && location.equals("all") && !specialized.equals("all") && !type.equals("all") && salaryfrom == null && salaryto == null) {
                String sql = "select * from job join location on location.id= job.locationid join major on major.id=job.majorid join jobtype on jobtype.id= jobtypeid where job.majorid = ? and jobtypeid = ? order by job.id offset ? rows fetch next ? rows only";
                conn = DBContext.getConnection();
                pr = conn.prepareStatement(sql);
                pr.setString(1, specialized);
                pr.setString(2, type);
                pr.setInt(3, start);
                pr.setInt(4, size);
            } else if (input == "" && location.equals("all") && !specialized.equals("all") && type.equals("all") && salaryfrom != null && salaryto != null) {
                String sql = "select * from job join location on location.id= job.locationid join major on major.id=job.majorid join jobtype on jobtype.id= jobtypeid where job.majorid = ? and salary >= ? and salary <= ? order by job.id offset ? rows fetch next ? rows only";
                conn = DBContext.getConnection();
                pr = conn.prepareStatement(sql);
                pr.setString(1, specialized);
                pr.setString(2, salaryfrom);
                pr.setString(3, salaryto);
                pr.setInt(4, start);
                pr.setInt(5, size);
            } else if (input == "" && location.equals("all") && !specialized.equals("all") && !type.equals("all") && salaryfrom != null && salaryto != null) {
                String sql = "select * from job join location on location.id= job.locationid join major on major.id=job.majorid join jobtype on jobtype.id= jobtypeid where job.majorid = ? and jobtypeid = ? and salary >= ? and salary <= ? order by job.id offset ? rows fetch next ? rows only";
                conn = DBContext.getConnection();
                pr = conn.prepareStatement(sql);
                pr.setString(1, specialized);
                pr.setString(2, type);
                pr.setString(3, salaryfrom);
                pr.setString(4, salaryto);
                pr.setInt(5, start);
                pr.setInt(6, size);
            } else if (input == "" && location.equals("all") && specialized.equals("all") && !type.equals("all") && salaryfrom == null && salaryto == null) {
                String sql = "select * from job join location on location.id= job.locationid join major on major.id=job.majorid join jobtype on jobtype.id= jobtypeid where jobtypeid = ? order by job.id offset ? rows fetch next ? rows only";
                conn = DBContext.getConnection();
                pr = conn.prepareStatement(sql);
                pr.setString(1, type);
                pr.setInt(2, start);
                pr.setInt(3, size);
            } else if (input == "" && location.equals("all") && specialized.equals("all") && !type.equals("all") && salaryfrom != null && salaryto != null) {
                String sql = "select * from job join location on location.id= job.locationid join major on major.id=job.majorid join jobtype on jobtype.id= jobtypeid where jobtypeid = ? and salary >= ? and salary <= ? order by job.id offset ? rows fetch next ? rows only";
                conn = DBContext.getConnection();
                pr = conn.prepareStatement(sql);
                pr.setString(1, type);
                pr.setString(2, salaryfrom);
                pr.setString(3, salaryto);
                pr.setInt(4, start);
                pr.setInt(5, size);
            } else if (input == "" && location.equals("all") && specialized.equals("all") && type.equals("all") && salaryfrom != null && salaryto != null) {
                String sql = "select * from job join location on location.id= job.locationid join major on major.id=job.majorid join jobtype on jobtype.id= jobtypeid where salary >= ? and salary <= ? order by job.id offset ? rows fetch next ? rows only";
                conn = DBContext.getConnection();
                pr = conn.prepareStatement(sql);
                pr.setString(1, salaryfrom);
                pr.setString(2, salaryto);
                pr.setInt(3, start);
                pr.setInt(4, size);
            }
            rs = pr.executeQuery();
            while (rs.next()) {
                Job j = new Job(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getDouble(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11), rs.getString(12), rs.getString(13), rs.getString(18), rs.getString(20), rs.getString(22));
                list.add(j);
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(Job.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public int numberSearchJob(String input, String location, String specialized, String type, String salaryfrom, String salaryto) {
//        , String location, String specialized, String type, String salaryfrom, String salaryto
        int count = 0;
        try {
            if (input != null && location.equals("all") && specialized.equals("all") && type.equals("all") && salaryfrom == null && salaryto == null) {
                String sql = "select count(*) from job join location on location.id= job.locationid join major on major.id=job.majorid join jobtype on jobtype.id= jobtypeid where (job.name like '%" + input + "%' or company like '%" + input + "%')";
                conn = DBContext.getConnection();
                pr = conn.prepareStatement(sql);
            } else if (input != null && !location.equals("all") && specialized.equals("all") && type.equals("all") && salaryfrom == null && salaryto == null) {
                String sql = "select count(*) from job join location on location.id= job.locationid join major on major.id=job.majorid join jobtype on jobtype.id= jobtypeid where (job.name like '%" + input + "%' or company like '%" + input + "%') and locationid = ?";
                conn = DBContext.getConnection();
                pr = conn.prepareStatement(sql);
                pr.setString(1, location);

            } else if (input != null && !location.equals("all") && !specialized.equals("all") && type.equals("all") && salaryfrom == null && salaryto == null) {
                String sql = "select count(*) from job join location on location.id= job.locationid join major on major.id=job.majorid join jobtype on jobtype.id= jobtypeid where (job.name like '%" + input + "%' or company like '%" + input + "%') and locationid = ? and job.majorid= ?";
                conn = DBContext.getConnection();
                pr = conn.prepareStatement(sql);
                pr.setString(1, location);
                pr.setString(2, specialized);
            } else if (input != null && !location.equals("all") && !specialized.equals("all") && !type.equals("all") && salaryfrom == null && salaryto == null) {
                String sql = "select count(*) from job join location on location.id= job.locationid join major on major.id=job.majorid join jobtype on jobtype.id= jobtypeid where (job.name like '%" + input + "%' or company like '%" + input + "%') and locationid = ? and job.majorid= ? and jobtypeid = ?";
                conn = DBContext.getConnection();
                pr = conn.prepareStatement(sql);
                pr.setString(1, location);
                pr.setString(2, specialized);
                pr.setString(3, type);
            } else if (input != null && !location.equals("all") && !specialized.equals("all") && !type.equals("all") && salaryfrom != null && salaryto != null) {
                String sql = "select count(*) from job join location on location.id= job.locationid join major on major.id=job.majorid join jobtype on jobtype.id= jobtypeid where (job.name like '%" + input + "%' or company like '%" + input + "%') and locationid = ? and job.majorid = ? and jobtypeid = ? and salary >= ? and salary <= ?";
                conn = DBContext.getConnection();
                pr = conn.prepareStatement(sql);
                pr.setString(1, location);
                pr.setString(2, specialized);
                pr.setString(3, type);
                pr.setString(4, salaryfrom);
                pr.setString(5, salaryto);
            } else if (input != null && location.equals("all") && !specialized.equals("all") && type.equals("all") && salaryfrom == null && salaryto == null) {
                String sql = "select count(*) from job join location on location.id= job.locationid join major on major.id=job.majorid join jobtype on jobtype.id= jobtypeid where (job.name like '%" + input + "%' or company like '%" + input + "%') and job.majorid= ?";
                conn = DBContext.getConnection();
                pr = conn.prepareStatement(sql);
                pr.setString(1, specialized);

            } else if (input != null && location.equals("all") && specialized.equals("all") && !type.equals("all") && salaryfrom == null && salaryto == null) {
                String sql = "select count(*) from job join location on location.id= job.locationid join major on major.id=job.majorid join jobtype on jobtype.id= jobtypeid where (job.name like '%" + input + "%' or company like '%" + input + "%') and jobtypeid = ?";
                conn = DBContext.getConnection();
                pr = conn.prepareStatement(sql);
                pr.setString(1, type);
            } else if (input != null && location.equals("all") && specialized.equals("all") && type.equals("all") && salaryfrom != null && salaryto != null) {
                String sql = "select count(*) from job join location on location.id= job.locationid join major on major.id=job.majorid join jobtype on jobtype.id= jobtypeid where (job.name like '%" + input + "%' or company like '%" + input + "%') and salary >= ? and salary <= ?";

                conn = DBContext.getConnection();
                pr = conn.prepareStatement(sql);
                pr.setString(1, salaryfrom);
                pr.setString(2, salaryto);

            } else if (input != null && !location.equals("all") && specialized.equals("all") && !type.equals("all") && salaryfrom == null && salaryto == null) {
                String sql = "select count(*) from job join location on location.id= job.locationid join major on major.id=job.majorid join jobtype on jobtype.id= jobtypeid where (job.name like '%" + input + "%' or company like '%" + input + "%') and locationid = ?  and jobtypeid = ?";

                conn = DBContext.getConnection();
                pr = conn.prepareStatement(sql);
                pr.setString(1, location);
                pr.setString(2, type);

            } else if (input != null && !location.equals("all") && specialized.equals("all") && type.equals("all") && salaryfrom != null && salaryto != null) {
                String sql = "select count(*) from job join location on location.id= job.locationid join major on major.id=job.majorid join jobtype on jobtype.id= jobtypeid where (job.name like '%" + input + "%' or company like '%" + input + "%') and locationid = ? and salary >= ? and salary <= ?";
                conn = DBContext.getConnection();
                conn = DBContext.getConnection();
                pr = conn.prepareStatement(sql);
                pr.setString(1, location);
                pr.setString(2, salaryfrom);
                pr.setString(3, salaryto);
            } else if (input != null && location.equals("all") && !specialized.equals("all") && !type.equals("all") && salaryfrom == null && salaryto == null) {
                String sql = "select count(*) from job join location on location.id= job.locationid join major on major.id=job.majorid join jobtype on jobtype.id= jobtypeid where (job.name  like '%" + input + "%' or company like '%" + input + "%') and job.majorid = ? and jobtypeid = ? ";
                conn = DBContext.getConnection();
                pr = conn.prepareStatement(sql);
                pr.setString(1, specialized);
                pr.setString(2, type);

            } else if (input != null && location.equals("all") && !specialized.equals("all") && type.equals("all") && salaryfrom != null && salaryto != null) {
                String sql = "select count(*) from job join location on location.id= job.locationid join major on major.id=job.majorid join jobtype on jobtype.id= jobtypeid where (job.name like '%" + input + "%' or company like '%" + input + "%')  and job.majorid = ? and salary >= ?and salary <= ?";
                conn = DBContext.getConnection();
                conn = DBContext.getConnection();
                pr = conn.prepareStatement(sql);
                pr.setString(1, specialized);
                pr.setString(2, salaryfrom);
                pr.setString(3, salaryto);
            } else if (input != null && location.equals("all") && specialized.equals("all") && !type.equals("all") && salaryfrom != null && salaryto != null) {
                String sql = "select count(*) from job join location on location.id= job.locationid join major on major.id=job.majorid join jobtype on jobtype.id= jobtypeid where (job.name like '%" + input + "%' or company like '%" + input + "%')   and jobtypeid = ? and salary >= ? and salary <= ?";
                conn = DBContext.getConnection();
                conn = DBContext.getConnection();
                pr = conn.prepareStatement(sql);
                pr.setString(1, type);
                pr.setString(2, salaryfrom);
                pr.setString(3, salaryto);
            } else if (input != null && !location.equals("all") && !specialized.equals("all") && type.equals("all") && salaryfrom != null && salaryto != null) {
                String sql = "select count(*) from job join location on location.id= job.locationid join major on major.id=job.majorid join jobtype on jobtype.id= jobtypeid where (job.name like '%" + input + "%' or company like '%" + input + "%') and locationid = ? and job.majorid = ? and salary >= ?and salary <= ?";
                conn = DBContext.getConnection();
                pr = conn.prepareStatement(sql);
                pr.setString(1, location);
                pr.setString(2, specialized);
                pr.setString(3, salaryfrom);
                pr.setString(4, salaryto);
            } else if (input != null && !location.equals("all") && specialized.equals("all") && !type.equals("all") && salaryfrom != null && salaryto != null) {
                String sql = "select count(*) from job join location on location.id= job.locationid join major on major.id=job.majorid join jobtype on jobtype.id= jobtypeid where (job.name like '%" + input + "%' or company like '%" + input + "%') and locationid = ? and job.majorid = ? and salary >= ? and salary <= ?";
                conn = DBContext.getConnection();
                pr = conn.prepareStatement(sql);
                pr.setString(1, location);
                pr.setString(2, type);
                pr.setString(3, salaryfrom);
                pr.setString(4, salaryto);
            } else if (input != null && location.equals("all") && !specialized.equals("all") && !type.equals("all") && salaryfrom != null && salaryto != null) {
                String sql = "select count(*) from job join location on location.id= job.locationid join major on major.id=job.majorid join jobtype on jobtype.id= jobtypeid where (job.name like '%" + input + "%' or company like '%" + input + "%') and job.majorid = ? and job.majorid = ? and salary >= ?and salary <= ?";
                conn = DBContext.getConnection();
                pr = conn.prepareStatement(sql);
                pr.setString(1, specialized);
                pr.setString(2, type);
                pr.setString(3, salaryfrom);
                pr.setString(4, salaryto);
            } else if (input == "" && !location.equals("all") && specialized.equals("all") && type.equals("all") && salaryfrom == null && salaryto == null) {
                String sql = "select count(*) from job join location on location.id= job.locationid join major on major.id=job.majorid join jobtype on jobtype.id= jobtypeid where  locationid= ?";
                conn = DBContext.getConnection();
                pr = conn.prepareStatement(sql);
                pr.setString(1, location);
            } else if (input == "" && !location.equals("all") && !specialized.equals("all") && type.equals("all") && salaryfrom == null && salaryto == null) {
                String sql = "select count(*) from job join location on location.id= job.locationid join major on major.id=job.majorid join jobtype on jobtype.id= jobtypeid where  locationid= ? and job.majorid = ?";
                conn = DBContext.getConnection();
                pr = conn.prepareStatement(sql);
                pr.setString(1, location);
                pr.setString(2, specialized);
            } else if (input == "" && !location.equals("all") && specialized.equals("all") && !type.equals("all") && salaryfrom == null && salaryto == null) {
                String sql = "select count(*) from job join location on location.id= job.locationid join major on major.id=job.majorid join jobtype on jobtype.id= jobtypeid where  locationid= ? and jobtypeid = ?";
                conn = DBContext.getConnection();
                pr = conn.prepareStatement(sql);
                pr.setString(1, location);
                pr.setString(2, type);
            } else if (input == "" && !location.equals("all") && specialized.equals("all") && type.equals("all") && salaryfrom != null && salaryto != null) {
                String sql = "select count(*) from job join location on location.id= job.locationid join major on major.id=job.majorid join jobtype on jobtype.id= jobtypeid where  locationid= ? and salary >= ? and salary <= ?";
                conn = DBContext.getConnection();
                pr = conn.prepareStatement(sql);
                pr.setString(1, location);
                pr.setString(2, salaryfrom);
                pr.setString(3, salaryto);
            } else if (input == "" && !location.equals("all") && !specialized.equals("all") && !type.equals("all") && salaryfrom == null && salaryto == null) {
                String sql = "sselect count(*) from job join location on location.id= job.locationid join major on major.id=job.majorid join jobtype on jobtype.id= jobtypeid where locationid= ? and job.majorid = ? and jobtypeid = ?";
                conn = DBContext.getConnection();
                pr = conn.prepareStatement(sql);
                pr.setString(1, location);
                pr.setString(2, specialized);
                pr.setString(3, type);
            } else if (input == "" && !location.equals("all") && !specialized.equals("all") && type.equals("all") && salaryfrom != null && salaryto != null) {
                String sql = "select count(*) from job join location on location.id= job.locationid join major on major.id=job.majorid join jobtype on jobtype.id= jobtypeid where locationid= ? and job.majorid = ? and salary >= ? and salary <= ?";
                conn = DBContext.getConnection();
                pr = conn.prepareStatement(sql);
                pr.setString(1, location);
                pr.setString(2, specialized);
                pr.setString(3, salaryfrom);
                pr.setString(4, salaryto);
            } else if (input == "" && !location.equals("all") && specialized.equals("all") && !type.equals("all") && salaryfrom != null && salaryto != null) {
                String sql = "select count(*) from job join location on location.id= job.locationid join major on major.id=job.majorid join jobtype on jobtype.id= jobtypeid where  locationid= ? and jobtypeid = ? and salary >= ?and salary <= ?";
                conn = DBContext.getConnection();
                pr = conn.prepareStatement(sql);
                pr.setString(1, location);
                pr.setString(2, type);
                pr.setString(3, salaryfrom);
                pr.setString(4, salaryto);
            } else if (input == "" && !location.equals("all") && !specialized.equals("all") && !type.equals("all") && salaryfrom != null && salaryto != null) {
                String sql = "select count(*) from job join location on location.id= job.locationid join major on major.id=job.majorid join jobtype on jobtype.id= jobtypeid where  locationid= ? and job.majorid = ?  and jobtypeid = ? and salary >= ? and salary <= ?";
                conn = DBContext.getConnection();
                pr = conn.prepareStatement(sql);
                pr.setString(1, location);
                pr.setString(2, specialized);
                pr.setString(3, type);
                pr.setString(4, salaryfrom);
                pr.setString(5, salaryto);
            } else if (input == "" && location.equals("all") && !specialized.equals("all") && type.equals("all") && salaryfrom == null && salaryto == null) {
                String sql = "select count(*) from job join location on location.id= job.locationid join major on major.id=job.majorid join jobtype on jobtype.id= jobtypeid where job.majorid = ?";
                conn = DBContext.getConnection();
                pr = conn.prepareStatement(sql);
                pr.setString(1, specialized);
            } else if (input == "" && location.equals("all") && !specialized.equals("all") && !type.equals("all") && salaryfrom == null && salaryto == null) {
                String sql = "select count(*) from job join location on location.id= job.locationid join major on major.id=job.majorid join jobtype on jobtype.id= jobtypeid where job.majorid = ? and jobtypeid = ?";
                conn = DBContext.getConnection();
                pr = conn.prepareStatement(sql);
                pr.setString(1, specialized);
                pr.setString(2, type);
            } else if (input == "" && location.equals("all") && !specialized.equals("all") && type.equals("all") && salaryfrom != null && salaryto != null) {
                String sql = "select count(*) from job join location on location.id= job.locationid join major on major.id=job.majorid join jobtype on jobtype.id= jobtypeid where job.majorid = ? and salary >= ? and salary <= ?";
                conn = DBContext.getConnection();
                pr = conn.prepareStatement(sql);
                pr.setString(1, specialized);
                pr.setString(2, salaryfrom);
                pr.setString(3, salaryto);
            } else if (input == "" && location.equals("all") && !specialized.equals("all") && !type.equals("all") && salaryfrom != null && salaryto != null) {
                String sql = "select count(*) from job join location on location.id= job.locationid join major on major.id=job.majorid join jobtype on jobtype.id= jobtypeid where job.majorid = ? and jobtypeid = ? and salary >= ? and salary <= ?";
                conn = DBContext.getConnection();
                pr = conn.prepareStatement(sql);
                pr.setString(1, specialized);
                pr.setString(2, type);
                pr.setString(3, salaryfrom);
                pr.setString(4, salaryto);
            } else if (input == "" && location.equals("all") && specialized.equals("all") && !type.equals("all") && salaryfrom == null && salaryto == null) {
                String sql = "select count(*) from job join location on location.id= job.locationid join major on major.id=job.majorid join jobtype on jobtype.id= jobtypeid where jobtypeid = ?";
                conn = DBContext.getConnection();
                pr = conn.prepareStatement(sql);
                pr.setString(1, type);
            } else if (input == "" && location.equals("all") && specialized.equals("all") && !type.equals("all") && salaryfrom != null && salaryto != null) {
                String sql = "select count(*) from job join location on location.id= job.locationid join major on major.id=job.majorid join jobtype on jobtype.id= jobtypeid where jobtypeid = ? and salary >= ? and salary <= ?";
                conn = DBContext.getConnection();
                pr = conn.prepareStatement(sql);
                pr.setString(1, type);
                pr.setString(2, salaryfrom);
                pr.setString(3, salaryto);
            } else if (input == "" && location.equals("all") && specialized.equals("all") && type.equals("all") && salaryfrom != null && salaryto != null) {
                String sql = "select count(*) from job join location on location.id= job.locationid join major on major.id=job.majorid join jobtype on jobtype.id= jobtypeid where salary >= ? and salary <= ?";
                conn = DBContext.getConnection();
                pr = conn.prepareStatement(sql);
                pr.setString(1, salaryfrom);
                pr.setString(2, salaryto);
            }
            rs = pr.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Job.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }
}
