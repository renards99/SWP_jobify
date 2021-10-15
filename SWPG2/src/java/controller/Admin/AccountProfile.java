/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.Admin;

import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.User;

/**
 *
 * @author PC
 */
public class AccountProfile extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String username = request.getParameter("username");
        String a="N/A";
        UserDAO dao = new UserDAO();
        User u=dao.userByName(username);
        if (dao.getUser(u.getUsername(), u.getPassword()) != null) {
            u = dao.getUser(u.getUsername(), u.getPassword());
        }

        if (u.getFullname() == null) {
            u.setFullname(a);
        }
        if (u.getDob() == null) {
            u.setDob(a);
        }
        if (u.getAddress() == null) {
            u.setAddress(a);
        }
        if (u.getPhone() == null) {
            u.setPhone(a);
        }
        if (u.getImage() == null||u.getImage().equalsIgnoreCase("image")) {
            u.setImage("https://t3.ftcdn.net/jpg/03/46/83/96/360_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws.jpg");
        }
        switch (u.getRoleID()) {
            case 1: u.setRole("Admin");
                break;
            case 2: u.setRole("Employer");
                break;
            case 3: u.setRole("Employee");
                break;
            default: u.setRole(a);
        }
        if(u.getLocation()==null){
            u.setLocation(a);
        }
        if(u.getMajor()==null){
            u.setMajor(a);
        }
         
        request.setAttribute("profile", u);
        request.getRequestDispatcher("Admin/AccountProfile.jsp").forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
