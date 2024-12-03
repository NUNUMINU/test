package api;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.PetitionDao;
import dao.ReplyDao;

/**
 * Servlet implementation class addReply
 */
@WebServlet("/addReply")
public class addReply extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addReply() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");
		if (username == null) {
//			session.setAttribute("welcomeMessage", "의견 작성은 로그인 이후에 가능합니다.");
//			response.sendRedirect("/test/jsp/login.jsp");
		}else {
			int ref = Integer.parseInt(request.getParameter("ref"));
			String writer = (String)request.getParameter("writer");
			String writerId = (String)request.getParameter("writerId");
			String content = (String)request.getParameter("dc");
	
	
			PetitionDao petDao = new PetitionDao();
			ReplyDao ReDao = new ReplyDao();
			ReDao.addReply(ref,writer,writerId,content);
			petDao.upAgree(ref);
			
			RequestDispatcher requestdispatcher = request.getRequestDispatcher("ReadPet?id="+ref);
			requestdispatcher.forward(request, response);
		}
	}

}
