// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_sales_report/base_url.dart';
import 'package:flutter_sales_report/forms/form_page.dart';

class ProductCreate extends StatefulWidget {
  ProductCreate({Key? key}) : super(key: key);

  @override
  State<ProductCreate> createState() => _ProductCreateState();
}

class _ProductCreateState extends State<ProductCreate> {
  final formKey = GlobalKey<FormState>();

  TextEditingController productNameCtrl = TextEditingController();
  TextEditingController productPriceCtrl = TextEditingController();

  Future createProduct() async {
    final url = '${BaseUrl.BASE_URL}/models/products/product_create.php';
    return await http.post(
      Uri.parse(url),
      body: {
        "product_name": productNameCtrl.text,
        "product_price": productPriceCtrl.text,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Product"),
      ),
      body: Container(
        height: double.infinity,
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: FormPage(
              formKey: formKey,
              productNameCtrl: productNameCtrl,
              productPriceCtrl: productPriceCtrl,
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(primary: Colors.red),
          onPressed: () {
            if (formKey.currentState!.validate()) {
              onConfirmSaveProduct(context);
            }
          },
          child: Text(
            'Save Product',
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  void onConfirmSaveProduct(context) async {
    await createProduct();
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
  }
}
