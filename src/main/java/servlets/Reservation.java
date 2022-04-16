package servlets;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import Dao.AereportImpl;
import Dao.ClientImpl;
import Dao.CompanyImpl;
import Dao.IDaoAereport;
import Dao.IDaoClient;
import Dao.IDaoCompany;
import Dao.IDaoPassager;
import Dao.IDaoReservation;
import Dao.IDaoVol;
import Dao.PassagerImpl;
import Dao.ReservationImpl;
import Dao.VolImpl;
import Entities.Aereport;
import Entities.Client;
import Entities.Company;
import Entities.Passager;
import Entities.Vol;

@WebServlet("/reservation")
public class Reservation extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private IDaoReservation daoreserv;
	private IDaoClient daoclient;
	private IDaoPassager daopassager;
	private IDaoCompany daocompany;
	private IDaoAereport daoaereport;
	private IDaoVol daovol;
    
    public Reservation() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	public void init(ServletConfig config) throws ServletException {
		daoreserv = new ReservationImpl();
		daoclient = new ClientImpl();
		daopassager = new PassagerImpl();
		daocompany = new CompanyImpl();
		daoaereport = new AereportImpl();
		daovol = new  VolImpl();
	}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action = request.getServletPath();
		if (action != null && action=="/reservationdetail") {
			Long idreserv = Long.parseLong(request.getParameter("id"));
			Entities.Reservation reservation = daoreserv.getReservation(idreserv);
			request.setAttribute("reservation", reservation);
		}
		request.setAttribute("page", action);
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Client client   = daoclient.getClient(Long.parseLong(request.getParameter("idclient")));
		Passager passager = daopassager.getPassager(Long.parseLong(request.getParameter("idpassager")));
		Company company = daocompany.getCompany(Long.parseLong(request.getParameter("idcompany")));
		Aereport aereport_depart = daoaereport.getAereport(Long.parseLong(request.getParameter("aereport_depart")));
		Aereport aereport_arrive = daoaereport.getAereport(Long.parseLong(request.getParameter("aereport_arrive")));
		try {
			Vol vol = new Vol(
					new SimpleDateFormat("yyyy-mm-dd").parse(request.getParameter("date_depart")),
					request.getParameter("heure_depart"),
					new SimpleDateFormat("yyyy-mm-dd").parse(request.getParameter("date_arrive")),
					request.getParameter("heure_arrive"),
					company,
					aereport_depart,
					aereport_arrive
					);
					daovol.addVol(vol);
					Entities.Reservation reservation = new Entities.Reservation(
							new Date(),
							client,
							passager,
							vol,
							Double.parseDouble(request.getParameter("prix"))
							);
					Entities.Reservation res = daoreserv.addReservation(reservation);
					String json = new Gson().toJson(res.getId());
					response.setContentType("application/json");
					// response.setCharacterEncoding("UTF-8");
					response.getWriter().write(json);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
