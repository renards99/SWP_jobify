/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.Public;

import dao.UserDAO;
import dao.WalletDAO;
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
public class Register extends HttpServlet {

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
        String user = request.getParameter("username");
        String pass = request.getParameter("password");
        String re_pass = request.getParameter("password2");
        String email = request.getParameter("email");
        int role;
        if ("employee".equalsIgnoreCase(request.getParameter("myRadio"))) {
            role = 3;
        } else {
            role = 2;
        }

        if (!pass.equals(re_pass)) {
            request.setAttribute("message", "<div class=\"alert alert-danger\" role=\"alert\">\n"
                    + "                                <i class=\"far fa-times-circle\"></i>\n"
                    + "                                Your password and confirmation password do not match.\n"
                    + "                            </div>");
            request.getRequestDispatcher("Public/Register.jsp").forward(request, response);
        } else {
            UserDAO dao = new UserDAO();
            User a = dao.checkUserExist(user, email);
            if (a == null) {
                //sign up
                dao.signup(user, pass, email, role);
                //initiate wallet
                if (role == 2) {
                    WalletDAO wDAO = new WalletDAO();
                    wDAO.createWallet(user);
                }
                
                response.sendRedirect("login");
            } else {
                request.setAttribute("message", "<div class=\"alert alert-danger\" role=\"alert\">\n"
                        + "                                <i class=\"far fa-times-circle\"></i>\n"
                        + "                               username or email already existed.\n"
                        + "                            </div>");
                request.getRequestDispatcher("Public/Register.jsp").forward(request, response);
            }
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
        request.getRequestDispatcher("Public/Register.jsp").forward(request, response);
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
