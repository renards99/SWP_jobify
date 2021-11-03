/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.Employer;

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
public class JobPosted extends HttpServlet {

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
            out.println("<title>Servlet ListPostJob</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ListPostJob at " + request.getContextPath() + "</h1>");
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
        User user = (User) session.getAttribute("acc");
        JobDAO jobdao = new JobDAO();
        
        int pageSize2 = 6;
            String index_raw2 = request.getParameter("page");
            int pageIndex2;
            try
            {
                pageIndex2 = Integer.parseInt(index_raw2);
            }
            catch (NumberFormatException e)
            {
                pageIndex2 = 1;
            }
            int numberOfPage2 = (jobdao.getNumberJobPosted(user.getUsername()) - 1) / pageSize2 + 1;
            if (pageIndex2 > numberOfPage2) pageIndex2=numberOfPage2;
            ArrayList<Job> jobposted = jobdao.JobPosted(user.getUsername(),(pageIndex2-1) * pageSize2, pageSize2);
            
            request.setAttribute("current", pageIndex2);
            request.setAttribute("total", numberOfPage2);
            request.setAttribute("controller", "job_posted");
            
        for (Job job : jobposted) {
            response.getWriter().print(job.getId());
        }
        session.setAttribute("jobposted", jobposted);
        request.getRequestDispatcher("Employer/JobPosted.jsp").forward(request, response);
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
