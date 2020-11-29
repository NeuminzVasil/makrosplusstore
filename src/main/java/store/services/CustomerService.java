package store.services;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import store.entities.Authority;
import store.entities.Customer;
import store.exceptions.SearchingNotFoundException;
import store.repositories.CustomerRepository;

import java.util.Collection;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class CustomerService implements UserDetailsService {
    private CustomerRepository customerRepository;
    private AuthorityService authorityService;
    private PasswordEncoder passwordEncoder;

    @Autowired
    public void setPasswordEncoder(PasswordEncoder passwordEncoder) {
        this.passwordEncoder = passwordEncoder;
    }

    @Autowired
    public void setCustomerRepository(CustomerRepository customerRepository) {
        this.customerRepository = customerRepository;
    }

    @Autowired
    public void setRolesService(AuthorityService authorityService) {
        this.authorityService = authorityService;
    }

    public Page<Customer> findAll(Specification<Customer> spec, Pageable pageable) {
        return customerRepository.findAll(spec, pageable);
    }

    public List<Customer> findAll() {
        return customerRepository.findAll();
    }

    /**
     * найти пользователя по ID
     *
     * @param id - искомое ID
     * @return - ссылка на заказчика или исключение
     */
    public Customer findById(Long id) {
        return customerRepository.findById(id).orElseThrow(() -> new SearchingNotFoundException("Не могу найти заказчика с id =" + id));
    }

    /**
     * найти заказчика по логину
     *
     * @param login - логин заказчика
     * @return ссылка на заказчика
     */
    public Optional<Customer> findByLogin(String login) {
        return customerRepository.findByLogin(login);
    }

    /**
     * Сохранить измененную сущность заказчика в базу
     *
     * @param customer - Сущьность которую нужно сохранить
     * @param <S>      - тип Customer
     * @return - Ссылку на сохраненного заказчика
     */
    public <S extends Customer> S saveAndFlush(S customer) {
        return customerRepository.saveAndFlush(customer);
    }

/*    public boolean hasRoleAdmin(String login) {
        return findByLogin(login).getAuthorities().stream().map(authority -> authority.getAuthority()).collect(Collectors.toList()).contains("ROLE_ADMIN");
    }*/

    @Override
    @Transactional
    public UserDetails loadUserByUsername(String customerLogin) throws UsernameNotFoundException {
        Customer customer = customerRepository.findByLogin(customerLogin).orElseThrow(() ->
                new UsernameNotFoundException("Invalid username or password"));
        return new org.springframework.security.core.userdetails.User(customer.getLogin(),
                customer.getPassword(),
                mapAuthorities(customer.getAuthorities()));
    }

/*
    @Transactional
    public User save(SystemUser systemUser) {
        User user = new User();
        findByPhone(systemUser.getPhone()).ifPresent((u) -> {
            throw new RuntimeException("User with phone " + systemUser.getPhone() + " is already exist");
        });
        user.setPhone(systemUser.getPhone());
        user.setPassword(passwordEncoder.encode(systemUser.getPassword()));
        user.setFirstName(systemUser.getFirstName());
        user.setLastName(systemUser.getLastName());
        user.setEmail(systemUser.getEmail());
        user.setRoles(Arrays.asList(rolesService.findByName("ROLE_CUSTOMER")));
        return usersRepository.save(user);
    }

    private Collection<? extends GrantedAuthority> mapRolesToAuthorities(Collection<Role> roles) {
        return roles.stream().map(role -> new SimpleGrantedAuthority(role.getName())).collect(Collectors.toList());
    }*/

    private Collection<? extends GrantedAuthority> mapAuthorities(Collection<Authority> authorities) {
        return authorities
                .stream()
                .map(authority -> new SimpleGrantedAuthority(authority.getAuthority()))
                .collect(Collectors.toList());
    }



}
