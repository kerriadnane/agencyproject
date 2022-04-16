package servlets;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.ClientImpl;
import Dao.IDaoClient;
import Entities.Client;


@WebServlet("/client")

public class ClientS extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private IDaoClient daoclient;   
   

	public void init(ServletConfig config) throws ServletException {
		daoclient = new ClientImpl();
	}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action = request.getServletPath();
		
		
		if((action != null) && (action == "/clientdetail")) {
			Long idclient = Long.parseLong(request.getParameter("id"));
			Client client = daoclient.getClient(idclient);
			request.setAttribute("client", client);
		}
		
		if((action != null) && (action == "/clientupdate")) {
			Long idclient = Long.parseLong(request.getParameter("id"));
			Client client = daoclient.getClient(idclient);
			request.setAttribute("client", client);
		}
		
		
		request.setAttribute("page", action);
		
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
