import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_item.dart';
import 'package:food_delivery/widgets/product_details_property.dart';

class ProductDetailsPage extends StatefulWidget {
  FoodItem foodItem;
  ProductDetailsPage({super.key, required this.foodItem});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int quantity = 1;
  

  void _increaseQuantity() {
    setState(() {
      quantity++;
    });
  }

  void _decreaseQuantity() {
    setState(() {
      if (quantity > 1) {
        quantity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        title: Text(widget.foodItem.name),
        centerTitle: true,
        //this leading property overrides the default back button
        //(the default back button is automatically loctaed in the appBar when navigation is used)
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(widget.foodItem),
        ),

        actions: [
          IconButton(
            icon: widget.foodItem.isFavorite == true
                ? const Icon(Icons.favorite, color: Colors.deepOrange)
                : const Icon(Icons.favorite_border, color: Colors.deepOrange),
            onPressed: () {
              setState(() {
                widget.foodItem = FoodItem(
                    id: widget.foodItem.id,
                    name: widget.foodItem.name,
                    imgURL: widget.foodItem.imgURL,
                    category: widget.foodItem.category,
                    price: widget.foodItem.price,
                    isFavorite: !widget.foodItem.isFavorite);
              
              });
            },
          ),
          const SizedBox(
            width: 8.0,
          )
        ],
      ),
      //main column
      body: SafeArea(
        child: Column(
          children: [
            //first child of main column
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    //the image
                    DecoratedBox(
                      decoration: BoxDecoration(color: Colors.grey[200]),
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Image.network(
                          widget.foodItem.imgURL,
                          width: double.infinity,
                          height: 300,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 24.0,
                    ),

                    //this column is used to add padding
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.foodItem.name,
                                    style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    widget.foodItem.category,
                                    style: const TextStyle(
                                        color: Colors.black45,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                              DecoratedBox(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(24)),
                                child: Row(
                                  children: [
                                    IconButton(
                                        onPressed: quantity > 1
                                            ? _decreaseQuantity
                                            : null,
                                        icon: const Icon(Icons.remove)),
                                    Text(quantity.toString()),
                                    IconButton(
                                        onPressed: _increaseQuantity,
                                        icon: const Icon(Icons.add))
                                  ],
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 28.0,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ProductDetailsProperty(
                                  title: 'Size', value: 'Medium'),
                              SizedBox(height: 40, child: VerticalDivider()),
                              ProductDetailsProperty(
                                  title: 'Calories', value: '150 Kcal'),
                              SizedBox(height: 40, child: VerticalDivider()),
                              ProductDetailsProperty(
                                  title: 'Cooking', value: '5-10 Min'),
                            ],
                          ),
                          const SizedBox(
                            height: 28.0,
                          ),
                          const Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus commodo feugiat maximus. Vivamus felis magna, faucibus nec ligula vitae, luctus dignissim mi. Sed non volutpat ex. Integer eu purus faucibus, vestibulum sapien at, consequat mi. Nulla in massa vestibulum, rhoncus neque ullamcorper, vulputate ipsum. Aliquam in ornare ante, sit amet vestibulum odio. Vestibulum pharetra, ante sed pulvinar pellentesque, nulla sapien pharetra sem, quis iaculis mauris enim id nunc. Nunc eget interdum nibh, non dictum quam. Nulla non nisl aliquam, rutrum arcu a, elementum metus. Integer.',
                            style: TextStyle(
                                color: Colors.black45,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),

            //second child of main column
            DecoratedBox(
              decoration: const BoxDecoration(color: Colors.white),
              child: Padding(
                padding: size.width > 800
                    ? EdgeInsets.symmetric(
                        horizontal: size.height * 0.08, vertical: 16)
                    : EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      //child 1 of row
                      flex: size.width > 800 ? 3 : 1,
                      child: Text(
                        '\$ ${(widget.foodItem.price * quantity).toStringAsFixed(2)}',
                        style: const TextStyle(
                            color: Colors.deepOrange,
                            fontSize: 26,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      //child 2 of row
                      flex: 1, //you dont really have to write flex:1, because
                      //the default value of flex is 1
                      child: SizedBox(
                        height: size.height * 0.052,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepOrange,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8))),
                          child: const Text(
                            'Checkout',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
