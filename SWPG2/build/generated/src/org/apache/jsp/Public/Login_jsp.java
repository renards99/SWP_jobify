package org.apache.jsp.Public;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class Login_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("        <title>Login Page</title>\r\n");
      out.write("        <style>\r\n");
      out.write("            .wrapper {\r\n");
      out.write("                position: relative;\r\n");
      out.write("                width: fit-content;\r\n");
      out.write("                height: fit-content;\r\n");
      out.write("            }\r\n");
      out.write("\r\n");
      out.write("            .play {\r\n");
      out.write("                position: absolute;         \r\n");
      out.write("                width: 100px;\r\n");
      out.write("                z-index: 1;\r\n");
      out.write("            }\r\n");
      out.write("            .divider:after,\r\n");
      out.write("            .divider:before {\r\n");
      out.write("                content: \"\";\r\n");
      out.write("                flex: 1;\r\n");
      out.write("                height: 1px;\r\n");
      out.write("                background: #eee;\r\n");
      out.write("            }\r\n");
      out.write("            .h-custom {\r\n");
      out.write("                height: calc(100% - 73px);\r\n");
      out.write("            }\r\n");
      out.write("            @media (max-width: 450px) {\r\n");
      out.write("                .h-custom {\r\n");
      out.write("                    height: 100%;\r\n");
      out.write("                }\r\n");
      out.write("            }\r\n");
      out.write("\r\n");
      out.write("        </style>\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://use.fontawesome.com/releases/v5.7.2/css/all.css\" integrity=\"sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr\" crossorigin=\"anonymous\" />\r\n");
      out.write("        <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css\" rel=\"stylesheet\" integrity=\"sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC\" crossorigin=\"anonymous\">\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
      out.write("\r\n");
      out.write("        <div class=\"vh-100\">\r\n");
      out.write("            <div class=\"container-fluid h-custom\">\r\n");
      out.write("                <div class=\"row d-flex justify-content-center align-items-center h-100\">\r\n");
      out.write("                    <div class=\"wrapper col-md-9 col-lg-6 col-xl-5\">\r\n");
      out.write("                        <a href=\"#\"><img class=\"play\" src=\"https://i.ibb.co/SPrbGXk/logo.png\" alt=\"\"></a>\r\n");
      out.write("                        <img src=\"https://mdbootstrap.com/img/Photos/new-templates/bootstrap-login-form/draw2.png\" class=\"img-fluid\"\r\n");
      out.write("                             alt=\"Sample image\">\r\n");
      out.write("\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"col-md-8 col-lg-6 col-xl-4 offset-xl-1\">\r\n");
      out.write("                        <form class=\"needs-validation\" action=\"login\" method=\"post\" novalidate>\r\n");
      out.write("                            <div class=\"d-flex flex-row align-items-center justify-content-center justify-content-lg-start\">\r\n");
      out.write("                                <p class=\"lead fw-normal mb-0 me-3\">Sign in with</p>\r\n");
      out.write("                                <button type=\"button\" class=\"btn btn-primary btn-floating mx-1\">\r\n");
      out.write("                                    <i class=\"fab fa-facebook-f\"></i>\r\n");
      out.write("                                </button>\r\n");
      out.write("\r\n");
      out.write("                                <button type=\"button\" class=\"btn btn-primary btn-floating mx-1\">\r\n");
      out.write("                                    <i class=\"fab fa-twitter\"></i>\r\n");
      out.write("                                </button>\r\n");
      out.write("\r\n");
      out.write("                                <button type=\"button\" class=\"btn btn-primary btn-floating mx-1\">\r\n");
      out.write("                                    <i class=\"fab fa-linkedin-in\"></i>\r\n");
      out.write("                                </button>\r\n");
      out.write("                            </div>\r\n");
      out.write("\r\n");
      out.write("                            <div class=\"divider d-flex align-items-center my-4\">\r\n");
      out.write("                                <p class=\"text-center fw-bold mx-3 mb-0\">Or</p>\r\n");
      out.write("                            </div>\r\n");
      out.write("                            <!--notification -->\r\n");
      out.write("                            ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${message}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\r\n");
      out.write("                            <!--  input -->\r\n");
      out.write("\r\n");
      out.write("                            <div class=\"form-outline mb-4\">\r\n");
      out.write("                                <label>Username</label>\r\n");
      out.write("                                <input type=\"text\" id=\"username\" name=\"username\" class=\"form-control form-control-lg\" required\r\n");
      out.write("                                       placeholder=\"Enter username\" />\r\n");
      out.write("\r\n");
      out.write("                            </div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("                            <!--  input -->\r\n");
      out.write("                            <div class=\"form-outline mb-4\">\r\n");
      out.write("                                <label >Password</label>\r\n");
      out.write("                                <div class=\"input-group mb-4\">\r\n");
      out.write("\r\n");
      out.write("                                    <input type=\"password\" id=\"password\" name=\"password\" class=\"form-control form-control-lg\" required\r\n");
      out.write("                                           placeholder=\"Enter password\" />\r\n");
      out.write("                                    <span class=\"input-group-text\" onclick=\"password_show_hide();\">\r\n");
      out.write("                                        <i class=\"fas fa-eye\" id=\"show_eye\"></i>\r\n");
      out.write("                                        <i class=\"fas fa-eye-slash d-none\" id=\"hide_eye\"></i>\r\n");
      out.write("                                    </span> \r\n");
      out.write("                                </div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("                                <div class=\"d-flex justify-content-between align-items-center\">\r\n");
      out.write("                                    <!-- Checkbox -->\r\n");
      out.write("                                    <div class=\"form-check mb-0\">\r\n");
      out.write("                                        <input class=\"form-check-input me-2\" type=\"checkbox\" value=\"\" id=\"form2Example3\" />\r\n");
      out.write("                                        <label class=\"form-check-label\" for=\"form2Example3\">\r\n");
      out.write("                                            Remember me\r\n");
      out.write("                                        </label>\r\n");
      out.write("                                    </div>\r\n");
      out.write("                                    <a href=\"forget_password\" class=\"text-body\">Forgot password?</a>\r\n");
      out.write("                                </div>\r\n");
      out.write("\r\n");
      out.write("                                <div class=\"text-center text-lg-start mt-4 pt-2\">\r\n");
      out.write("                                    <button type=\"submit\" class=\"btn btn-primary btn-lg\"\r\n");
      out.write("                                            style=\"padding-left: 2.5rem; padding-right: 2.5rem;\">Login</button>\r\n");
      out.write("                                    <p class=\"small fw-bold mt-2 pt-1 mb-0\">Don't have an account? \r\n");
      out.write("                                        <a href=\"register\" class=\"link-danger\">Register</a>\r\n");
      out.write("                                    </p>\r\n");
      out.write("                                </div>\r\n");
      out.write("\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </form>\r\n");
      out.write("\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("\r\n");
      out.write("        <script src=\"js/script.js\"></script>\r\n");
      out.write("        <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js\" integrity=\"sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM\" crossorigin=\"anonymous\"></script>\r\n");
      out.write("    </body>\r\n");
      out.write("</html>\r\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
