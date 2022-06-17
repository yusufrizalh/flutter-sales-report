<?php

include("../../config/headers.php");
include("../../config/database.php");

$product_id = $_POST['product_id'];
$product_name = $_POST['product_name'];
$product_price = $_POST['product_price'];

$stmt = $db->prepare("UPDATE tb_products SET product_name = ?, product_price = ? WHERE product_id = ?");
$result = $stmt->execute([$product_name, $product_price, $product_id]);

echo json_encode(['success' => $result]);
