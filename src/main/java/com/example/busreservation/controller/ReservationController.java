package com.example.busreservation.controller;

import com.example.busreservation.model.Client;
import com.example.busreservation.model.Reservation;
import com.example.busreservation.model.Voyage;
import com.example.busreservation.repository.ClientRepository;
import com.example.busreservation.repository.ReservationRepository;
import com.example.busreservation.repository.VoyageRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;

@Controller
@RequestMapping("/reservations")
public class ReservationController {

    private final ReservationRepository reservationRepo;
    private final ClientRepository clientRepo;
    private final VoyageRepository voyageRepo;

    public ReservationController(ReservationRepository reservationRepo, ClientRepository clientRepo, VoyageRepository voyageRepo) {
        this.reservationRepo = reservationRepo;
        this.clientRepo = clientRepo;
        this.voyageRepo = voyageRepo;
    }

    @GetMapping
    public String lister(Model model) {
        List<Reservation> reservations = reservationRepo.findAll();
        model.addAttribute("reservations", reservations);
        return "reservations";
    }

    @GetMapping("/form")
    public String form(Model model) {
        model.addAttribute("clients", clientRepo.findAll());
        model.addAttribute("voyages", voyageRepo.findAll());
        return "reservation-form";
    }

    @PostMapping("/save")
    public String enregistrer(@RequestParam Long clientId,
                              @RequestParam Long voyageId,
                              @RequestParam int nombrePlaces,
                              Model model) {

        Client client = clientRepo.findById(clientId).orElse(null);
        Voyage voyage = voyageRepo.findById(voyageId).orElse(null);

        if (client == null || voyage == null) {
            model.addAttribute("error", "Client ou voyage invalide.");
            return "reservation-form";
        }

        if (nombrePlaces > voyage.getNombrePlaces()) {
            model.addAttribute("error", "Pas assez de places disponibles.");
            model.addAttribute("clients", clientRepo.findAll());
            model.addAttribute("voyages", voyageRepo.findAll());
            return "reservation-form";
        }

        // Créer la réservation
        Reservation reservation = new Reservation();
        reservation.setClient(client);
        reservation.setVoyage(voyage);
        reservation.setNombrePlaces(nombrePlaces);
        reservation.setDateReservation(LocalDate.now());

        // Sauvegarder et MAJ les places restantes
        reservationRepo.save(reservation);
        voyage.setNombrePlaces(voyage.getNombrePlaces() - nombrePlaces);
        voyageRepo.save(voyage);

        return "redirect:/reservations";
    }
}
