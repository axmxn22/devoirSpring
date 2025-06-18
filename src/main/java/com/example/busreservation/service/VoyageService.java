package com.example.busreservation.service;

import com.example.busreservation.model.Voyage;
import com.example.busreservation.repository.VoyageRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class VoyageService {

    private final VoyageRepository voyageRepository;

    public VoyageService(VoyageRepository voyageRepository) {
        this.voyageRepository = voyageRepository;
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
        voyageRepository.deleteById(id);
    }

    public List<Voyage> search(String query) {
        return voyageRepository.findByVilleDepartContainingIgnoreCaseOrVilleArriveeContainingIgnoreCase(query, query);
    }
}
