/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.Public;

import dao.MajorDAO;
import dao.LocationDAO;
import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Location;
import model.Major;
import model.User;

/**
 *
 * @author PC
 */
public class EditProfile extends HttpServlet {

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
        HttpSession session = request.getSession();
        User u=(User) session.getAttribute("acc");
        
        String username=u.getUsername();
        String fullname= request.getParameter("fullname");
        String dob =request.getParameter("dob");
        String gender=request.getParameter("gender");   
        String address=request.getParameter("address");
        String location=request.getParameter("location");
        String phone=request.getParameter("phone");
        String major=request.getParameter("major");
        String image=request.getParameter("image");
        
        UserDAO udao=new UserDAO();
        udao.changeUserInfo(username, fullname, dob, Integer.parseInt(gender), address, phone, image, Integer.parseInt(location), Integer.parseInt(major));
        
         session.setAttribute("edit_profile_message", "<div class=\"alert alert-warning alert-dismissible fade show\" role=\"alert\" id=\"alertID\">\n"
                + "            <strong>edit profile successfully</strong> \n"
                + "            <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"alert\" aria-label=\"Close\"></button>\n"
                + "        </div>");
        session.setAttribute("acc", udao.login(username, u.getPassword())); 
        response.sendRedirect("view_profile");
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
        LocationDAO ldao = new LocationDAO();
        MajorDAO mdao = new MajorDAO();
        ArrayList<Location> l = ldao.GetAllLocation();
        ArrayList<Major>m=mdao.GetAllMajor();
        request.setAttribute("location", l);
        request.setAttribute("major", m);
        request.getRequestDispatcher("Public/EditProfile.jsp").forward(request, response);
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
