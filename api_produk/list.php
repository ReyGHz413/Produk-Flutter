<?php
// Menambahkan header CORS agar bisa diakses Flutter Web/Emulator
header("Access-Control-Allow-Origin: *");
header('Content-Type: application/json; charset=UTF-8');
include 'konekdb.php';

try {
    // Pastikan variabel koneksi ($db) sesuai dengan yang ada di konekdb.php
    // Gunakan ORDER BY id DESC agar produk terbaru muncul di paling atas
    $stmt = $db->query("SELECT id, nama, kode, harga, foto FROM produk ORDER BY id DESC");
    $results = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Mengirimkan data dalam format JSON
    echo json_encode($results);

} catch (PDOException $e) {
    // Menangani jika terjadi error pada database
    http_response_code(500);
    echo json_encode(["error" => $e->getMessage()]);
}
?>