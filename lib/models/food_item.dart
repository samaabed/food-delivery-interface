class FoodItem {
  //nullable بتقدر تحط خصائص

  final String id;
  final String name;
  final String imgURL;
  final String category;
  final double price;
  final String estimatedTime;
  final int noOfSales;
  final bool isFavorite;

  FoodItem(
      {required this.id,
      required this.name,
      required this.imgURL,
      required this.category,
      required this.price,
      this.estimatedTime = '20 Min',
      this.noOfSales = 2,
      this.isFavorite = false});

//this function copies the attributes of the calling object,
//and changes the value of isFavorite if isFav is not null.
//you can modify the function to allow chaning the values of the other attributes
  FoodItem copyWith({bool? isFav}) {
    return FoodItem(
      //you can right: id: this.id, name: this.name ...
        id: id,
        name: name,
        imgURL: imgURL,
        category: category,
        price: price,
        estimatedTime: estimatedTime,
        noOfSales: noOfSales,
        isFavorite: isFav ?? isFavorite);
  }


  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FoodItem &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          imgURL == other.imgURL &&
          category == other.category &&
          price == other.price &&
          estimatedTime == other.estimatedTime &&
          noOfSales == other.noOfSales &&
          isFavorite == other.isFavorite;

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ imgURL.hashCode ^ category.hashCode 
                       ^ price.hashCode ^ estimatedTime.hashCode ^ noOfSales.hashCode ^ isFavorite.hashCode;


}

List<FoodItem> products = [
  FoodItem(
      id: '1',
      name: 'Fish Burger',
      imgURL: 'https://assets.stickpng.com/images/58824b29e81acb96424ffab8.png',
      category: 'Burger',
      price: 5.99),
  FoodItem(
      id: '2',
      name: 'Chicken Burger',
      imgURL:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQyctjoxVWDhdgcNX9lJJaVtdoZ9DtMQS1wCA&usqp=CAU',
      category: 'Burger',
      price: 4.99),
  FoodItem(
      id: '3',
      name: 'Beef Burger',
      imgURL:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT7OPj_W-0IguvIejeL7Jmppzl4uGnXrFGlmA&usqp=CAU',
      category: 'Burger',
      price: 6.70),
  FoodItem(
      id: '4',
      name: 'Chocolate Cookie',
      imgURL:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQeKks8rb8Yn3-cu2sP0qSaZagg6GcHsedXBQ&usqp=CAU',
      category: 'Dessert',
      price: 1.25),
  FoodItem(
      id: '5',
      name: 'Margherita Pizza',
      imgURL:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ee/Eq_it-na_pizza-margherita_sep2005_sml-2.png/640px-Eq_it-na_pizza-margherita_sep2005_sml-2.png',
      category: 'Pizza',
      price: 7.99),
  FoodItem(
      id: '6',
      name: 'Lasagna',
      imgURL:
          'https://clipart-library.com/images_k/lasagna-transparent/lasagna-transparent-11.png',
      category: 'Pasta',
      price: 4.99),
  FoodItem(
      id: '7',
      name: 'Beef Taco',
      imgURL:
          'https://static.vecteezy.com/system/resources/previews/025/280/094/original/ai-generative-beef-taco-food-with-salad-and-cheese-for-advertising-png.png',
      category: 'Taco',
      price: 2.79),
];
