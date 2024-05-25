import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:food_delivery/widgets/orders_coupons_widget.dart';
import 'package:food_delivery/widgets/profile_list_tile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 24.0,
              ),
              CircleAvatar(
                radius:
                    size.width > 800 ? size.height * 0.2 : size.height * 0.12,
                backgroundImage: const NetworkImage(
                    'https://icones.pro/wp-content/uploads/2021/02/icone-utilisateur-orange.png'),
              ),
              const SizedBox(
                height: 24.0,
              ),
              const Text(
                'Sama Abed',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 8.0,
              ),
              const Text(
                'Computer Systems Engineer',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black45),
              ),
              const SizedBox(
                height: 24.0,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OrdersCouponsWidget(
                    title: 'Orders',
                    value: 12,
                  ),
                  SizedBox(height: 50, child: VerticalDivider()),
                  OrdersCouponsWidget(
                    title: 'Coupons',
                    value: 3,
                  )
                ],
              ),
              //if paltform is not ios
              if (!Platform.isIOS) ...[
                const SizedBox(
                  height: 24.0,
                ),
                const Divider(
                  indent: 20,
                  endIndent: 20,
                ),
                const ProfileListTile(
                    leadingIcon: Icons.shopping_cart_outlined, title: 'Orders'),
                const Divider(
                  indent: 20,
                  endIndent: 20,
                ),
                const ProfileListTile(
                    leadingIcon: Icons.card_giftcard, title: 'Coupons'),
                const Divider(
                  indent: 20,
                  endIndent: 20,
                ),
              ],
              //if patform is ios
              if (Platform.isIOS) ...[
                CupertinoListSection(
                  children: const [
                    SizedBox(
                      height: 24.0,
                    ),
                    Divider(
                      indent: 20,
                      endIndent: 20,
                    ),
                    ProfileListTile(
                        leadingIcon: Icons.shopping_cart_outlined,
                        title: 'Orders'),
                    Divider(
                      indent: 20,
                      endIndent: 20,
                    ),
                    ProfileListTile(
                        leadingIcon: Icons.card_giftcard, title: 'Coupons'),
                    Divider(
                      indent: 20,
                      endIndent: 20,
                    ),
                  ],
                )
              ]
            ],
          ),
        ),
      ),
    );
  }
}
