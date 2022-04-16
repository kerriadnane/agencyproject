package servlets;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.ClientImpl;
import Dao.IDaoPassager;
import Dao.PassagerImpl;
import Entities.Client;
import Entities.Passager;

/**
 * Servlet implementation class PassagerS
 */
@WebServlet("/passager")
public class PassagerS extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private IDaoPassager daopassager;   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PassagerS() {
        super();
        // TODO Auto-generated constructor stub
    }
    public void init(ServletConfig config) throws ServletException {
		daopassager = new PassagerImpl();
	}
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
String action = request.getServletPath();
		
		
		if((action != null) && (action == "/passagerdetail")) {
			Long idpassager = Long.parseLong(request.getParameter("id"));
			Passager passager = daopassager.getPassager(idpassager);
			request.setAttribute("passager", passager);
		}
		
		if((action != null) && (action == "/passagerupdate")) {
			Long idpassager = Long.parseLong(request.getParameter("id"));
			Passager passager = daopassager.getPassager(idpassager);
			request.setAttribute("passager", passager);
		}
		
		
		request.setAttribute("page", action);
		
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
