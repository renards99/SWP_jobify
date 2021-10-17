package controller.Public;

import dao.CvDAO;
import dao.UserDAO;
import dao.WalletDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.CV;
import model.User;
import model.Wallet;

public class Login extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //----------
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        UserDAO dao = new UserDAO();
        User a = dao.login(username, password);
        if (a == null) {
            if (username != null) {
                request.setAttribute("message", "<div class=\"alert alert-danger\" role=\"alert\">\n"
                        + "                                <i class=\"far fa-times-circle\"></i>\n"
                        + "                                Wrong username or password please input again!\n"
                        + "                            </div>");
            }
            request.getRequestDispatcher("Public/Login.jsp").forward(request, response);

        } else {
            HttpSession session = request.getSession();
            //add wallet to session
            WalletDAO wDAO = new WalletDAO();
            Wallet w = wDAO.getWallet(username);
            session.setAttribute("wallet", w);
            //check if cv existed
            CvDAO cvDAO=new CvDAO();
            CV cv= cvDAO.checkCVExist(username);
            if(cv==null){
                session.setAttribute("cv", "false");
            }else{
                session.setAttribute("cv", "true");
            }
            
            session.setAttribute("acc", a);
            
            response.sendRedirect("home");
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
        request.getRequestDispatcher("Public/Login.jsp").forward(request, response);
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
