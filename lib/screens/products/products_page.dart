// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, avoid_unnecessary_containers, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_sales_report/base_url.dart';
import 'package:flutter_sales_report/models/products_model.dart';
import 'package:flutter_sales_report/screens/products/product_create.dart';
import 'package:flutter_sales_report/screens/products/product_detail.dart';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'dart:async';

class ProductsPage extends StatefulWidget {
  ProductsPage({Key? key}) : super(key: key);

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class Debouncer {
  int? milliseconds;
  VoidCallback? action;
  Timer? timer;

  run(VoidCallback action) {
    if (null != timer) {
      timer!.cancel();
    }
    timer = Timer(
      Duration(milliseconds: Duration.millisecondsPerSecond),
      action,
    );
  }
}

class _ProductsPageState extends State<ProductsPage> {
  final _debouncer = Debouncer();

  List<ProductsModel> prodList = [];
  List<ProductsModel> productList = [];

  String url = "${BaseUrl.BASE_URL}/models/products/products_list.php";

  Future<List<ProductsModel>> getProductList() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        // print(response.body);
        List<ProductsModel> products = parseJson(response.body);
        return products;
      } else {
        throw Exception("Error while getting products...");
      }
    } catch (errorMsg) {
      throw Exception(errorMsg.toString());
    }
  }

  static List<ProductsModel> parseJson(String responseBody) {
    final parsedJson =
        convert.json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsedJson
        .map<ProductsModel>((json) => ProductsModel.fromJson(json))
        .toList();
  }

  @override
  void initState() {
    super.initState();
    getProductList().then((objectApi) {
      setState(() {
        prodList = objectApi;
        productList = prodList;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              // searchbar
              Container(
                padding: EdgeInsets.all(4.0),
                child: TextField(
                  textInputAction: TextInputAction.search,
                  decoration: InputDecoration(
                    hintText: "Search products",
                    suffixIcon: InkWell(
                      child: Icon(Icons.search),
                    ),
                  ),
                  onChanged: (string) {
                    _debouncer.run(() {
                      setState(() {
                        productList = prodList
                            .where(
                              (product) =>
                                  (product.product_name.toLowerCase().contains(
                                        string.toLowerCase(),
                                      )),
                            )
                            .toList();
                      });
                    });
                  },
                ),
              ),
              // listview
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.all(4.0),
                  itemCount: productList.length,
                  itemBuilder: (BuildContext context, int position) {
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(color: Colors.grey.shade300),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            ListTile(
                              title: Text(
                                productList[position].product_name.toString(),
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                "IDR " +
                                    productList[position]
                                        .product_price
                                        .toString()
                                        .replaceAllMapped(
                                            RegExp(
                                                r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                            (Match m) => "${m[1]},"),
                                style: TextStyle(fontSize: 14.0),
                              ),
                              onTap: () {
                                // membuka detail product
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProductDetail(
                                      productsModel: productList[position],
                                    ),
                                  ),
                                );
                                // print(
                                //     productList[position]
                                //             .product_id
                                //             .toString() +
                                //         " - " +
                                //         productList[position]
                                //             .product_name
                                //             .toString() +
                                //         " - " +
                                //         productList[position]
                                //             .product_price
                                //             .toString());
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_box),
        onPressed: () {
          print("Add new product");
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => ProductCreate(),
            ),
          );
        },
      ),
    );
  }
}
