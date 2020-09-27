package store.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import store.entities.Category;
import store.repositories.CategoryRepository;

import java.util.List;


@Service
public class CategoryService {
    private CategoryRepository categoryRepository;

    public CategoryService() {
    }

    @Autowired
    public CategoryService(CategoryRepository categoryRepository) {
        this.categoryRepository = categoryRepository;
    }

    @Autowired
    public void setCategoryRepository(CategoryRepository categoryRepositoryDB) {
        this.categoryRepository = categoryRepositoryDB;
    }

    /**
     * получить все товары
     *
     * @param spec     спецификация для фильтра
     * @param pageable - страница для фильтра
     * @return Page<Category>
     */
    public Page<Category> findAll(Specification<Category> spec, Pageable pageable) {
        return categoryRepository.findAll(spec, pageable);
    }

    /**
     * получить все товары
     *
     * @return Page<Category>
     */
    public List<Category> findAll() {
        return categoryRepository.findAll();
    }
}
