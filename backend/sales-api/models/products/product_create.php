<?php

include("../../config/headers.php");
include("../../config/database.php");

$product_name = $_POST['product_name'];
$product_price = $_POST['product_price'];

$stmt = $db->prepare("INSERT INTO tb_products(product_name, product_price) VALUES(?, ?)");
$result = $stmt->execute([$product_name, $product_price]);

echo json_encode(['success' => $result]);
