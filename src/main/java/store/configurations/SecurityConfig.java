package store.configurations;

import lombok.AllArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

@EnableWebSecurity //(debug = true)
@EnableGlobalMethodSecurity(prePostEnabled = true, securedEnabled = true)
//@PropertySource("classpath:ignoreMe/values.properties")
//@EnableGlobalMethodSecurity(securedEnabled = true)
@AllArgsConstructor
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    private final JwtRequestFilter jwtRequestFilter;

    @Override
    protected void configure(HttpSecurity http) throws Exception {

        http.
                csrf().disable()
                .authorizeRequests()
                .antMatchers("/api/v1/login/**").permitAll() // доступ всем
                .antMatchers("/api/v1/invoice/**").authenticated() // доступ любому авторизированному клиенту
                .antMatchers("/api/v1/history/**").authenticated() // доступ любому авторизированному клиенту
                .antMatchers("/api/v1/stepcomment/**").authenticated() // доступ любому авторизированному клиенту
                .antMatchers("/api/v1/step/**").authenticated() // доступ любому авторизированному клиенту
                .antMatchers("/api/v1/category**").hasRole("ADMIN") // доступ конкретному авторизированному через роль
                .antMatchers("/api/v1/customer**").hasRole("ADMIN") // доступ конкретному авторизированному через роль
                .antMatchers("/api/v1/nomenclature**").hasRole("ADMIN") // доступ конкретному авторизированному через роль
//                .anyRequest().permitAll() // доступ всем
                .and()
                .logout().logoutSuccessUrl("/")// когда вышли , перенаправляемся на главную страничку
                .and()
                .sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS);

        http.addFilterBefore(jwtRequestFilter, UsernamePasswordAuthenticationFilter.class);
    }

    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Override
    @Bean
    public AuthenticationManager authenticationManagerBean() throws Exception {
        return super.authenticationManagerBean();
    }
}
