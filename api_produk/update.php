<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
include 'konekdb.php';

// Cek apakah data POST ada untuk mencegah error 'undefined index'
$id    = isset($_POST['id']) ? $_POST['id'] : null;
$nama  = isset($_POST['nama']) ? $_POST['nama'] : null;
$kode  = isset($_POST['kode']) ? $_POST['kode'] : null;
$harga = isset($_POST['harga']) ? $_POST['harga'] : null;
$foto  = isset($_POST['foto']) ? $_POST['foto'] : null;

if ($id && $nama) {
    // Urutan di UPDATE: kode (1), nama (2), harga (3), foto (4), id (5)
    $stmt = $db->prepare("UPDATE produk SET kode = ?, nama = ?, harga = ?, foto = ? WHERE id = ?");
    
    // Pastikan variabel di sini urutannya sama dengan tanda tanya di atas
    // Tadi kamu tulis $name (salah), seharusnya $nama
    $result = $stmt->execute([$kode, $nama, $harga, $foto, $id]);

    echo json_encode(['success' => $result]);
} else {
    echo json_encode(['success' => false, 'message' => 'Data tidak lengkap']);
}
?>