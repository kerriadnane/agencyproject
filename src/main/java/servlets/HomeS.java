package servlets;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import Dao.IDaoUser;
import Dao.UserImpl;
import Entities.Users;


@WebServlet("/home")
public class HomeS extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    private IDaoUser userDao;
    
    public HomeS() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		userDao = new UserImpl();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String action = request.getServletPath();
		
		if(action != "/logout") {
			if(session.getAttribute("username") != null) {
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}else {
				request.getRequestDispatcher("home.jsp").forward(request, response);
			}
		}else {
			session.invalidate();
			response.sendRedirect(request.getContextPath() + "/home");
			//request.getRequestDispatcher("home.jsp").forward(request, response);
		}
		
		request.setAttribute("page", action);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		Users user = userDao.getUser(request.getParameter("username"), request.getParameter("password"));
		if(user != null) {
			session.setAttribute("username", user.getUserName());
			String json = new Gson().toJson(user.getUserName());
			response.setContentType("application/json");
			// response.setCharacterEncoding("UTF-8");
			response.getWriter().write(json);
		}else {
			String json = new Gson().toJson("erreur");
			response.setContentType("application/json");
			// response.setCharacterEncoding("UTF-8");
			response.getWriter().write(json);
		}
	}

}
