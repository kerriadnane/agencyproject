package servlets;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Scanner;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.common.base.Splitter;
import com.google.gson.Gson;

import Dao.IDaoPassager;
import Dao.PassagerImpl;
import Entities.Client;
import Entities.Passager;
import response.ResPassager;


@WebServlet("/ajaxpassager")
public class AjaxPassager extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private IDaoPassager daopassager;   
    
    public AjaxPassager() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		daopassager = new PassagerImpl();
	}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<Passager> passager = daopassager.getAll();
		List<ResPassager> listerespassager = new ArrayList<>();
		
		for (Passager p : passager) {
			ResPassager respassager = new ResPassager(
					p.getId(),
					p.getNom(),
					p.getPrenom(),
					p.getAdresse(),
					p.getTel(),
					p.getEmail()
					);
			listerespassager.add(respassager);
		}
		String json = new Gson().toJson(listerespassager);
		
		
		response.setContentType("application/json");
		// response.setCharacterEncoding("UTF-8");
		response.getWriter().write(json);
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Passager passager = daopassager.addPassager(new Passager(
				request.getParameter("nom_passager"),
				request.getParameter("prenom_passager"),
				request.getParameter("adresse_passager"),
				request.getParameter("tel_passager"),
				request.getParameter("mail_passager")
				));
		
		String json = new Gson().toJson(passager);
		
		
		response.setContentType("application/json");
		// response.setCharacterEncoding("UTF-8");
		response.getWriter().write(json);
	}

	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Passager passager = daopassager.getPassager(Long.parseLong(req.getParameter("id")));
		daopassager.deletePassager(passager);
	}

	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		Map<String,String> data = getParameterMap(req);
		
		Passager p = new Passager(
				data.get("nom_passager"),
				data.get("prenom_passager"),
				data.get("adresse_passager"),
				data.get("tel_passager"),
				data.get("mail_passager")
				);
		
		Passager passager = daopassager.updatePassager(p, Long.parseLong(req.getParameter("id")));
	}
	
	
	public static Map<String, String> getParameterMap(HttpServletRequest request) {

	    BufferedReader br = null;
	    Map<String, String> dataMap = null;

	    try {

	        InputStreamReader reader = new InputStreamReader(
	                request.getInputStream());
	        br = new BufferedReader(reader);

	        String data = br.readLine();

	        dataMap = Splitter.on('&')
	                .trimResults()
	                .withKeyValueSeparator(
	                        Splitter.on('=')
	                        .limit(2)
	                        .trimResults())
	                .split(data);

	        return dataMap;
	    } catch (IOException ex) {
	    	
	    } finally {
	        if (br != null) {
	            try {
	                br.close();
	            } catch (IOException ex) {
	               
	            }
	        }
	    }

	    return dataMap;
	}
	
	

}
