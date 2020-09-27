package store.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import store.entities.Authority;

@Repository
public interface AuthorityRepository extends JpaRepository<Authority, Long> {
}
