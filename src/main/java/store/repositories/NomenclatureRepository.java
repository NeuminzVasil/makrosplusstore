package store.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import store.entities.Nomenclature;

public interface NomenclatureRepository extends JpaRepository<Nomenclature, Long>, JpaSpecificationExecutor<Nomenclature> {


}
