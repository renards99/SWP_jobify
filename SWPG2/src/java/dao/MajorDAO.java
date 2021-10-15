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
import model.Major;

/**
 *
 * @author PC
 */
public class MajorDAO {
       Connection conn;
    PreparedStatement pr;
    ResultSet rs;

    public ArrayList<Major> GetAllMajor() {
          try {
            ArrayList<Major> list = new ArrayList<>();
            String sql = "select * from major";
            conn = DBContext.getConnection();
            pr = conn.prepareStatement(sql);
            rs = pr.executeQuery();
            while (rs.next()) {
                Major j = new Major(rs.getInt(1), rs.getString(2));
                list.add(j);
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(Major.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
