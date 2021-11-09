/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.Admin;

import dao.BannerDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Banner;

/**
 *
 * @author PC
 */
public class ApproveBanner extends HttpServlet {

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
            out.println("<title>Servlet ApproveBanner</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ApproveBanner at " + request.getContextPath() + "</h1>");
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
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");
        LocalDateTime now = LocalDateTime.now();
        String time = null;
        try {  
            Date date =new SimpleDateFormat("yyyy/MM/dd").parse(now.format(dtf));
              SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
            Calendar c1 = Calendar.getInstance();
            c1.setTime(date);
            c1.add(Calendar.DATE, 30);
            time = dateFormat.format(c1.getTime());
        } catch (ParseException ex) {
            Logger.getLogger(ApproveBanner.class.getName()).log(Level.SEVERE, null, ex);
        }
        int statusid = Integer.parseInt(request.getParameter("status"));
        try {
            Banner banner = (Banner) session.getAttribute("bannerdetail");
            BannerDAO bannerdao = new BannerDAO();
            if (statusid == 2) {
                bannerdao.AcceptBanner(statusid, time, banner.getBannerID());
            }
            if (statusid == 3) {
                bannerdao.DeclineBanner(statusid, banner.getBannerID());
            }
        } catch (Exception e) {
            int id = Integer.parseInt(request.getParameter("id"));
            BannerDAO bannerdao = new BannerDAO();
            if (statusid == 2) {
                bannerdao.AcceptBanner(statusid, time, id);
            }
            if (statusid == 3) {
                bannerdao.DeclineBanner(statusid, id);
            }
        }

        response.sendRedirect("list_banner");
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
