package store.repositories;

import org.junit.jupiter.api.Test;

import static org.assertj.core.api.Assertions.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import store.entities.Customer;

import java.util.Optional;

@DataJpaTest
@AutoConfigureTestDatabase(replace = AutoConfigureTestDatabase.Replace.NONE)
class CustomerRepositoryTest {

    @Autowired
    private CustomerRepository customerRepository;

    @Test
    void customerRepositoryFindByLogin() {
        String login1 = "Petr.Nikitin2@weatherford.com";
        String login2 = "zaerova@makrosplus.ru";

        Optional<Customer> takenCustomer =
                customerRepository.findByLogin(login1);

        assertThat(takenCustomer.get().getLogin()).isEqualTo(login1);

        takenCustomer =
                customerRepository.findByLogin(login2);

        assertThat(takenCustomer.get().getLogin()).isEqualTo(login2);
        assertThat(takenCustomer.get().getLogin()).isNotEqualTo(login1);

    }

    @Test
    void customerRepositoryFindById() {
        String login = "Petr.Nikitin2@weatherford.com";

        Optional<Customer> takenCustomer =
                customerRepository.findById(1L);

        assertThat(takenCustomer.get().getLogin()).isEqualTo(login);
    }

}