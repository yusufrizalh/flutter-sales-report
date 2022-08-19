<?php

include("../../config/headers.php");
include("../../config/database.php");

$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
$product_id = $_GET['product_id'];

$stmt = $db->prepare("SELECT * FROM tb_products WHERE product_id = ?");
$stmt->execute(array($product_id));
$result = $stmt->fetchAll(PDO::FETCH_ASSOC);

print_r($result);
// echo json_encode(['result' => $result]);
