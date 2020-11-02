package org.ruizhu.aiblog.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.ruizhu.aiblog.model.Category;

import java.util.List;

/**
 * Created by Rui Zhu
 */
@Mapper
public interface CategoryMapper {
    List<Category> getAllCategories();

    int deleteCategoryByIds(@Param("ids") String[] ids);

    int updateCategoryById(Category category);

    int addCategory(Category category);
}
