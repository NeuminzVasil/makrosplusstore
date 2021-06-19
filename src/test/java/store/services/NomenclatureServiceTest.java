package store.services;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.ArgumentCaptor;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import store.entities.Customer;
import store.entities.Nomenclature;
import store.repositories.NomenclatureRepository;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.verify;

@DataJpaTest
@AutoConfigureTestDatabase(replace = AutoConfigureTestDatabase.Replace.NONE)
@ExtendWith(MockitoExtension.class)
class NomenclatureServiceTest {

    @Autowired
    private NomenclatureRepository nomenclatureRepository;
    @Mock
    private NomenclatureRepository nomenclatureRepositoryMock;
    private NomenclatureService nomenclatureService;
    String nomenclature1 = "124A (Q6000A) Черный";
    String nomenclature2 = "test";

    @BeforeEach
    void setUp() {
        nomenclatureService = new NomenclatureService(nomenclatureRepository);
    }

    @Test
    void nomenclatureServiceFindAllMock() {
        nomenclatureService.setNomenclatureRepository(nomenclatureRepositoryMock);
        nomenclatureService.findAll();
        verify(nomenclatureRepositoryMock).findAll();
    }

    @Test
    void nomenclatureServiceFindById() {

        Nomenclature takenNomenclature =
                nomenclatureService.findById(1L);

        assertThat(takenNomenclature.getNomenclature()).isEqualTo(nomenclature1);
        assertThat(takenNomenclature.getNomenclature()).isNotEqualTo(nomenclature2);
    }

    @Test
    void nomenclatureServiceSave() {
        nomenclatureService.setNomenclatureRepository(nomenclatureRepositoryMock);
        Nomenclature nomenclature = new Nomenclature("TestNomenclatureName", 1000.1F);
        nomenclature.setComment("testing");
        nomenclatureService.save(nomenclature);
        ArgumentCaptor <Nomenclature> argumentCaptor = ArgumentCaptor.forClass(Nomenclature.class);
        verify(nomenclatureRepositoryMock).saveAndFlush(argumentCaptor.capture());
        Nomenclature capturedNomenclature = argumentCaptor.getValue();
        assertThat(capturedNomenclature).isEqualTo(nomenclature);
    }

}