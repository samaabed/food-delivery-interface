import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_item.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;

    return ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          if (products[index].isFavorite == true) {
            debugPrint(products[index].name);
            return Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: Image.network(
                    products[index].imgURL,
                    width: 70,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  title: Text(
                    products[index].name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    '${products[index].category} - \$${products[index].price}',
                    style: const TextStyle(fontSize: 14),
                  ),
                  //trailing of list tile
                  trailing: orientation == Orientation.portrait
                      ? IconButton(
                          icon: const Icon(Icons.favorite),
                          onPressed: () {setState(() {
                            
                          });},
                          color: Colors.deepOrange,
                        )
                      : TextButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.favorite_border_outlined),
                          label: const Text('Favorite'),
                          style: TextButton.styleFrom(
                              foregroundColor: Colors.deepOrange),
                        ),
                ),
              ),
            );
          }else{
            return null;
          }
        });
  }
}
