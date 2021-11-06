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
import model.History;
import model.User;
import model.Wallet;

/**
 *
 * @author TNC
 */
public class WalletDAO {

    Connection conn;
    PreparedStatement ps;
    ResultSet rs;

    public static void main(String[] args) {
        WalletDAO w = new WalletDAO();
        ArrayList<History> x = w.getAllHistory("quangnv");
        for (History h : x) {
            System.out.println(h);
        }
    }
    public void addToHistory(String username,int type,double amount) {
        try {
            
            String sql = "insert into [History] values(?,?,?)";
            conn = DBContext.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setInt(2,type);
            ps.setDouble(3, amount);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(History.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<History> getAllHistory(String username) {
        try {
            ArrayList<History> list = new ArrayList<>();
            String sql = "select * from history where username=? ORDER BY id desc";
            conn = DBContext.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            rs = ps.executeQuery();
            while (rs.next()) {
                History j = new History(rs.getInt(1), rs.getString(2), rs.getInt(3) + "", rs.getDouble(4));
                list.add(j);
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(History.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<History> getAllHistory() {
        try {
            ArrayList<History> list = new ArrayList<>();
            String sql = "select * from history ";
            conn = DBContext.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                History j = new History(rs.getInt(1), rs.getString(2), rs.getInt(3) + "", rs.getDouble(4));
                list.add(j);
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(History.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    public void createWallet(String username){
        String query = "insert into [Wallet] values (?,0) ";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    public Wallet getWallet(String username) {
        String query = "select * from [Wallet] where username=? ";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Wallet(rs.getString(1),
                        rs.getDouble(2)
                );
            }
        } catch (Exception e) {
        }
        return null;
    }
    public void updateWallet(String username, double balance) {
        String query = "Update [Wallet] set balance = ? where username=? ";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setDouble(1,balance);
            ps.setString(2, username);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
}
