class CategoryItem {
  final String id;
  final String name;
  final String assetPath;

  CategoryItem({required this.id, required this.name, required this.assetPath});
}

List<CategoryItem> categories = [
  CategoryItem(id: '1', name: 'Burger', assetPath: 'assets/images/burger.png'),
  CategoryItem(id: '3', name: 'Pizza', assetPath: 'assets/images/pizza.png'),
  CategoryItem(id: '4', name: 'Pasta', assetPath: 'assets/images/spaghetti.png'),
  CategoryItem(id: '5', name: 'Taco', assetPath: 'assets/images/taco.png'),
  CategoryItem(id: '2', name: 'Dessert', assetPath: 'assets/images/dessert.png'),

];