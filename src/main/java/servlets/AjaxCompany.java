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

import Dao.CompanyImpl;
import Dao.IDaoCompany;
import Entities.Company;
import response.ResCompany;

/**
 * Servlet implementation class AjaxCompany
 */
@WebServlet("/ajaxcompany")
public class AjaxCompany extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private IDaoCompany daocompany;   
    
    public AjaxCompany() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		daocompany = new CompanyImpl();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<Company> companys = daocompany.getAll();
		List<ResCompany> listcompany = new ArrayList<>();
		
		for (Company company : companys) {
			ResCompany rescompany = new ResCompany(company.getId(), company.getNom());
			listcompany.add(rescompany);
		}
		
		String json = new Gson().toJson(listcompany);
		
		
		response.setContentType("application/json");
		// response.setCharacterEncoding("UTF-8");
		response.getWriter().write(json);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
