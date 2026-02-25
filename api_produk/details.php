<?php
header('Content-Type: application/json');
include 'konekdb.php';

// Pastikan variabel koneksi menggunakan yang benar dari konekdb.php
$id = isset($_POST['id']) ? (int)$_POST['id'] : 0;

if ($id > 0) {
    // Menggunakan variabel $db agar konsisten dengan file sebelumnya
    $stmt = $db->prepare("SELECT * FROM produk WHERE id = ?");
    $stmt->execute([$id]);
    $result = $stmt->fetch(PDO::FETCH_ASSOC);
    
    if ($result) {
        echo json_encode($result);
    } else {
        echo json_encode(['message' => 'Data tidak ditemukan']);
    }
}
?>