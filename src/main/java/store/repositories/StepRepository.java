package store.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import store.entities.Step;

public interface StepRepository extends JpaRepository<Step, Long>, JpaSpecificationExecutor<Step> {

}
