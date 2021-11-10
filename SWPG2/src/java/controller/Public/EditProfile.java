/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.Public;

import dao.MajorDAO;
import dao.LocationDAO;
import dao.UserDAO;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Location;
import model.Major;
import model.User;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

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
        User u = (User) session.getAttribute("acc");
        String filename = null;
        String image = null;
        String username = u.getUsername();
        UserDAO udao = new UserDAO();

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
                    if(filename.equals("")||filename==null){
                       image= u.getImage();
                    }
                    else{
                    filename = item.getName();
                    Path path = Paths.get(filename);
                    String save = servletContext.getRealPath("/image");
                    File uploadfile = new File(save + "\\" +path.getFileName());
                    image = "image/" + path.getFileName();
                    item.write(uploadfile);
                    }
                }

            }
            response.getWriter().print(fields.get("name"));
            response.getWriter().print(image);
            udao.changeUserInfo(username, fields.get("fullname"), fields.get("dob"), Integer.parseInt(fields.get("gender")), fields.get("address"), fields.get("phone"), image, Integer.parseInt(fields.get("location")), Integer.parseInt(fields.get("major")));
            session.setAttribute("acc", udao.login(username, u.getPassword()));
        } catch (Exception e) {

        } finally {
            session.setAttribute("edit_profile_message", "<div class=\"alert alert-success alert-dismissible fade show\" role=\"alert\" id=\"alertID\">\n"
                    + "            <strong>edit profile successfully</strong> \n"
                    + "            <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"alert\" aria-label=\"Close\"></button>\n"
                    + "        </div>");
            response.sendRedirect("view_profile");
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
        LocationDAO ldao = new LocationDAO();
        MajorDAO mdao = new MajorDAO();
        ArrayList<Location> l = ldao.GetAllLocation();
        ArrayList<Major> m = mdao.GetAllMajor();
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
