/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.Public;

import dao.JobDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Job;
import model.User;

/**
 *
 * @author PC
 */
public class FulltimeJob extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet FulltimeJob</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet FulltimeJob at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        HttpSession session = request.getSession();
        JobDAO jobdao = new JobDAO();
        User user = (User) session.getAttribute("acc");
         int pageSize = 6;
            String index_raw = request.getParameter("page");
            int pageIndex;
            try
            {
                pageIndex = Integer.parseInt(index_raw);
            }
            catch (NumberFormatException e)
            {
                pageIndex = 1;
            }
            int numberOfPage = (jobdao.getNumberRemoteJob(user.getMajorID())- 1) / pageSize + 1;
            if (pageIndex > numberOfPage) pageIndex=numberOfPage;
            ArrayList<Job> fulltimejob = jobdao.FulltimeJob(user.getMajorID(),(pageIndex-1) * pageSize, pageSize);
            
            request.setAttribute("current", pageIndex);
            request.setAttribute("total", numberOfPage);
            request.setAttribute("controller", "remote_job");
            session.setAttribute("fulltimejob", fulltimejob);
            
         request.getRequestDispatcher("Public/FulltimeJob.jsp").forward(request, response);
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
