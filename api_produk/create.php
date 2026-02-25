<?php
header('Content-Type: application/json');
include 'konekdb.php';

$nama = $_POST['nama'];
$kode = $_POST['kode'];
$harga = $_POST['harga'];
$foto = $_POST['foto'];

$stmt = $db->prepare("INSERT INTO produk (nama, kode, harga, foto) VALUES (?, ?, ?, ?)");
$result = $stmt->execute([$nama, $kode, $harga, $foto]);

echo json_encode(['success' => $result]);
?>