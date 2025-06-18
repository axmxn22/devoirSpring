package com.example.busreservation.service;

import com.example.busreservation.model.Voyage;
import com.example.busreservation.repository.ReservationRepository;
import com.example.busreservation.repository.VoyageRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class VoyageService {

    private final VoyageRepository voyageRepository;
    private final ReservationRepository reservationRepository;

    public VoyageService(VoyageRepository voyageRepository, ReservationRepository reservationRepository) {
        this.voyageRepository = voyageRepository;
        this.reservationRepository = reservationRepository;
    }

    public List<Voyage> getAll() {
        return voyageRepository.findAll();
    }

    public Voyage save(Voyage voyage) {
        return voyageRepository.save(voyage);
    }

    public Optional<Voyage> getById(Long id) {
        return voyageRepository.findById(id);
    }

    public void delete(Long id) {
        // Vérifie s’il existe des réservations liées à ce voyage
        boolean hasReservations = reservationRepository.existsByVoyageId(id);
        if (hasReservations) {
            throw new IllegalStateException("Impossible de supprimer ce voyage : des réservations sont associées.");
        }
        voyageRepository.deleteById(id);
    }

    public List<Voyage> search(String query) {
        return voyageRepository.findByVilleDepartContainingIgnoreCaseOrVilleArriveeContainingIgnoreCase(query, query);
    }
}
