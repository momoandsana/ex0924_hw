import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.time.LocalDateTime;

@WebServlet(name="LoginServlet",urlPatterns = "/login")
public class LoginServlet extends HttpServlet {
    String dbId="kim",dbPwd="1234";

    public LoginServlet() {
        System.out.println("LoginServlet 생성");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userId = request.getParameter("userId");
        String userPwd = request.getParameter("userPwd");
        String userName = request.getParameter("userName");

        if(dbId.equals(userId) && dbPwd.equals(userPwd)){
            HttpSession session = request.getSession();
            session.setAttribute("userId",userId);
            session.setAttribute("loginTime", LocalDateTime.now());
            session.setAttribute("userName",userName);
            System.out.println("세션에 내용 등록");

            response.sendRedirect("LoginOk.jsp");
        }
        else
        {
            request.getRequestDispatcher("LoginForm.jsp").forward(request, response);
        }
    }
}
