// ignore_for_file: prefer_const_constructors_in_immutables, must_be_immutable, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late TextEditingController productNameCtrl;
  late TextEditingController productPriceCtrl;

  FormPage({
    required this.formKey,
    required this.productNameCtrl,
    required this.productPriceCtrl,
  });

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  // validasi
  String? _validateString(String? value) {
    if (value!.length < 8) return 'Product name at least 8 characters!';
    return null;
  }

  String? _validateNumber(String? value) {
    Pattern pattern = r'(?<=\s|^)\d+(?=\s|$)';
    RegExp regExp = RegExp(pattern.toString());
    if (!regExp.hasMatch(value!)) return 'Please number only!';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            controller: widget.productNameCtrl,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: "Enter product name"),
            style: TextStyle(fontSize: 24.0, color: Colors.black87),
            validator: _validateString,
          ),
          Padding(padding: EdgeInsets.all(12.0)),
          TextFormField(
            controller: widget.productPriceCtrl,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: "Enter product price"),
            style: TextStyle(fontSize: 24.0, color: Colors.black87),
            validator: _validateNumber,
          ),
          Padding(padding: EdgeInsets.all(12.0)),
        ],
      ),
    );
  }
}
