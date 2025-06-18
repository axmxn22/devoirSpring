package com.example.busreservation.repository;

import com.example.busreservation.model.Voyage;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface VoyageRepository extends JpaRepository<Voyage, Long> {
    List<Voyage> findByVilleDepartContainingIgnoreCaseOrVilleArriveeContainingIgnoreCase(String depart, String arrivee);
}
