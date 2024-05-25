
import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_item.dart';
import 'package:food_delivery/models/category_item.dart';
import 'package:food_delivery/pages/product_details_page.dart';
import 'package:food_delivery/widgets/product_items_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  _HomePageState(){

  }

    int? selectedCategoryIndex;
  late List<FoodItem> filteredProducts;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    //when opening the home page for the first time, wait
    //2 seconds then change the value of isLoading to false.
    Future.delayed(const Duration(seconds: 2),(){
      setState(() {
        isLoading = false;
      });
    });
    //note: delayed() takes two things:
    //1. duration (required): the length of the delay
    //2. a function (optional): the function that should be performed after the delay

    filteredProducts = products;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    final size = MediaQuery.of(context).size;

    if(isLoading){
      //if isLoading is true, a loading page will be shown
      return const Center(
        child: CircularProgressIndicator(),
        //or child: CircularProgressIndicator.adaptive() 
        //عشان يعرض شكل التحميل حسب الحوال ابل ولا اندرويد
      );
    }

    //if isLoading is false, the original page will be shown
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
          child: Column(
            children: [
              //app bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(6.0),
                        child: Icon(Icons.menu),
                      )),
                   Column(
                    children: [
                      Text(
                        'Current location',
                        style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          color: Colors.grey
                        ),
                      ),
                      const Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 20,
                            color: Colors.green,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Jenin, Palestine',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          )
                        ],
                      )
                    ],
                  ),
                  DecoratedBox(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6.0)),
                      child: const Padding(
                        padding: EdgeInsets.all(6.0),
                        child: Icon(Icons.notifications),
                      ))
                ],
              )

              //banner
              ,
              const SizedBox(height: 30.0),
              ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.network(
                    'https://marketplace.canva.com/EAFVfgsKMAE/1/0/1600w/canva-black-and-yellow-simple-minimalist-burger-promotion-banner-YTqWS2eL8TM.jpg',
                    height: size.width > 800
                        ? size.height * 0.58
                        : size.height * 0.2,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  )),

              const SizedBox(
                height: 30.0,
              ),

              //text field
              TextField(
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    hintText: 'Find your food...',
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none)),
              ),

              const SizedBox(
                height: 30.0,
              ),

              //categories
              SizedBox(
                height: orientation == Orientation.landscape
                    ? size.height * 0.32
                    : size.height * 0.15,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsetsDirectional.only(end: 16.0),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              if (selectedCategoryIndex == null ||
                                  selectedCategoryIndex != index) {
                                selectedCategoryIndex = index;
                              } else {
                                selectedCategoryIndex = null;
                                filteredProducts = products;
                              }
                            }); //set state

                            if (selectedCategoryIndex != null) {
                              final selectedCategory =
                                  categories[selectedCategoryIndex!];
                              filteredProducts = products
                                  .where((product) =>
                                      product.category == selectedCategory.name)
                                  .toList();
                            }
                          }, //on tap
                          child: Container(
                            decoration: BoxDecoration(
                                color: index == selectedCategoryIndex
                                    ? Colors.deepOrange
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(16.0)),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    categories[index].assetPath,
                                    height: 50,
                                    width: 50,
                                    color: index == selectedCategoryIndex
                                        ? Colors.white
                                        : null,
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Text(
                                    categories[index].name,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: index == selectedCategoryIndex
                                            ? Colors.white
                                            : Colors.black54),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),

              const SizedBox(
                height: 30.0,
              ),

              //food items
              GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: size.width > 1100
                          ? 5
                          : size.width > 800
                              ? 4
                              : 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: filteredProducts.length,
                  itemBuilder: (context, index) {
                    debugPrint('${products[index].isFavorite}');
                    return LayoutBuilder(builder: (context, constraints) {
                      return InkWell(
                        onTap: () async{
                          filteredProducts[index]  = await Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ProductDetailsPage(
                                    foodItem: filteredProducts[index],
                                  )));
                          setState(() {
                            
                          });
                     
                        },
                        child: ProductItemWidget(
                          constraints: constraints,
                          index: index,
                          filteredProducts: filteredProducts,
                        ),
                      );
                    });
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
