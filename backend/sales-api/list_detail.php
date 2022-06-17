<?php

include("./config/headers.php");
include("./config/database.php");

// $order_id = $_POST['order_id'];

$stmt = $db->prepare("SELECT c.cashier_name, cus.customer_name, o.order_id, o.order_date, SUM(p.product_price * d.product_qty) subtotal
FROM tb_cashiers c JOIN tb_orders o ON c.cashier_id = o.fk_cashier_id
JOIN tb_orderdetails d ON o.order_id = d.fk_order_id
JOIN tb_products p ON p.product_id = d.fk_product_id
JOIN tb_customers cus ON cus.customer_id = o.fk_customer_id
GROUP BY o.order_id
ORDER BY o.order_id DESC;");
$stmt->execute();
$result = $stmt->fetchAll(PDO::FETCH_ASSOC);

echo json_encode($result);
