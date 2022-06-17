<?php

include("../../config/headers.php");
include("../../config/database.php");

$stmt = $db->prepare("SELECT * FROM tb_cashiers");
$stmt->execute();
$result = $stmt->fetchAll(PDO::FETCH_ASSOC);

echo json_encode($result);
