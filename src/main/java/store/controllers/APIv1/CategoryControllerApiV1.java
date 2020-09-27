package store.controllers.APIv1;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import store.entities.Category;
import store.services.CategoryService;

import java.util.List;

@RestController
@RequestMapping("/api/v1/category")
public class CategoryControllerApiV1 {

    private final CategoryService categoryService;

    public CategoryControllerApiV1(CategoryService categoryService) {
        this.categoryService = categoryService;
    }

    @GetMapping
    public List<Category> getAllCategory() {
        return categoryService.findAll();
    }
}
