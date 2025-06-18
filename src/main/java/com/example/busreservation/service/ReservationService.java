package com.example.busreservation.service;

import com.example.busreservation.model.Reservation;
import com.example.busreservation.model.Voyage;
import com.example.busreservation.repository.ReservationRepository;
import com.example.busreservation.repository.VoyageRepository;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;

@Service
public class ReservationService {
    private final ReservationRepository reservationRepository;
    private final VoyageRepository voyageRepository;

    public ReservationService(ReservationRepository reservationRepository, VoyageRepository voyageRepository) {
        this.reservationRepository = reservationRepository;
        this.voyageRepository = voyageRepository;
    }

    public List<Reservation> getAll() {
        return reservationRepository.findAll();
    }

    public String reserver(Reservation reservation) {
        Voyage voyage = reservation.getVoyage();
        if (voyage.getNombrePlaces() >= reservation.getNombrePlaces()) {
            voyage.setNombrePlaces(voyage.getNombrePlaces() - reservation.getNombrePlaces());
            voyageRepository.save(voyage);
            reservation.setDateReservation(LocalDate.now());
            reservationRepository.save(reservation);
            return "Réservation réussie";
        } else {
            return "Nombre de places insuffisant";
        }
    }
}