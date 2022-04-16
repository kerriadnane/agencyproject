package Dao;

import java.util.List;

import Entities.Reservation;

public interface IDaoReservation {
public List<Reservation> getAll();
public Reservation getReservation(Long id);
public Reservation addReservation(Reservation r);
public void deleteReservation(Reservation r);
}
