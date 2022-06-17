<?php

include("../../config/headers.php");
include("../../config/database.php");

$product_id = $_POST['product_id'];

$stmt = $db->prepare("SELECT * FROM tb_products WHERE product_id = ?");
$stmt->execute([$product_id]);
$result = $stmt->fetch(PDO::FETCH_ASSOC);

echo json_encode(['result' => $result]);
