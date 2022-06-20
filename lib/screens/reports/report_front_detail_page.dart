// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors, avoid_print, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_sales_report/base_url.dart';
import 'package:flutter_sales_report/models/report_front_model.dart';
import 'package:flutter_sales_report/models/report_products_by_order.dart';

import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class ReportFrontDetailPage extends StatefulWidget {
  late final ReportModel reportModel;

  ReportFrontDetailPage({required this.reportModel});

  @override
  State<ReportFrontDetailPage> createState() => _ReportFrontDetailPageState();
}

class _ReportFrontDetailPageState extends State<ReportFrontDetailPage> {
  // menampilkan detail order: semua products dalam satu order
  late Future<List<ReportProductsByOrder>> reportProductsByOrder;
  final reportProductsByOrderListKey = GlobalKey<_ReportFrontDetailPageState>();

  // menampilkan semua data products by order_id diawal
  @override
  void initState() {
    super.initState();
    reportProductsByOrder = getReportProductsByOrder();
  }

  Future<List<ReportProductsByOrder>> getReportProductsByOrder() async {
    final url =
        "${BaseUrl.BASE_URL}/list_products_by_order.php?order_id=${widget.reportModel.order_id}";
    // final url =
    //     "https://fluttersalesreport.000webhostapp.com/sales-api/list_products_by_order.php?order_id=${widget.reportModel.order_id}";
    final response = await http.get(Uri.parse(url));

    final items =
        convert.json.decode(response.body).cast<Map<String, dynamic>>();

    List<ReportProductsByOrder> reportProductsByOrder =
        items.map<ReportProductsByOrder>((json) {
      return ReportProductsByOrder.fromJson(json);
    }).toList();

    return reportProductsByOrder;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order ID - ${widget.reportModel.order_id.toString()}"),
      ),
      body: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(color: Colors.grey.shade400),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(padding: EdgeInsets.only(top: 16.0)),
            ListTile(
              leading: Icon(Icons.list),
              title: Text(
                "Order Date: ${widget.reportModel.order_date.toString()}",
                style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(padding: EdgeInsets.all(2.0)),
            ListTile(
              leading: Icon(Icons.list),
              title: Text(
                "Cashier: ${widget.reportModel.cashier_name.toString()}",
                style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(padding: EdgeInsets.all(2.0)),
            ListTile(
              leading: Icon(Icons.list),
              title: Text(
                "Customer: ${widget.reportModel.customer_name.toString()}",
                style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 12.0, bottom: 12.0)),
            Expanded(
              child: FutureBuilder(
                future: reportProductsByOrder,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int position) {
                      var data = snapshot.data[position];
                      return ListTile(
                        // leading:
                        //     Icon(Icons.radio_button_on, color: Colors.grey),
                        title: Text(
                          data.product_name.toString(),
                          style: TextStyle(
                              fontSize: 14.0, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text("Price: " +
                            data.product_price.toString().replaceAllMapped(
                                RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                (Match m) => "${m[1]},") +
                            " - Qty: " +
                            data.product_qty.toString() +
                            " - Subtotal: " +
                            data.subtotal.toString().replaceAllMapped(
                                RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                (Match m) => "${m[1]},")),
                      );
                    },
                  );
                },
              ),
            ),
            Padding(padding: EdgeInsets.all(2.0)),
            Text(
              "TOTAL: IDR ${widget.reportModel.subtotal.toStringAsFixed(2).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => "${m[1]},")}",
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 24.0)),
          ],
        ),
      ),
    );
  }
}
