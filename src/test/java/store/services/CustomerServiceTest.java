package store.services;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.orm.jpa.AutoConfigureDataJpa;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import store.entities.Customer;
import store.repositories.CustomerRepository;

import java.util.Optional;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.verify;

@DataJpaTest
@AutoConfigureTestDatabase(replace = AutoConfigureTestDatabase.Replace.NONE)
@ExtendWith(MockitoExtension.class)
class CustomerServiceTest {

    @Mock
    private CustomerRepository customerRepositoryMock;
    @Autowired
    private CustomerRepository customerRepository;

    private CustomerService customerService;

    String login1 = "Petr.Nikitin2@weatherford.com";
    String login2 = "zaerova@makrosplus.ru";


    @BeforeEach
    void setUp() {
        customerService = new CustomerService();
        customerService.setCustomerRepository(customerRepository);
    }

    @Test
    void customerServiceFindAllMock() {
        customerService.setCustomerRepository(customerRepositoryMock);
        customerService.findAll();
        verify(customerRepositoryMock).findAll();
    }

    @Test
    void customerServiceFindById() {
        Customer takenCustomer =
                customerService.findById(1L);
        assertThat(takenCustomer.getLogin()).isEqualTo(login1);
        assertThat(takenCustomer.getLogin()).isNotEqualTo(login2);
    }

    @Test
    void customerServiceFindByLogin() {
        Optional<Customer> takenCustomer =
                customerService.findByLogin(login1);
        assertThat(takenCustomer.get().getLogin()).isEqualTo(login1);
        assertThat(takenCustomer.get().getLogin()).isNotEqualTo(login2);
    }

    @Test
    void customerServiceLoadUserByUsername() {
        UserDetails takenDetails =
                customerService.loadUserByUsername(login1);
        System.out.println(takenDetails);
        assertThat(takenDetails.getUsername()).isEqualTo(login1);
        assertThat(takenDetails.getUsername()).isNotEqualTo(login2);
    }
}