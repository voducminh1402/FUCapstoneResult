/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fucapstoneresult.filters;

import com.fucapstoneresult.models.UserDTO;
import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author VODUCMINH
 */
public class AuthorizationFilter implements Filter {
    
    private static final boolean debug = true;

    private static final String LOGIN = "login.html";
    private static final int AD = 3;
    private static final int MOD = 2;
    private static final int US = 1;
    
    private FilterConfig filterConfig = null;
    
    public AuthorizationFilter() {
    }    
    
    private void doBeforeProcessing(ServletRequest request, ServletResponse response)
            throws IOException, ServletException {
        if (debug) {
            log("AuthorizationFilter:DoBeforeProcessing");
        }

        // Write code here to process the request and/or response before
        // the rest of the filter chain is invoked.
        // For example, a logging filter might log items on the request object,
        // such as the parameters.
        /*
	for (Enumeration en = request.getParameterNames(); en.hasMoreElements(); ) {
	    String name = (String)en.nextElement();
	    String values[] = request.getParameterValues(name);
	    int n = values.length;
	    StringBuffer buf = new StringBuffer();
	    buf.append(name);
	    buf.append("=");
	    for(int i=0; i < n; i++) {
	        buf.append(values[i]);
	        if (i < n-1)
	            buf.append(",");
	    }
	    log(buf.toString());
	}
         */
    }    
    
    private void doAfterProcessing(ServletRequest request, ServletResponse response)
            throws IOException, ServletException {
        if (debug) {
            log("AuthorizationFilter:DoAfterProcessing");
        }

        // Write code here to process the request and/or response after
        // the rest of the filter chain is invoked.
        // For example, a logging filter might log the attributes on the
        // request object after the request has been processed. 
        /*
	for (Enumeration en = request.getAttributeNames(); en.hasMoreElements(); ) {
	    String name = (String)en.nextElement();
	    Object value = request.getAttribute(name);
	    log("attribute: " + name + "=" + value.toString());

	}
         */
        // For example, a filter might append something to the response.
        /*
	PrintWriter respOut = new PrintWriter(response.getWriter());
	respOut.println("<P><B>This has been appended by an intrusive filter.</B>");
         */
    }

    /**
     *
     * @param request The servlet request we are processing
     * @param response The servlet response we are creating
     * @param chain The filter chain we are processing
     *
     * @exception IOException if an input/output error occurs
     * @exception ServletException if a servlet error occurs
     */
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
        
        try {
            HttpServletRequest req = (HttpServletRequest) request;
            HttpServletResponse res = (HttpServletResponse) response;
            String url = req.getRequestURI();

            HttpSession session = req.getSession();
            UserDTO userLogin = (UserDTO) session.getAttribute("USER");

            int index = url.lastIndexOf("/");
            String resource = url.substring(index + 1);
            String pathAction = req.getQueryString();
              if (pathAction == null) {
                pathAction = "";
            }
            
            if (resource.contains("mod") || resource.contains("student.jsp") || resource.contains("mod-project.jsp") || resource.contains("mod-index.jsp") || resource.contains("mod-comment-request.jsp")
                || resource.contains("mod-team.jsp") || resource.contains("mod-semester.jsp") || resource.contains("mod-post.jsp") || resource.contains("mod-request.jsp") || resource.contains("instructor")
                || pathAction.contains("ViewModIndexPage") || pathAction.contains("LoadComments") || pathAction.contains("SearchUser") 
                || (pathAction.contains("showUserDetail") && pathAction.contains("page=user")) || (pathAction.contains("showUserDetail") && pathAction.contains("page=student")) || pathAction.contains("GetListProject") || pathAction.contains("LoadAllStudent")
                || pathAction.contains("GetListPost") || pathAction.contains("ViewModRequestPage") || pathAction.contains("EditPost") || pathAction.contains("EditPoPost") || pathAction.contains("LoadFileStudentController") || pathAction.contains("LoadListInstructors")
                    ) {
                if (userLogin != null) {
                    if (AD == (userLogin.getRoleID()) || MOD == (userLogin.getRoleID())) {
                        chain.doFilter(request, response);
                    }
                    else if (!(AD == userLogin.getRoleID())) {
                        session.removeAttribute("USER");
                        res.sendRedirect(LOGIN);
                    }
                }
                else {
                    res.sendRedirect(LOGIN);
                }
            }
            else if (resource.contains("admin.jsp") || pathAction.contains("Load%20All%20User")) {
                if (userLogin != null) {
                    if (AD == (userLogin.getRoleID())) {
                        chain.doFilter(request, response);
                    }
                    else if (!(AD == userLogin.getRoleID())) {
                        session.removeAttribute("USER");
                        res.sendRedirect(LOGIN);
                    }
                }
                else {
                    res.sendRedirect(LOGIN);
                }
            }
            else if (resource.isEmpty() || resource.contains("index.jsp")
                    || pathAction.contains("InstructorDetail") || pathAction.contains("viewPoPost") || pathAction.contains("LazyLoadProject")) {
                if (userLogin != null) {
                    if (US == (userLogin.getRoleID())) {
                        chain.doFilter(request, response);
                    }
                    else if (!(US == userLogin.getRoleID())) {
                        String returnURI = req.getRequestURI() + "?" + pathAction;
                        session.removeAttribute("USER");
                        res.sendRedirect(returnURI);
                    }
                }
                else {
                    chain.doFilter(request, response);
                }
            }
            else if (resource.contains("user-info-update.jsp")
                    || pathAction.contains("showUserDetail&page=index") || pathAction.contains("GetListPoPost") || resource.contains("po-add-post.jsp") || pathAction.contains("ViewAddPoPostPage")) {
                if (userLogin != null) {
                    if (US == (userLogin.getRoleID())) {
                        chain.doFilter(request, response);
                        
                    }
                    else if (!(US == userLogin.getRoleID())) {
                        res.sendRedirect(LOGIN);

                    }
                }
                else {
                    res.sendRedirect(LOGIN);
                }
            }
            else if (resource.contains(LOGIN)) {
                if (userLogin == null) {
                    chain.doFilter(request, response);
                }
                else {
                    if (userLogin.getRoleID() == AD || userLogin.getRoleID() == MOD)  {
                        res.sendRedirect("mod-index.jsp");
                    }
                    else if (userLogin.getRoleID() == US) {
                        res.sendRedirect("index.jsp");
                    }
                }
            }
            else {
                chain.doFilter(request, response);
            }
        } 
        catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * Return the filter configuration object for this filter.
     */
    public FilterConfig getFilterConfig() {
        return (this.filterConfig);
    }

    /**
     * Set the filter configuration object for this filter.
     *
     * @param filterConfig The filter configuration object
     */
    public void setFilterConfig(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
    }

    /**
     * Destroy method for this filter
     */
    public void destroy() {        
    }

    /**
     * Init method for this filter
     */
    public void init(FilterConfig filterConfig) {        
        this.filterConfig = filterConfig;
        if (filterConfig != null) {
            if (debug) {                
                log("AuthorizationFilter:Initializing filter");
            }
        }
    }

    /**
     * Return a String representation of this object.
     */
    @Override
    public String toString() {
        if (filterConfig == null) {
            return ("AuthorizationFilter()");
        }
        StringBuffer sb = new StringBuffer("AuthorizationFilter(");
        sb.append(filterConfig);
        sb.append(")");
        return (sb.toString());
    }
    
    private void sendProcessingError(Throwable t, ServletResponse response) {
        String stackTrace = getStackTrace(t);        
        
        if (stackTrace != null && !stackTrace.equals("")) {
            try {
                response.setContentType("text/html");
                PrintStream ps = new PrintStream(response.getOutputStream());
                PrintWriter pw = new PrintWriter(ps);                
                pw.print("<html>\n<head>\n<title>Error</title>\n</head>\n<body>\n"); //NOI18N

                // PENDING! Localize this for next official release
                pw.print("<h1>The resource did not process correctly</h1>\n<pre>\n");                
                pw.print(stackTrace);                
                pw.print("</pre></body>\n</html>"); //NOI18N
                pw.close();
                ps.close();
                response.getOutputStream().close();
            } catch (Exception ex) {
            }
        } else {
            try {
                PrintStream ps = new PrintStream(response.getOutputStream());
                t.printStackTrace(ps);
                ps.close();
                response.getOutputStream().close();
            } catch (Exception ex) {
            }
        }
    }
    
    public static String getStackTrace(Throwable t) {
        String stackTrace = null;
        try {
            StringWriter sw = new StringWriter();
            PrintWriter pw = new PrintWriter(sw);
            t.printStackTrace(pw);
            pw.close();
            sw.close();
            stackTrace = sw.getBuffer().toString();
        } catch (Exception ex) {
        }
        return stackTrace;
    }
    
    public void log(String msg) {
        filterConfig.getServletContext().log(msg);        
    }
    
}