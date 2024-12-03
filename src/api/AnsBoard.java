package api;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.PetitionDao;
import dto.Petition;

/**
 * Servlet implementation class AnsBoard
 */
@WebServlet("/AnsBoard")
public class AnsBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AnsBoard() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String category = request.getParameter("category");
		String order = request.getParameter("order");
		
		PetitionDao dao = new PetitionDao();
		
		if(category != null) {
			if(category.equals("전체")) {
				List<Petition> petList = dao.getAnsPet();
				request.setAttribute("anspetList",petList);
			} else {
				List<Petition> petList = dao.getAnsPetByCategory(category);
				request.setAttribute("anspetList",petList);
			}
		} else if(order != null) {
			if(order.equals("recent")) {
				List<Petition> petList = dao.getAnsPet();
				request.setAttribute("anspetList",petList);
			}else {
				List<Petition> petList = dao.getAnsTopPet();
				request.setAttribute("anspetList",petList);
			}
		}else {
			List<Petition> petList = dao.getAnsPet();
			request.setAttribute("anspetList",petList);
		}
		
		RequestDispatcher requestdispatcher = request.getRequestDispatcher("jsp/ansPetition.jsp");
		requestdispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
