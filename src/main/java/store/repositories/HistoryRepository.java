package store.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import store.entities.History;

public interface HistoryRepository extends JpaRepository<History, Long>, JpaSpecificationExecutor<History> {

}
