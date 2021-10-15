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
import model.Education;


/**
 *
 * @author PC
 */
public class EducationDAO {
          Connection conn;
    PreparedStatement pr;
    ResultSet rs;

    public ArrayList<Education> GetAllJobEducation() {
          try {
            ArrayList<Education> list = new ArrayList<>();
            String sql = "select * from Education";
            conn = DBContext.getConnection();
            pr = conn.prepareStatement(sql);
            rs = pr.executeQuery();
            while (rs.next()) {
                Education j = new Education(rs.getInt(1), rs.getString(2));
                list.add(j);
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(Education.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
