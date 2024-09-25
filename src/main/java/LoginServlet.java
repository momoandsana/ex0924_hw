import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;

@WebServlet(name="LoginServlet",urlPatterns = "/login")
public class LoginServlet extends HttpServlet {
    String dbId = "kim", dbPwd = "1234";

    public LoginServlet() {
        System.out.println("LoginServlet 생성");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userId = request.getParameter("userId");
        String userPwd = request.getParameter("userPwd");
        String userName = request.getParameter("userName");

        if (dbId.equals(userId) && dbPwd.equals(userPwd))
        {
            // 아이디 & 비번이 일치하는 경우
            HttpSession session = request.getSession();
            session.setAttribute("userId", userId);
            session.setAttribute("loginTime", LocalDateTime.now());
            /*
            session.getCreationTime() 을 사용하면 사이트를 접속한 시간 기준으로 하기 때문에
            로그인한 시간 기준이 아니라 접속한 시간이 기준이 된다
             */
            session.setAttribute("userName", userName);
            System.out.println("세션에 내용 등록");

            response.sendRedirect("LoginOk.jsp");
        }
        else
        {
            // 아이디 & 비번이 틀린 경우
            response.setContentType("text/html;charset=UTF-8"); // 한글 인코딩
            PrintWriter out = response.getWriter();
            out.println("<script type='text/javascript'>");
            out.println("alert('아이디 또는 비밀번호가 틀립니다.');"); // 경고 문구
            out.println("history.back();"); // 이전 페이지로 돌아가기
            out.println("</script>");

            /*
            현재 입력된 정보를 유지한 채로 뒤로 가기
             */
        }
    }
}
