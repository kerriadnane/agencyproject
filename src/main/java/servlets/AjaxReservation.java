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

import Dao.IDaoReservation;
import Dao.ReservationImpl;
import Entities.Reservation;
import response.ResReservation;

/**
 * Servlet implementation class AjaxReservation
 */
@WebServlet("/ajaxreservation")
public class AjaxReservation extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private IDaoReservation daoreservation;
    public AjaxReservation() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		daoreservation = new ReservationImpl();
	}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Reservation> reservations = daoreservation.getAll();
		List<ResReservation> resreservations = new ArrayList<>();
		
		for (Reservation reservation : reservations) {
			ResReservation resreservation = new ResReservation(
					reservation.getId(),
					reservation.getDate_res(),
					reservation.getClient().getId(),
					reservation.getPassager().getId(),
					reservation.getVol().getId(),
					reservation.getPrix(),
					reservation.getClient().getNom(),
					reservation.getClient().getPrenom(),
					reservation.getPassager().getNom(),
					reservation.getPassager().getPrenom(),
					reservation.getVol().getAereport_dep().getNom(),
					reservation.getVol().getAereport_arr().getNom()
					);
			resreservations.add(resreservation);
		}
		String json = new Gson().toJson(resreservations);
		response.setContentType("application/json");
		// response.setCharacterEncoding("UTF-8");
		response.getWriter().write(json);
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Reservation reservatin = daoreservation.getReservation(Long.parseLong(req.getParameter("id")));
		daoreservation.deleteReservation(reservatin);
	}
	
	

}
