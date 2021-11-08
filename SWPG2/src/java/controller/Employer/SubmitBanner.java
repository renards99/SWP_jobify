/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.Employer;

import dao.BannerDAO;
import dao.WalletDAO;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.User;
import model.Wallet;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author PC
 */
public class SubmitBanner extends HttpServlet {

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
            out.println("<title>Servlet SubmitBanner</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SubmitBanner at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        double amount = 30;
        User user = (User) session.getAttribute("acc");
        WalletDAO wDAO = new WalletDAO();
        Wallet wallet = wDAO.getWallet(user.getUsername());
        if (wallet.getBalance() < amount) {
            request.setAttribute("message", "You must have more than 30$ in your wallet");
            request.getRequestDispatcher("Employer/Banner.jsp").forward(request, response);
        } else {
            String filename = null;
            String image = null;
            String message = null;
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
                        String save = "C:\\Users\\TNC\\OneDrive\\Documents\\NetBeansProjects\\swp\\SWPG2\\web\\image";
                        File uploadfile = new File(save + "\\" + path.getFileName());
                        image = "image/" + path.getFileName();
                        item.write(uploadfile);
                    }

                }
                response.getWriter().print(fields);
                response.getWriter().print(image);
                BannerDAO bannerdao = new BannerDAO();
                bannerdao.submitBanner(Integer.parseInt(fields.get("id")), 1, image);
                wDAO.updateWallet(user.getUsername(), wallet.getBalance()-amount );
                wDAO.addToHistory(user.getUsername(), 0, amount);
                message = "upgrade success";
                
            } catch (Exception e) {
                message = "Upgrade fail";
            } finally {
                request.setAttribute("message", message);
                request.getRequestDispatcher("Employer/Banner.jsp").forward(request, response);
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
