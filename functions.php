<?php
$host       = 'localhost';
$user       = 'root';
$password   = '';
$db         = 'reservasi_hotel';
$conn = mysqli_connect($host, $user, $password, $db) or die(mysql_error());
function query($query){
    global $conn;
    $result = mysqli_query($conn, $query);
    $rows  = [];
    while ($row = mysqli_fetch_assoc($result)){
        $rows[] = $row;
    }
    return $rows;
}

function hapus($id){
    global $conn;
    $result = mysqli_query($conn, "DELETE FROM user WHERE id = $id");

    return mysqli_affected_rows($conn);
}

function ubah($data){
    global $conn;
    mysqli_query($conn, "UPDATE user set
    email = '$_POST[email]',
    nama = '$_POST[nama]',
    password = '$_POST[password]' 
    WHERE id = $_POST[id]");
     }
//     $id = ($data["id"]);
//     $email = ($data["email"]);
//     $nama = ($data["nama"]);
//     $password = ($data["password"]);

//     $query = "UPDATE user SET 
//                 email = '$email',
//                 nama = '$nama',
//                 password = '$password' 
//                 WHERE id = $id
//              ";
// }

// if(isset($_POST['proses'])){
//     mysqli_query($conn, "insert into user set
//     email = '$_POST[email]',
//     password = '$_POST[password]',
//      nama = '$_POST[nama]'");
//      echo "Data barang baru telah tersimpan";
//      }
$mahasiswa = query("SELECT * FROM user");
?>