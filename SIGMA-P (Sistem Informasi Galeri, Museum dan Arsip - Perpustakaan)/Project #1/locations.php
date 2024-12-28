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
    [   "name" => "Museum Fatahillah",
        "lat" => -6.1353,
        "lng" => 106.8204,
        "info" => "Museum Fatahillah atau Museum Sejarah Jakarta terletak di Kota Tua, Jakarta Barat. Museum ini menampilkan koleksi yang berkaitan dengan sejarah Jakarta dan Indonesia pada masa kolonial Belanda. Alamat: Jl. Fatahillah No. 1, Jakarta Barat, DKI Jakarta."
    ],
    [
        "name" => "Museum Wayang",
        "lat" => -6.1357,
        "lng" => 106.8197,
        "info" => "Museum Wayang menampilkan koleksi wayang dan seni pertunjukan dari berbagai daerah di Indonesia. Museum ini terletak di Kota Tua, Jakarta Barat, tepat di sebelah Museum Fatahillah. Alamat: Jl. Pahlawan No. 2, Jakarta Barat, DKI Jakarta."
    ],
    [
        "name" => "Museum Bank Indonesia",
        "lat" => -6.1355,
        "lng" => 106.8186,
        "info" => "Museum Bank Indonesia adalah museum yang berfokus pada sejarah perbankan Indonesia. Terletak di Kota Tua, Jakarta Barat, museum ini menyajikan informasi mengenai perkembangan sistem keuangan dan ekonomi Indonesia. Alamat: Jl. Pahlawan No. 3, Jakarta Barat, DKI Jakarta."
    ],
    [
    <!-- Tambahkan Lagi untuk Alamatnya -->
    ],
];

// Mengacak lokasi
shuffle($glamLocations);

// Mengirimkan data sebagai JSON
header('Content-Type: application/json');
echo json_encode($glamLocations);
?>
