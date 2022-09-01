import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:storeapp/models/product_model.dart';
import 'package:storeapp/services/get_all_product_services.dart';

import '../Wedgets/Custom_wedget_cart.dart';

class Home_page extends StatelessWidget {
  const Home_page({Key? key}) : super(key: key);
  static String id = 'Home_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'New Trend',
            style: const TextStyle(color: Colors.black),
          ),
          elevation: 0,
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                FontAwesomeIcons.cartPlus,
                color: Colors.black,
              ),
            )
          ],
        ),
        body: Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              top: 65,
            ),
            child: FutureBuilder<List<ProductModel>>(
                future: AllProductsServices().getAllProducts(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<ProductModel> products = snapshot.data!;

                    return GridView.builder(
                        itemCount: products.length,
                        clipBehavior: Clip.none,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.3,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 100,
                        ),
                        itemBuilder: (context, index) => Custom_Card(
                              product: products[index],
                            ));
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                })));
  }
}
