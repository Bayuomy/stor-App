import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:storeapp/Wedgets/Custem_Button.dart';
import 'package:storeapp/models/product_model.dart';
import 'package:storeapp/services/updat_product.dart';

import '../Wedgets/Custem_textField.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Updat_page extends StatefulWidget {
  Updat_page({Key? key}) : super(key: key);
  static String id = 'Update_page';

  @override
  State<Updat_page> createState() => _Updat_pageState();
}

class _Updat_pageState extends State<Updat_page> {
  String? image, ProductName, desc, price;
  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Update product',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: CustomTextFild(
                  onChanged: (data) {
                    ProductName = data;
                  },
                  obscureText: false,
                  hinttext: 'Product Name',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: CustomTextFild(
                  onChanged: (data) {
                    desc = data;
                  },
                  obscureText: false,
                  hinttext: 'Descreption',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: CustomTextFild(
                  inputType: TextInputType.number,
                  onChanged: (data) {
                    price = data;
                  },
                  obscureText: false,
                  hinttext: 'price',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: CustomTextFild(
                  onChanged: (data) {
                    image = data;
                  },
                  obscureText: false,
                  hinttext: 'image',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Custom_button(
                  ontap: (() async {
                    isloading = true;
                    setState(() {});
                    try {
                      await updateProduct(product);
                      print('sucsess');
                    } catch (e) {
                      print(e.toString());
                    }
                    isloading = false;
                    setState(() {});
                  }),
                  text: 'update',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel product) async {
    await UpdateProductServices().updateProduct(
        title: ProductName == null ? product.title : ProductName!,
        price: price == null ? product.price.toString() : price!,
        desc: desc == null ? product.description : desc!,
        image: image == null ? product.image : image!,
        category: product.category);
  }
}
