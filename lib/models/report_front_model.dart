// ignore_for_file: non_constant_identifier_names

class ReportModel {
  late final String cashier_name;
  late final String customer_name;
  late final int order_id;
  late final String order_date;
  late final int total;

  ReportModel({
    required this.cashier_name,
    required this.customer_name,
    required this.order_id,
    required this.order_date,
    required this.total,
  });

  factory ReportModel.fromJson(Map<String, dynamic> json) {
    return ReportModel(
      cashier_name: json['cashier_name'],
      customer_name: json['customer_name'],
      order_id: json['order_id'],
      order_date: json['order_date'],
      total: json['total'],
    );
  }

  get text => null;

  Map<String, dynamic> toJson() => {
        'cashier_name': cashier_name,
        'customer_name': customer_name,
        'order_id': order_id,
        'order_date': order_date,
        'total': total,
      };
}
