import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/pages/homePage.dart';


import '../models/product_model.dart';
import '../services/UpdateProduct.dart';
import '../widgets/CustomButton.dart';
import '../widgets/CustomTextField.dart';

class UpdateProductPage extends StatefulWidget {
  static String id = 'update product';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productName, desc, image;

  String? price;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    ProductModel product = ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Update Product',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(product.image,height: 220,width: 150,),
                SizedBox(
                  height: 50,
                ),
                CustTextField(
                  onChanged: (data) {
                    productName = data;
                  },
                  hint: 'Product Name',
                  type: TextInputType.text,

                ),
                SizedBox(
                  height: 10,
                ),
                CustTextField(
                  onChanged: (data) {
                    desc = data;
                  },
                  hint: 'description',
                  type: TextInputType.text,

                ),
                SizedBox(
                  height: 10,
                ),
                CustTextField(
                  onChanged: (data) {
                    price = data;
                  },
                  hint: 'price',
                  type: TextInputType.number,
                ),
                SizedBox(
                  height: 10,
                ),
                CustTextField(
                  hint: 'image',
                  onChanged: (data) {
                    image = data;
                  },
                  type: TextInputType.text,
                ),
                SizedBox(
                  height: 70,
                ),
                CustomButton(
                  text: 'Update',
                  OnTap: () async {
                    isLoading = true;
                    setState(() {});
                    try {
                      Navigator.pushNamed(context, Homepage.id);

                      print('success');
                    } catch (e) {
                      print(e.toString());
                    }
                    isLoading = false;
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel product) async {
    await UpdateProductService().Updateproduct(
        id: product.id,
        title: productName == null ? product.title : productName!,
        price: price == null ? product.price.toString() : price!,
        desc: desc == null ? product.description : desc!,
        image: image == null ? product.image : image!,
        category: product.category);
  }
}