import 'package:news_app/models/category_model.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> categories = <CategoryModel>[];
  CategoryModel categoryModel = new CategoryModel();

  //1
  categoryModel.categoryName = "Business";
  categoryModel.imageUrl =
      "https://images.unsplash.com/photo-1621378864046-0122e4a415a5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80";
  categories.add(categoryModel);

  //2
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Health";
  categoryModel.imageUrl =
      "https://images.unsplash.com/photo-1607619056574-7b8d3ee536b2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1240&q=80";
  categories.add(categoryModel);

//3
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Sports";
  categoryModel.imageUrl =
      "https://images.unsplash.com/photo-1517649763962-0c623066013b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80";
  categories.add(categoryModel);

  //3
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Science";
  categoryModel.imageUrl =
      "https://images.unsplash.com/photo-1556302132-40bb13638500?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fG1hdGh8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60";
  categories.add(categoryModel);

  return categories;
}
