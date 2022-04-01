<?php
require 'index.php';

$id = $_GET["id"];

if( hapus($id) > 0){
    echo "
        <script>
            alert('Data Berhasil DiHapus');
            document.location.href = 'index.php';
        </script>
    ";
}else{
    echo "
        <script>
            alert('Data gagal DiHapus');
            document.location.href = 'index.php';
        </script>
    ";
}

?>