/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.Public;

import dao.EducationDAO;
import dao.JobDAO;
import dao.JobTypeDAO;
import dao.LocationDAO;
import dao.MajorDAO;
import dao.SalaryDAO;
import dao.UserDAO;
import dao.WalletDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Education;
import model.History;
import model.Job;
import model.JobType;
import model.Location;
import model.Major;
import model.Salary;
import model.User;

/**
 *
 * @author PC
 */
public class Home extends HttpServlet {

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
            out.println("<title>Servlet Home</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Home at " + request.getContextPath() + "</h1>");
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
        //employee
        LocationDAO locationdao = new LocationDAO();
        MajorDAO majordao = new MajorDAO();
        SalaryDAO salarydao = new SalaryDAO();
        JobTypeDAO jobtypedao = new JobTypeDAO();
        JobDAO jobdao = new JobDAO();
        EducationDAO educationdao = new EducationDAO();
        ArrayList<Location> location = locationdao.GetAllLocation();
        ArrayList<Major> major = majordao.GetAllMajor();
        ArrayList<Education> education = educationdao.GetAllJobEducation();
        ArrayList<Salary> salary = salarydao.GetAllSalary();
        ArrayList<JobType> jobtype = jobtypedao.GetAllJobType();
        ArrayList<Job> remotejob = jobdao.RemoteJob();
        User user = (User) session.getAttribute("acc");
        ArrayList<Job> nearbyjob = jobdao.NearbyJob(user.getLocationID());
        ArrayList<Job> suitablejob = jobdao.SuitableJob(user.getMajorID());

        session.setAttribute("location", location);
        session.setAttribute("salary", salary);
        session.setAttribute("major", major);
        session.setAttribute("jobtype", jobtype);
        session.setAttribute("remotejob", remotejob);
        session.setAttribute("nearbyjob", nearbyjob);
        session.setAttribute("suitablejob", suitablejob);
        session.setAttribute("education", education);
        if (user.getRoleID() == 1) {
            WalletDAO wDAO = new WalletDAO();
            ArrayList<History> h = wDAO.getAllHistory();
            session.setAttribute("transaction_history", h);
        }
        if (user.getFullname() == null || user.getDob() == null || user.getAddress() == null || user.getPhone() == null || user.getLocationID()== 0 || user.getMajorID()== 0) {
            response.sendRedirect("edit_profile");
        } else {
            request.getRequestDispatcher("Public/Home.jsp").forward(request, response);
        }
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
