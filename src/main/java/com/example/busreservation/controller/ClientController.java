package com.example.busreservation.controller;

import com.example.busreservation.model.Client;
import com.example.busreservation.repository.ClientRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/clients")
public class ClientController {

    private final ClientRepository clientRepository;

    public ClientController(ClientRepository clientRepository) {
        this.clientRepository = clientRepository;
    }

    @GetMapping
    public String listerClients(Model model) {
        model.addAttribute("clients", clientRepository.findAll());
        return "clients";
    }

    @GetMapping("/form")
    public String afficherFormulaire(Model model) {
        model.addAttribute("client", new Client());
        return "client-form";
    }

    @PostMapping("/save")
    public String enregistrerClient(@ModelAttribute Client client) {
        clientRepository.save(client);
        return "redirect:/clients";
    }
}
