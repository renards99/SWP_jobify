/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.Employer;

import dao.JobDAO;
import dao.WalletDAO;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Path;
import java.nio.file.Paths;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.User;
import java.time.format.DateTimeFormatter;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Part;
import model.Wallet;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author PC
 */
@MultipartConfig(
        maxFileSize = 16177215
)
public class PostJob extends HttpServlet {

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
            out.println("<title>Servlet PostJob</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PostJob at " + request.getContextPath() + "</h1>");
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
        response.getWriter().print("Hi");
        request.getRequestDispatcher("Employer/PostJob.jsp").forward(request, response);
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
        double amount = 5;
        User user = (User) session.getAttribute("acc");
        WalletDAO wDAO = new WalletDAO();
        Wallet wallet = wDAO.getWallet(user.getUsername());
        if (wallet.getBalance()<5) {
            session.setAttribute("post_job_message", "<div class=\"alert alert-danger alert-dismissible fade show\" role=\"alert\" id=\"alertID\">\n"
                        + "            <strong>Post job failed. You must have more than 5$ in your wallet</strong> \n"
                        + "            <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"alert\" aria-label=\"Close\"></button>\n"
                        + "        </div>");
            response.sendRedirect("home");
        } else {

            String filename = null;
            String image = null;
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
            LocalDateTime now = LocalDateTime.now();
            JobDAO jobdao = new JobDAO();
            String time = dtf.format(now);
            try {
                DiskFileItemFactory factory = new DiskFileItemFactory();

                ServletContext servletContext = this.getServletConfig().getServletContext();
                File repository = (File) servletContext.getAttribute("javax.servlet.context.tempdir");
                factory.setRepository(repository);

                ServletFileUpload upload = new ServletFileUpload(factory);

                List<FileItem> items = upload.parseRequest(request);
                Iterator<FileItem> iter = items.iterator();
                HashMap<String, String> fields = new HashMap<>();
                while (iter.hasNext()) {
                    FileItem item = iter.next();

                    if (item.isFormField()) {
                        String name = item.getFieldName();
                        String value = item.getString();
                        fields.put(name, value);
                        System.out.println(name);
                        System.out.println(value);
                    } else {
                        filename = item.getName();
                        Path path = Paths.get(filename);
                        String save = servletContext.getRealPath("/image");
                        File uploadfile = new File(save + "\\" +user.getUsername()+"_job_img.png");
                        image = "image/" + user.getUsername()+"_job_img.png";
                        item.write(uploadfile);
                    }

                }
                //
                
                response.getWriter().print(fields.get("name"));
                response.getWriter().print(image);
                jobdao.CreateJob(fields.get("name"), fields.get("company"), fields.get("website"), fields.get("address"), fields.get("salary"), fields.get("description"), fields.get("requirement"), fields.get("email"), fields.get("phone"), image, user.getUsername(), Integer.parseInt(fields.get("location")), Integer.parseInt(fields.get("major")), Integer.parseInt(fields.get("jobtype")), time);
                wDAO.updateWallet(user.getUsername(), wallet.getBalance()-amount );
                wDAO.addToHistory(user.getUsername(), 0, amount);
                session.setAttribute("post_job_message", "<div class=\"alert alert-success alert-dismissible fade show\" role=\"alert\" id=\"alertID\">\n"
                        + "            <strong>Job posted successfully</strong> \n"
                        + "            <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"alert\" aria-label=\"Close\"></button>\n"
                        + "        </div>");
                response.sendRedirect("home");

            } catch (Exception e) {

            }
        }
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
