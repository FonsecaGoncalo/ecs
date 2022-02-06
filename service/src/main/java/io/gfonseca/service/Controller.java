package io.gfonseca.service;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class Controller {

    public Controller() {
    }

    @GetMapping("/healthcheck")
    public String healthcheck() {
        return "ok!!!";
    }
}
