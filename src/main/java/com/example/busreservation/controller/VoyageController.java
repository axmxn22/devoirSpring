package com.example.busreservation.controller;

import com.example.busreservation.model.Voyage;
import com.example.busreservation.service.VoyageService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@Controller
@RequestMapping("/voyages")
public class VoyageController {

    private final VoyageService voyageService;

    public VoyageController(VoyageService voyageService) {
        this.voyageService = voyageService;
    }

    @GetMapping
    public String listerVoyages(@RequestParam(name = "recherche", required = false) String recherche, Model model) {
        if (recherche != null && !recherche.isEmpty()) {
            model.addAttribute("voyages", voyageService.search(recherche));
        } else {
            model.addAttribute("voyages", voyageService.getAll());
        }
        return "voyages";
    }

    @GetMapping("/form")
    public String formulaireAjout(Model model) {
        model.addAttribute("voyage", new Voyage());
        return "voyage-form";
    }

    @GetMapping("/edit/{id}")
    public String formulaireModif(@PathVariable Long id, Model model) {
        Optional<Voyage> voyage = voyageService.getById(id);
        if (voyage.isPresent()) {
            model.addAttribute("voyage", voyage.get());
            return "voyage-form";
        }
        return "redirect:/voyages";
    }

    @PostMapping("/save")
    public String enregistrer(@ModelAttribute Voyage voyage) {
        voyageService.save(voyage);
        return "redirect:/voyages";
    }

    @GetMapping("/delete/{id}")
    public String supprimer(@PathVariable Long id) {
        voyageService.delete(id);
        return "redirect:/voyages";
    }
}
