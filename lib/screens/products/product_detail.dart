// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_const_constructors, avoid_print, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_sales_report/models/products_model.dart';
import 'package:flutter_sales_report/screens/products/product_edit.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_sales_report/base_url.dart';

class ProductDetail extends StatefulWidget {
  final ProductsModel productsModel;

  ProductDetail({required this.productsModel});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  void confirmDelete(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text("Are you sure want to delete?"),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Icon(Icons.cancel),
              style: ElevatedButton.styleFrom(primary: Colors.grey.shade400),
            ),
            ElevatedButton(
              onPressed: () => deleteProduct(context),
              child: Icon(Icons.check),
              style: ElevatedButton.styleFrom(primary: Colors.red.shade700),
            ),
          ],
        );
      },
    );
  }

  void deleteProduct(context) async {
    final url = "${BaseUrl.BASE_URL}/models/products/products_delete.php";
    await http.post(
      Uri.parse(url),
      body: {
        'product_id': widget.productsModel.product_id.toString(),
      },
    );
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Detail - ${widget.productsModel.product_id}'),
        actions: <Widget>[
          IconButton(
            onPressed: (() => confirmDelete(context)),
            icon: Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Product Name: ${widget.productsModel.product_name}",
                  style: TextStyle(fontSize: 16.0),
                ),
                Padding(padding: EdgeInsets.all(8.0)),
                Text(
                  "Product Price: IDR. ${widget.productsModel.product_price.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => "${m[1]},")}",
                  style: TextStyle(fontSize: 16.0),
                ),
                Padding(padding: EdgeInsets.all(8.0)),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.edit),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => ProductEdit(
                productsModel: widget.productsModel,
              ),
            ),
          );
        },
      ),
    );
  }
}
