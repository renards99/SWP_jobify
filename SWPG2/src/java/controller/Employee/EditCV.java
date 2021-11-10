/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.Employee;

import dao.CvDAO;
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
import model.CV;
import model.User;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author PC
 */
public class EditCV extends HttpServlet {

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
            out.println("<title>Servlet EditCV</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditCV at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("Employee/EditCV.jsp").forward(request, response);
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
        String filename = null;
        String image = null;
        User user = (User) session.getAttribute("acc");
        CvDAO cvdao = new CvDAO();
        
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
                    if(filename.equals("")||filename==null){
                        CV cv = (CV) session.getAttribute("viewCV");
                        image= cv.getTime();
                    }
                    else{
                    Path path = Paths.get(filename);
                    String save = servletContext.getRealPath("/image");
                    File uploadfile = new File(save + "\\" +user.getUsername()+"_cv_img.png");
                    image = "./image/" + path.getFileName();
                    item.write(uploadfile);
                    }
                }

            }
            response.getWriter().print(fields.get("name"));
            response.getWriter().print(image);
            cvdao.UpdateCV(fields.get("fullname"), fields.get("dob"), fields.get("gender"), Integer.parseInt(fields.get("location")), fields.get("phone"), fields.get("contact"), Integer.parseInt(fields.get("education")), fields.get("school"),fields.get("experience"),image,Integer.parseInt( fields.get("id")));
            session.setAttribute("viewCV", cvdao.GetCVById(Integer.parseInt( fields.get("id"))));

            
        } catch (Exception e) {

        }
//        cvdao.UpdateCV(fullname, dob, gender, Integer.parseInt(location), phone, contact, Integer.parseInt(education), school, experience, id);
        finally{
        session.setAttribute("edit_cv_message", "<div class=\"alert alert-success alert-dismissible fade show\" role=\"alert\" id=\"alertID\">\n"
                + "            <strong>Edit CV successfully</strong> \n"
                + "            <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"alert\" aria-label=\"Close\"></button>\n"
                + "        </div>");


        response.sendRedirect("view_cv");
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
