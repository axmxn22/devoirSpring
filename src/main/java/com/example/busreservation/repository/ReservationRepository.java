package com.example.busreservation.repository;

import com.example.busreservation.model.Reservation;
import com.example.busreservation.model.Client;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ReservationRepository extends JpaRepository<Reservation, Long> {
    List<Reservation> findByClient(Client client);
}
