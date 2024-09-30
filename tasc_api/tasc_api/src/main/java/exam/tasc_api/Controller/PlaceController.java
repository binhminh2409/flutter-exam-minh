package exam.tasc_api.Controller;

import exam.tasc_api.Dto.PlaceDto;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Arrays;
import java.util.Date;
import java.util.List;

@RestController
@RequestMapping("/api/v1/places")
@CrossOrigin(origins = "http://localhost:56477")
public class PlaceController {
    @GetMapping("/")
    public List<PlaceDto> findAll() {
        System.out.println("API fetched at" + new Date());
        return Arrays.asList(
                new PlaceDto(1L, "Da Nang", "https://i.imgur.com/hE6IFOc.jpeg"),
                new PlaceDto(2L, "Hoi An", ""),
                new PlaceDto(3L, "Ha Noi", "https://i.imgur.com/CwabfEW.jpeg")
        );
    }
}
