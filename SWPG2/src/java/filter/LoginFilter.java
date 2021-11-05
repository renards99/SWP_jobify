/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author lephu
 */
public class LoginFilter implements Filter{

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {}

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        //kiem tra xem co phai la trang khac trang login
        HttpServletRequest req = (HttpServletRequest)request;
        if (req.getServletPath().contains("login"))
        {
            chain.doFilter(request, response);
        }
        else
        {
            if (req.getSession().getAttribute("filter") != null)
                chain.doFilter(request, response);
            else
                ((HttpServletResponse) response).sendRedirect("login");
        }
    }

    @Override
    public void destroy() {}
    
}