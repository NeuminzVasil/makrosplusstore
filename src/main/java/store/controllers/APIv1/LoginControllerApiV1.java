package store.controllers.APIv1;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.*;
import store.configurations.JwtTokenUtil;
import store.entities.Customer;
import store.entities.dto.JwtRequest;
import store.entities.dto.JwtResponse;
import store.exceptions.JulyMarketError;
import store.services.CustomerService;

import java.util.List;

@RestController
@RequestMapping("/api/v1/login")
public class LoginControllerApiV1 {

    private final CustomerService customerService;
    private final JwtTokenUtil jwtTokenUtil;
    private final AuthenticationManager authenticationManager;

    public LoginControllerApiV1(CustomerService customerService,
                                JwtTokenUtil jwtTokenUtil,
                                AuthenticationManager authenticationManager) {
        this.customerService = customerService;
        this.jwtTokenUtil = jwtTokenUtil;
        this.authenticationManager = authenticationManager;
    }

    /**
     * Метод получения списка всех пользователей
     * для отображения на соответствующей страничке
     *
     * @return customerService.findAll()
     */
    @GetMapping
    public List<Customer> findAllCustomers() {
        return customerService.findAll();
    }

    /**
     * Метод обработки Аутентификации (ввода Логина\Пароля)
     *
     * @param authRequest - JwtRequest - запрос от фронта
     * @return ResponseEntity.ok(new JwtResponse ( token)); ответ от бека. Возвращается Token клиенту.
     * @throws Exception
     */
    @PostMapping
    public ResponseEntity<?> createAuthToken(@RequestBody JwtRequest authRequest) throws Exception {
        try {
            authenticationManager.authenticate(
                    new UsernamePasswordAuthenticationToken(authRequest.getUsername(),
                            authRequest.getPassword()));
        } catch (BadCredentialsException ex) {
            return new ResponseEntity<>(new JulyMarketError(HttpStatus.UNAUTHORIZED.value(),
                    "Incorrect username or password"),
                    HttpStatus.UNAUTHORIZED);
        }
        UserDetails userDetails = customerService.loadUserByUsername(authRequest.getUsername());
        String token = jwtTokenUtil.generateToken(userDetails);
        System.err.println("createAuthToken-TOKEN:" + token);
        userDetails.getAuthorities().forEach(grantedAuthority -> System.err.println(grantedAuthority.getAuthority()));
        return ResponseEntity.ok(new JwtResponse(token));
    }
}
