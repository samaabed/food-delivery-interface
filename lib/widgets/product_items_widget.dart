import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_item.dart';

class ProductItemWidget extends StatefulWidget {
  //لما جبنا كود العنصر من الهوم بيج نحتاج
  //ان نمرر له هذه القيم
  final BoxConstraints constraints;
  final int index;
  final List<FoodItem> filteredProducts;

  const ProductItemWidget(
      {super.key,
      required this.constraints,
      required this.index,
      required this.filteredProducts});

  @override
  State<ProductItemWidget> createState() => _ProductItemWidgetState();
}

class _ProductItemWidgetState extends State<ProductItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8.0)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            //first child of stack
            Column(
              children: [
                Image.network(
                  widget.filteredProducts[widget.index].imgURL,
                  //height: 100,
                  height: widget.constraints.maxHeight * 0.5,
                ),
                Text(
                  widget.filteredProducts[widget.index].name,
                  style: TextStyle(
                      fontSize: widget.constraints.maxHeight * 0.1,
                      //fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  widget.filteredProducts[widget.index].category,
                  style: const TextStyle(color: Colors.grey),
                ),
                Text(
                  '\$ ${widget.filteredProducts[widget.index].price}',
                  style: TextStyle(
                      //fontSize: 14,
                      fontSize: widget.constraints.maxHeight * 0.09,
                      color: Colors.deepOrange,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            //second child of stack
            PositionedDirectional(
              top: 0,
              end: 0,
              child: IconButton(
                  onPressed: () {
                    //this set state will cause the ProductItemsWIdget to rebuild,
                    //instead of rebuilding all of the home page
                    setState(() {
                      //to favorit/sidfavorite an item

                      final selectedFoodItemIndex = products
                          .indexOf(widget.filteredProducts[widget.index]);

                      products[selectedFoodItemIndex] =
                          widget.filteredProducts[widget.index].copyWith(
                              isFav: !widget
                                  .filteredProducts[widget.index].isFavorite);

                      //if (selectedCategoryIndex != null) {
                      if (widget.filteredProducts != products) {
                        widget.filteredProducts[widget.index] =
                            widget.filteredProducts[widget.index].copyWith(
                                isFav: !widget
                                    .filteredProducts[widget.index].isFavorite);
                      }
                    });
                  },
                  icon: Icon(
                    widget.filteredProducts[widget.index].isFavorite == false
                        ? Icons.favorite_border
                        : Icons.favorite,
                    color: Colors.deepOrange,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
