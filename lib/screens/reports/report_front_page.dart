// ignore_for_file: unused_import, prefer_const_constructors_in_immutables, prefer_const_constructors, avoid_print, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_sales_report/base_url.dart';
import 'package:flutter_sales_report/models/report_front_model.dart';
import 'package:flutter_sales_report/screens/reports/report_front_detail_page.dart';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'dart:async';

class ReportFrontPage extends StatefulWidget {
  ReportFrontPage({Key? key}) : super(key: key);

  @override
  State<ReportFrontPage> createState() => _ReportFrontPageState();
}

// class Debouncer {
//   int? milliseconds;
//   VoidCallback? action;
//   Timer? timer;

//   run(VoidCallback action) {
//     if (null != timer) {
//       timer!.cancel();
//     }
//     timer = Timer(
//       Duration(milliseconds: Duration.millisecondsPerSecond),
//       action,
//     );
//   }
// }

class _ReportFrontPageState extends State<ReportFrontPage> {
  late Future<List<ReportModel>> report;
  final reportListKey = GlobalKey<_ReportFrontPageState>();

  @override
  void initState() {
    super.initState();
    report = getReportList();
  }

  Future<List<ReportModel>> getReportList() async {
    final url = '${BaseUrl.BASE_URL}/list_detail.php';
    final response = await http.get(Uri.parse(url));
    final items =
        convert.json.decode(response.body).cast<Map<String, dynamic>>();

    List<ReportModel> report = items.map<ReportModel>((json) {
      return ReportModel.fromJson(json);
    }).toList();

    return report;
  }

  Future refreshReportList() async {
    await Future.delayed(Duration(seconds: 3));
    setState(() {
      getReportList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: reportListKey,
      body: RefreshIndicator(
        child: Column(
          children: <Widget>[
            Expanded(
              child: FutureBuilder(
                future: report,
                builder: (BuildContext context,
                    AsyncSnapshot<List<ReportModel>> snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) {
                    return Center(child: CircularProgressIndicator());
                  }

                  if (!snapshot.hasData || snapshot.data == null) {
                    return Container(
                      child: Text('data == null'),
                    );
                  }

                  if (snapshot.data!.isEmpty) {
                    return Container(
                      child: Text('data isEmpty'),
                    );
                  }

                  return ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int position) {
                      var data = snapshot.data![position];
                      return Card(
                        child: ListTile(
                          leading: Icon(Icons.list, color: Colors.grey[900]),
                          title: Text(
                            data.order_id.toString() +
                                " - " +
                                data.customer_name.toString(),
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.grey[900],
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          onTap: () {
                            print(data.order_id.toString() +
                                " - " +
                                data.customer_name.toString() +
                                " - " +
                                data.total.toString());
                            // membuka detail report utk setiap order
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ReportFrontDetailPage(reportModel: data),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
        onRefresh: refreshReportList,
        triggerMode: RefreshIndicatorTriggerMode.anywhere,
        color: Colors.grey,
      ),
    );
  }
}
