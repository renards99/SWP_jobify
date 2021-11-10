/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.Public;

import dao.JobDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.SearchDAO;
import java.util.ArrayList;
import javax.servlet.http.HttpSession;
import model.Job;

/**
 *
 * @author PC
 */
public class SearchJob extends HttpServlet {

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
            out.println("<title>Servlet SearchJob</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SearchJob at " + request.getContextPath() + "</h1>");
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
        String search = (String)session.getAttribute("search2");
        String location = (String)session.getAttribute("location2");
        String specialized = (String)session.getAttribute("specialized2");
        String type = (String)session.getAttribute("type2");
        String salary = (String)session.getAttribute("salary2");
        SearchDAO jdao = new SearchDAO();

        int pageSize = 6;
        String index_raw = request.getParameter("page");
        int pageIndex;
        try {
            pageIndex = Integer.parseInt(index_raw);
        } catch (NumberFormatException e) {
            pageIndex = 1;
        }
        int numberOfPage = (jdao.numberSearchJob(search, location, specialized, type, null, null)- 1) / pageSize + 1;
        if (salary.equals("1")) {
           numberOfPage = (jdao.numberSearchJob(search, location, specialized, type, "0", "500")- 1) / pageSize + 1;
        } else if (salary.equals("2")) {
            numberOfPage = (jdao.numberSearchJob(search, location, specialized, type, "500", "1000")- 1) / pageSize + 1;
        } else if (salary.equals("3")) {
            numberOfPage = (jdao.numberSearchJob(search, location, specialized, type, "1000", "1500")- 1) / pageSize + 1;
        } else if (salary.equals("4")) {
            numberOfPage = (jdao.numberSearchJob(search, location, specialized, type, "1500", "10000")- 1) / pageSize + 1;
        }
//        response.getWriter().print(jdao.numberSearchJob(search, location, specialized, type, null, null));
        if (pageIndex > numberOfPage) {
            pageIndex = numberOfPage;
        }
        ArrayList<Job> searchjob = jdao.searchJob(search, location, specialized, type, null, null,(pageIndex - 1) * pageSize, pageSize);

        if (salary.equals("1")) {
             searchjob = jdao.searchJob(search, location, specialized, type, "0", "500",(pageIndex - 1) * pageSize, pageSize);
        } else if (salary.equals("2")) {
            searchjob = jdao.searchJob(search, location, specialized, type,  "500", "1000",(pageIndex - 1) * pageSize, pageSize);
        } else if (salary.equals("3")) {
             searchjob = jdao.searchJob(search, location, specialized, type, "1000", "1500",(pageIndex - 1) * pageSize, pageSize);
        } else if (salary.equals("4")) {
             searchjob = jdao.searchJob(search, location, specialized, type, "1500", "10000",(pageIndex - 1) * pageSize, pageSize);
        }
        response.getWriter().print(searchjob.size());
        request.setAttribute("current", pageIndex);
        request.setAttribute("total", numberOfPage);
        request.setAttribute("controller", "search_job");

        session.setAttribute("search2", search);
        session.setAttribute("location2", location);
        session.setAttribute("specialized2", specialized);
        session.setAttribute("type2", type);
        session.setAttribute("salary2", salary);
        session.setAttribute("searchjob", searchjob);
        request.getRequestDispatcher("Public/SearchJob.jsp").forward(request, response);
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
        HttpSession session = request.getSession();
        String search = request.getParameter("search");
        String location = request.getParameter("location");
        String specialized = request.getParameter("specialized");
        String type = request.getParameter("type");
        String salary = request.getParameter("salary");
        SearchDAO jdao = new SearchDAO();

        int pageSize = 6;
        String index_raw = request.getParameter("page");
        int pageIndex;
        try {
            pageIndex = Integer.parseInt(index_raw);
        } catch (NumberFormatException e) {
            pageIndex = 1;
        }
        int numberOfPage = (jdao.numberSearchJob(search, location, specialized, type, null, null)- 1) / pageSize + 1;
        if (salary.equals("1")) {
           numberOfPage = (jdao.numberSearchJob(search, location, specialized, type, "0", "500")- 1) / pageSize + 1;
        } else if (salary.equals("2")) {
            numberOfPage = (jdao.numberSearchJob(search, location, specialized, type, "500", "1000")- 1) / pageSize + 1;
        } else if (salary.equals("3")) {
            numberOfPage = (jdao.numberSearchJob(search, location, specialized, type, "1000", "1500")- 1) / pageSize + 1;
        } else if (salary.equals("4")) {
            numberOfPage = (jdao.numberSearchJob(search, location, specialized, type, "1500", "10000")- 1) / pageSize + 1;
        }
        if (pageIndex > numberOfPage) {
            pageIndex = numberOfPage;
        }
        ArrayList<Job> searchjob = jdao.searchJob(search, location, specialized, type, null, null,(pageIndex - 1) * pageSize, pageSize);

        if (salary.equals("1")) {
             searchjob = jdao.searchJob(search, location, specialized, type, "0", "500",(pageIndex - 1) * pageSize, pageSize);
        } else if (salary.equals("2")) {
            searchjob = jdao.searchJob(search, location, specialized, type,  "500", "1000",(pageIndex - 1) * pageSize, pageSize);
        } else if (salary.equals("3")) {
             searchjob = jdao.searchJob(search, location, specialized, type, "1000", "1500",(pageIndex - 1) * pageSize, pageSize);
        } else if (salary.equals("4")) {
             searchjob = jdao.searchJob(search, location, specialized, type, "1500", "10000",(pageIndex - 1) * pageSize, pageSize);
        }
        request.setAttribute("current", pageIndex);
        request.setAttribute("total", numberOfPage);
        request.setAttribute("controller", "search_job");

        session.setAttribute("search2", search);
        session.setAttribute("location2", location);
        session.setAttribute("specialized2", specialized);
        session.setAttribute("type2", type);
        session.setAttribute("salary2", salary);
        session.setAttribute("searchjob", searchjob);
        request.getRequestDispatcher("Public/SearchJob.jsp").forward(request, response);
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
