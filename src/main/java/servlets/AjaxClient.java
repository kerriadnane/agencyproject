package servlets;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Scanner;
import java.util.logging.Level;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.common.base.Splitter;
import com.google.gson.Gson;

import Dao.ClientImpl;
import Dao.IDaoClient;
import Entities.Client;
import response.ResClient;


@WebServlet("/ajaxclient")
public class AjaxClient extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private IDaoClient daoclient;  
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxClient() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		daoclient = new ClientImpl();
	}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<Client> client = daoclient.getAll();
		List<ResClient> listeresclient = new ArrayList<>();
		
		for (Client cl : client) {
			
			ResClient resclient = new ResClient(
					cl.getId(),
					cl.getNom(),
					cl.getPrenom(),
					cl.getAdresse(),
					cl.getTel(),
					cl.getEmail()
					);
			listeresclient.add(resclient);
		}
		String json = new Gson().toJson(listeresclient);
		response.setContentType("application/json");
		// response.setCharacterEncoding("UTF-8");
		response.getWriter().write(json);
	}
 
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		Client client = daoclient.addClient(new Client(
				request.getParameter("nom_client"),
				request.getParameter("prenom_client"),
				request.getParameter("adresse_client"),
				request.getParameter("tel_client"),
				request.getParameter("mail_client")
				));
		
		String json = new Gson().toJson(client);
		
		
		response.setContentType("application/json");
		// response.setCharacterEncoding("UTF-8");
		response.getWriter().write(json);
	}

	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Client c = daoclient.getClient(Long.parseLong(req.getParameter("id")));
		daoclient.deleteClient(c);
	}

	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		Map<String,String> data = getParameterMap(req);
		System.out.println(data.get("mail_client"));
		Client c = new Client(
				data.get("nom_client"),
				data.get("prenom_client"),
				data.get("adresse_client"),
				data.get("tel_client"),
				data.get("mail_client")
				);
		
		Client client = daoclient.updateClient(c, Long.parseLong(req.getParameter("id")));
		
		
	}
	
	public static Map<String, String> getParameterMap(HttpServletRequest request) {

	    BufferedReader br = null;
	    Map<String, String> dataMap = null;

	    try {

	        InputStreamReader reader = new InputStreamReader(
	                request.getInputStream(), "UTF-8");
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
