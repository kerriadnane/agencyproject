package servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.google.gson.Gson;

import Dao.AereportImpl;
import Dao.IDaoAereport;
import Entities.Aereport;
import response.ResAereport;

/**
 * Servlet implementation class AjaxAereport
 */
@WebServlet("/ajaxaereport")
public class AjaxAereport extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private IDaoAereport daoaereport;

	public void init(ServletConfig config) throws ServletException {
		daoaereport = new AereportImpl(); 
	}

	public AjaxAereport() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		List<Aereport> aereport = daoaereport.getAll();
		List<ResAereport> listeresaereport = new ArrayList<>();
		
		for (Aereport aer : aereport) {
			ResAereport resaereport = new ResAereport(aer.getId(),aer.getNom());
			listeresaereport.add(resaereport);
		}
		String json = new Gson().toJson(listeresaereport);
		
		
		response.setContentType("application/json");
		// response.setCharacterEncoding("UTF-8");
		response.getWriter().write(json);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
