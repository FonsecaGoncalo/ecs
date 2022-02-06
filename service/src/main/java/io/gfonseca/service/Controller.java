package io.gfonseca.service;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Collections;
import java.util.Map;

@RestController
public class Controller {

    public Controller() {
    }

    @GetMapping("/healthcheck")
    public Map<String, String> healthcheck() {
        return Collections.singletonMap("status", "healthy");
    }

    @GetMapping("env-vars")
    public Map<String, String> envVars() {
        return System.getenv();
    }
}
