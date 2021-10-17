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
import model.User;

/**
 *
 * @author TNC
 */
public class UserDAO {

    public static void main(String[] args) {
        UserDAO dao = new UserDAO();
        User user = dao.login("minhnv", "1234");
        dao.deleteUser("hoangosaka");
        System.out.println(user);
    }

    Connection conn;
    PreparedStatement ps;
    ResultSet rs;

    public ArrayList<User> getAllUser() {
        String query = "select * from [user]";
        try {
            ArrayList<User> list = new ArrayList<>();
            conn = DBContext.getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                User j = new User(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getInt(10),
                        rs.getInt(11),
                        rs.getInt(12)
                );
                list.add(j);
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public User getUser(String user, String pass) {
        String query = "select u.username,u.password,u.email,u.fullname,u.dob,u.gender, u.address,u.phone,u.image,u.roleid,u.locationid,u.majorid,r.name,l.name, m.name from [user] u\n"
                + "join role r on r.id= u.roleid\n"
                + "join location l on l.id= u.locationid\n"
                + "join major m on m.id= u.majorid where username=? and password=?  ";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new User(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getInt(10),
                        rs.getInt(11),
                        rs.getInt(12),
                        rs.getString(13),
                        rs.getString(14),
                        rs.getString(15));
            }
        } catch (Exception e) {
        }
        return null;
    }
//----------------------------------------------------------------------------------------------
    public void deleteUser(String username) {
        String query = "DELETE FROM [user] WHERE username=?";
        deleteWallet(username);
        deleteCV(username);
        deleteJob(username);
        deleteWishlist(username);
        deleteHistory(username);
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ps.executeUpdate();
        } catch (Exception e) {

        }
    }
    
    public void deleteWallet(String username){
        String query="DELETE FROM [wallet] where username=?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ps.executeUpdate();
        } catch (Exception e) {

        }
    }
    public void deleteCV(String username){
        String query="DELETE FROM [cv] where username=?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ps.executeUpdate();
        } catch (Exception e) {

        }
    }
    public void deleteJob(String username){
        String query="DELETE FROM [job] where username=?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ps.executeUpdate();
        } catch (Exception e) {

        }
    }
    public void deleteWishlist(String username){
        String query="DELETE FROM [wishlist] where username=?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ps.executeUpdate();
        } catch (Exception e) {

        }
    }
    public void deleteHistory(String username){
        String query="DELETE FROM [history] where username=?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ps.executeUpdate();
        } catch (Exception e) {

        }
    }
//----------------------------------------------------------------------------------------------    
        

    public void changeUserInfo(String username, String fullname, String dob, int gender, String address, String phone, String image, int locationID, int majorID) {
        String query = " UPDATE [user]\n"
                + "SET fullname = ?, dob= ?,gender=?,address=?,phone=?,image=?,locationid=?,majorid=?\n"
                + "WHERE username = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, fullname);
            ps.setString(2, dob);
            ps.setInt(3, gender);
            ps.setString(4, address);
            ps.setString(5, phone);
            ps.setString(6, image);
            ps.setInt(7, locationID);
            ps.setInt(8, majorID);
            ps.setString(9, username);

            ps.executeUpdate();

        } catch (Exception e) {
        }
    }

    public User login(String user, String pass) {
        String query = "select * from [user] where username=? and password=?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new User(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getInt(10),
                        rs.getInt(11),
                        rs.getInt(12)
                );
            }
        } catch (Exception e) {
        }
        return null;
    }
    public User userByName(String user) {
        String query = "select * from [user] where username=? ";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new User(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getInt(10),
                        rs.getInt(11),
                        rs.getInt(12)
                );
            }
        } catch (Exception e) {
        }
        return null;
    }
    
    public User checkUserExist(String user, String email) {

        String query = "select * from [user] where username = ? or email=?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, email);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new User(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(10));
            }
        } catch (Exception e) {
        }
        return null;

    }

    public void signup(String user, String pass, String email, int role) {
        String query = "insert into [user] (username, password, email, roleid) values (?,?,?,?)";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);
            ps.setString(3, email);
            ps.setInt(4, role);
            ps.executeUpdate();

        } catch (Exception e) {
        }

    }

    public User changePassword(String username, String password) {
        String query = "update [user] set [password] = ? where username=? ";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, password);
            ps.setString(2, username);
            ps.executeUpdate();

        } catch (Exception e) {

        }
        return null;
    }

}
