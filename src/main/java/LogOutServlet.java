import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name="LogOutServlet",urlPatterns = "/logout")
public class LogOutServlet extends HttpServlet {
    public LogOutServlet() {
        System.out.println("LogoutServlet 생성");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getSession().invalidate(); // 세션 초기화
        response.sendRedirect("LoginForm.jsp");
        System.out.println("세션 모두 초기화");
    }
}
