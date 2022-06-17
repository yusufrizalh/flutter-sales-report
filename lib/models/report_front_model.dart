// ignore_for_file: non_constant_identifier_names

class ReportModel {
  late final String cashier_name;
  late final String customer_name;
  late final int order_id;
  late final String order_date;
  late final int subtotal;

  ReportModel({
    required this.cashier_name,
    required this.customer_name,
    required this.order_id,
    required this.order_date,
    required this.subtotal,
  });

  factory ReportModel.fromJson(Map<String, dynamic> json) {
    return ReportModel(
      cashier_name: json['cashier_name'],
      customer_name: json['customer_name'],
      order_id: json['order_id'],
      order_date: json['order_date'],
      subtotal: json['subtotal'],
    );
  }

  get text => null;

  Map<String, dynamic> toJson() => {
        'cashier_name': cashier_name,
        'customer_name': customer_name,
        'order_id': order_id,
        'order_date': order_date,
        'subtotal': subtotal,
      };
}
