package store.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import store.entities.StepComment;

public interface StepCommentRepository extends JpaRepository<StepComment, Long>, JpaSpecificationExecutor<StepComment> {

}
