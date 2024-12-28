<?php
$glamLocations = [
    [
        "name" => "Perpustakaan Nasional RI",
        "lat" => -6.1821,
        "lng" => 106.8267,
        "info" => "Perpustakaan Nasional Republik Indonesia adalah pusat literasi dan arsip terbesar di Indonesia, berlokasi di Jl. Medan Merdeka Selatan, Jakarta Pusat."
    ],
    [
        "name" => "Museum Nasional Indonesia",
        "lat" => -6.1767,
        "lng" => 106.8219,
        "info" => "Museum Nasional Indonesia atau Museum Gajah menyimpan koleksi artefak sejarah dan budaya dari seluruh Indonesia. Terletak di Jl. Medan Merdeka Barat, Jakarta Pusat."
    ],
];

// Mengacak lokasi
shuffle($glamLocations);

// Mengirimkan data sebagai JSON
header('Content-Type: application/json');
echo json_encode($glamLocations);
?>