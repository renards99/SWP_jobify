/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.Public;

import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author PC
 */
public class ChangePassword extends HttpServlet {

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

        String old_password = request.getParameter("old_password");
        String new_password = request.getParameter("new_password");

        String re_new_password = request.getParameter("re_new_password");
        UserDAO dao = new UserDAO();
        User u = (User) session.getAttribute("acc");
        if (!old_password.equals(u.getPassword())) {
            request.setAttribute("message", "<div class=\"alert alert-danger\" role=\"alert\">\n"
                    + "                                <i class=\"far fa-times-circle\"></i>\n"
                    + "                                 old password incorect.\n"
                    + "                            </div>");
            request.getRequestDispatcher("Public/ChangePassword.jsp").forward(request, response);
            return;
        }
        if (old_password.equals(new_password)) {
            request.setAttribute("message", "<div class=\"alert alert-danger\" role=\"alert\">\n"
                    + "                                <i class=\"far fa-times-circle\"></i>\n"
                    + "                                new password must be different to old password.\n"
                    + "                            </div>");
            request.getRequestDispatcher("Public/ChangePassword.jsp").forward(request, response);
            return;
        }
        if (new_password.equals(re_new_password)) {
            session.setAttribute("message_password", "<div class=\"alert alert-success\" role=\"alert\">\n"
                    + "                        password changed successfully.\n"
                   + "                    </div>");

            dao.changePassword(u.getUsername(), new_password);
            u.setPassword(new_password);
            session.setAttribute("acc", u);
            response.sendRedirect("view_profile");
        } else {
            request.setAttribute("message", "<div class=\"alert alert-danger\" role=\"alert\">\n"
                    + "                                <i class=\"far fa-times-circle\"></i>\n"
                    + "                                confirm new password incorect.\n"
                    + "                            </div>");
            request.getRequestDispatcher("Public/ChangePassword.jsp").forward(request, response);
            return;
        }
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
        request.getRequestDispatcher("Public/ChangePassword.jsp").forward(request, response);
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
