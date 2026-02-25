<?php
// Menambahkan header agar bisa diakses dari Flutter (Web/Emulator)
header("Access-Control-Allow-Origin: *");
header('Content-Type: application/json; charset=UTF-8');
include 'konekdb.php';

// Pastikan ID ada dan merupakan angka
$id = isset($_POST['id']) ? (int)$_POST['id'] : 0;

if ($id > 0) {
    // Menghapus data berdasarkan ID dari tabel produk
    $stmt = $db->prepare("DELETE FROM produk WHERE id = ?");
    $result = $stmt->execute([$id]);

    echo json_encode([
        'success' => $result,
        'message' => $result ? "Data berhasil dihapus" : "Gagal menghapus data"
    ]);
} else {
    echo json_encode([
        'success' => false,
        'message' => "ID tidak valid"
    ]);
}
?>