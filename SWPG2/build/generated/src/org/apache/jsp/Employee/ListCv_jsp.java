package org.apache.jsp.Employee;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class ListCv_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.apache.jasper.runtime.TagHandlerPool _jspx_tagPool_c_forEach_var_items;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _jspx_tagPool_c_forEach_var_items = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
  }

  public void _jspDestroy() {
    _jspx_tagPool_c_forEach_var_items.release();
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

      out.write('\n');
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>List CV</title>\n");
      out.write("        <style>\n");
      out.write("            .navbar .logo {\n");
      out.write("                height: 50px;\n");
      out.write("                margin: 0px;\n");
      out.write("            }\n");
      out.write("            .profile-img {\n");
      out.write("                border-radius: 50%;\n");
      out.write("                height: 2rem;\n");
      out.write("            }\n");
      out.write("            .banner-text{\n");
      out.write("                color: blue;\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "Header.jsp", out, false);
      out.write("\n");
      out.write("        ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${approve_cv_message}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\n");
      out.write("        ");

            session.removeAttribute("approve_cv_message");
        
      out.write("\n");
      out.write("            <div class=\"container vh-100\">\n");
      out.write("                <section id=\"promote_banner\">\n");
      out.write("                    <div class=\"container col-lg-8 offset-lg-2 my-3\">\n");
      out.write("                        <div id=\"carouselExampleControls\" class=\"carousel slide\" data-bs-ride=\"carousel\">\n");
      out.write("                            <div class=\"carousel-inner\">\n");
      out.write("                                <div class=\"carousel-item active\">\n");
      out.write("                                    <img src=\"https://static.topcv.vn/img/image%20(5).png\" class=\"d-block w-100\" alt=\"...\">\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"carousel-item\">\n");
      out.write("                                    <img src=\"https://static.topcv.vn/img/bAKCu8a%20(2).png\" class=\"d-block w-100\" alt=\"...\">\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"carousel-item\">\n");
      out.write("                                    <img src=\"https://static.topcv.vn/img/21.09.08%20Banner%20SO-01.png\" class=\"d-block w-100\" alt=\"...\">\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                            <button class=\"carousel-control-prev\" type=\"button\" data-bs-target=\"#carouselExampleControls\" data-bs-slide=\"prev\">\n");
      out.write("                                <span class=\"carousel-control-prev-icon\" aria-hidden=\"true\"></span>\n");
      out.write("                                <span class=\"visually-hidden\">Previous</span>\n");
      out.write("                            </button>\n");
      out.write("                            <button class=\"carousel-control-next\" type=\"button\" data-bs-target=\"#carouselExampleControls\" data-bs-slide=\"next\">\n");
      out.write("                                <span class=\"carousel-control-next-icon\" aria-hidden=\"true\"></span>\n");
      out.write("                                <span class=\"visually-hidden\">Next</span>\n");
      out.write("                            </button>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </section>\n");
      out.write("                <section>\n");
      out.write("                    <div class=\"container col-lg-10 offset-lg-1 py-2\">\n");
      out.write("                        <div class=\"row bg-primary bg-opacity-75 rounded-3\" style=\"background-color: #f39f86; background-image: linear-gradient(315deg, #f39f86 0%, #f9d976 74%)\">\n");
      out.write("                            <div class=\"my-2 d-flex justify-content-between text-light\">\n");
      out.write("                                <span><i class=\"far fa-list font text-dark fw-bold\"> List CV</i> </span>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"row \">\n");
      out.write("                        ");
      if (_jspx_meth_c_forEach_0(_jspx_page_context))
        return;
      out.write("\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "Paging.jsp", out, false);
      out.write("\n");
      out.write("                    </div>\n");
      out.write("                </section> \n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <script type=\"text/javascript\">\n");
      out.write("                var alertList = document.querySelectorAll('.alert')\n");
      out.write("                alertList.forEach(function (alert) {\n");
      out.write("                    new bootstrap.Alert(alert)\n");
      out.write("                })\n");
      out.write("\n");
      out.write("                // Get the alert element\n");
      out.write("                // var alertQs = document.querySelector('.alert')  // This line would target all alerts on the page\n");
      out.write("                var alertQs = document.querySelector('#alertID') // This line only targets the element with ID #alertID\n");
      out.write("                // Create a Bootstrap alert instance\n");
      out.write("                var bsAlert = bootstrap.Alert.getInstance(alertQs)\n");
      out.write("                // Dismiss alert after specified amount of time in milliseconds\n");
      out.write("                window.setTimeout(() => {\n");
      out.write("                    bsAlert.close();\n");
      out.write("                }, 4000);\n");
      out.write("            </script>\n");
      out.write("    </body>\n");
      out.write("    \n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "Footer.jsp", out, false);
      out.write("\n");
      out.write("</html>\n");
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

  private boolean _jspx_meth_c_forEach_0(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:forEach
    org.apache.taglibs.standard.tag.rt.core.ForEachTag _jspx_th_c_forEach_0 = (org.apache.taglibs.standard.tag.rt.core.ForEachTag) _jspx_tagPool_c_forEach_var_items.get(org.apache.taglibs.standard.tag.rt.core.ForEachTag.class);
    _jspx_th_c_forEach_0.setPageContext(_jspx_page_context);
    _jspx_th_c_forEach_0.setParent(null);
    _jspx_th_c_forEach_0.setVar("j");
    _jspx_th_c_forEach_0.setItems((java.lang.Object) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${listcv}", java.lang.Object.class, (PageContext)_jspx_page_context, null));
    int[] _jspx_push_body_count_c_forEach_0 = new int[] { 0 };
    try {
      int _jspx_eval_c_forEach_0 = _jspx_th_c_forEach_0.doStartTag();
      if (_jspx_eval_c_forEach_0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
        do {
          out.write("\n");
          out.write("                            <div class=\"card mb-1 \">\n");
          out.write("                                <div class=\"row g-0\">\n");
          out.write("                                    <div class=\"col-md-3\">\n");
          out.write("                                        <a href=\"view_cv?id=");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${j.getId()}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("\">\n");
          out.write("                                            <img src=\"https://static.topcv.vn/company_logos/cong-ty-co-phan-chung-khoan-dai-nam-60d543347cdd8.jpg\" class=\"img-fluid rounded-start\" alt=\"...\">\n");
          out.write("                                        </a>\n");
          out.write("                                    </div>\n");
          out.write("                                    <div class=\"col-md-9\">\n");
          out.write("                                        <div class=\"card-body  text-truncate\">\n");
          out.write("                                            <p class=\"card-title\">\n");
          out.write("                                                <a href=\"view_cv?id=");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${j.getId()}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("\" class=\"fw-bold text-dark text-decoration-none h5\"> ");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${j.getFullname()}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("</a>\n");
          out.write("                                            </p>\n");
          out.write("                                            <p class=\"card-text\">School: ");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${j.getSchool()}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("</p>\n");
          out.write("                                            <div class=\"row\">\n");
          out.write("                                                <div class=\"col-md-6\">\n");
          out.write("                                                    <small class=\"text-muted\">");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${j.getPhone()}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("</small>\n");
          out.write("                                                </div>\n");
          out.write("                                                <div class=\"col-md-6\">\n");
          out.write("                                                    <small class=\"text-muted\">Status: ");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${j.getStatus()}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("</small>\n");
          out.write("                                                </div>\n");
          out.write("                                            </div>\n");
          out.write("                                        </div>\n");
          out.write("                                    </div>\n");
          out.write("                                </div>\n");
          out.write("                            </div>\n");
          out.write("                        ");
          int evalDoAfterBody = _jspx_th_c_forEach_0.doAfterBody();
          if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
            break;
        } while (true);
      }
      if (_jspx_th_c_forEach_0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
    } catch (Throwable _jspx_exception) {
      while (_jspx_push_body_count_c_forEach_0[0]-- > 0)
        out = _jspx_page_context.popBody();
      _jspx_th_c_forEach_0.doCatch(_jspx_exception);
    } finally {
      _jspx_th_c_forEach_0.doFinally();
      _jspx_tagPool_c_forEach_var_items.reuse(_jspx_th_c_forEach_0);
    }
    return false;
  }
}
