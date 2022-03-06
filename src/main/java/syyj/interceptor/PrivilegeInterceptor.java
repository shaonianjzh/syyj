package syyj.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import syyj.domain.Admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class PrivilegeInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        Admin admin = (Admin) session.getAttribute("admin");
        if(admin==null){

            response.sendRedirect(request.getContextPath()+"/login.jsp");
            return false;
        }
        //放行
        return true;
    }
}
