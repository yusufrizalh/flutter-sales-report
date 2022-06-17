<?php

include("../../config/headers.php");
include("../../config/database.php");

$product_id = $_POST['product_id'];

$stmt = $db->prepare("DELETE FROM tb_products WHERE product_id = ?");
$result = $stmt->execute([$product_id]);

echo json_encode(['product_id' => $product_id, 'success' => $result]);
