// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_sales_report/base_url.dart';
import 'package:flutter_sales_report/models/products_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_sales_report/forms/form_page.dart';

class ProductEdit extends StatefulWidget {
  final ProductsModel productsModel;

  ProductEdit({required this.productsModel});

  @override
  State<ProductEdit> createState() => _ProductEditState();
}

class _ProductEditState extends State<ProductEdit> {
  final formKey = GlobalKey<FormState>();

  TextEditingController productNameCtrl = TextEditingController();
  TextEditingController productPriceCtrl = TextEditingController();

  Future updateProduct() async {
    final url = '${BaseUrl.BASE_URL}/models/products/product_update.php';
    return await http.post(
      Uri.parse(url),
      body: {
        "product_id": widget.productsModel.product_id.toString(),
        "product_name": productNameCtrl.text,
        "product_price": productPriceCtrl.text,
      },
    );
  }

  @override
  void initState() {
    super.initState();
    productNameCtrl = TextEditingController(
        text: widget.productsModel.product_name.toString());
    productPriceCtrl = TextEditingController(
        text: widget.productsModel.product_price.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Edit Product ID: ${widget.productsModel.product_id.toString()}"),
      ),
      body: Container(
        height: double.infinity,
        padding: EdgeInsets.all(8.0),
        child: FormPage(
          formKey: formKey,
          productNameCtrl: productNameCtrl,
          productPriceCtrl: productPriceCtrl,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(primary: Colors.red),
          onPressed: () {
            if (formKey.currentState!.validate()) {
              onConfirmUpdateProduct(context);
            }
          },
          child: Text(
            'Update Product',
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  void onConfirmUpdateProduct(context) async {
    await updateProduct();
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
  }
}
