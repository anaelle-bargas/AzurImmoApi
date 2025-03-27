package bts.sio.azurimmo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication
public class AzurimmoApplication extends SpringBootServletInitializer {
  
    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(AzurimmoApplication.class);
    }

    public static void main(String[] args) {
        SpringApplication.run(AzurimmoApplication.class, args);
    }
}
