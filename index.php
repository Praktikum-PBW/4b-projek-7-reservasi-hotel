<?php
require 'functions.php';
$host       = 'localhost';
$user       = 'root';
$password   = '';
$db         = 'reservasi_hotel';


$conn = mysqli_connect($host, $user, $password, $db) or die(mysql_error());

// $id = $_GET["id"];
// $mhs = query("SELECT * FROM user WHERE id = '$id'")[0];

// function query($query){
//     global $conn;
//     $result = mysqli_query($conn, $query);
//     $rows  = [];
//     while ($row = mysqli_fetch_assoc($result)){
//         $rows[] = $row;
//     }
//     return $rows;
// }

// function hapus($id){
//     global $conn;
//     $result = mysqli_query($conn, "DELETE FROM user WHERE id = $id");

//     return mysqli_affected_rows($conn);
// }

// function ubah($data){
//     global $conn;
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
$mahasiswa = query("SELECT * FROM user");
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Daftar User Hotel</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>

<body>

    
    <div class="container mt-5">
        <div class="row">
            <div class="col-md-10 mx-auto">
            <h1>Data User</h1>
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">Input Data</h3>
                    </div>
                    <div class="card-body">
                        <form action="" method="POST">
                            <input type="hidden" name="id" value = "<?= $mhs ["id"]; ?>">
                            <div class="mb-2">
                                <label for="email" class="form-label">Email</label>
                                <input type="text" name="email" id="email" class="form-control">
                            </div>
                            <div class="mb-2">
                                <label for="password" class="form-label">Password</label>
                                <input type="password" name="password" id="password" class="form-control">
                            </div>
                            <div class="mb-2">
                                <label for="username" class="form-label">Username</label>
                                <input type="text" name="nama" id="nama" class="form-control">
                            </div>
                            <input type="submit" value="Regist" name="proses" class="btn btn-primary">
                        </form>
                         <?php

                    
                                    if(isset($_POST['proses'])){
                                        mysqli_query($conn, "insert into user set
                                        email = '$_POST[email]',
                                        password = '$_POST[password]',
                                         nama = '$_POST[nama]'");
                                         echo "Data barang baru telah tersimpan";
                                         }
                        ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container mt-5">
        <div class="row">
            <div class="col-md-10 mx-auto">
                 <div class="card">
                     <div class="card-header text-white bg-secondary">
                      Data User
                     </div>
                     <div class="card-body">
                         <table class="table">
                          <thead>
                          <tr>
                            <th scope="col">#</th>
                            <th scope="col">Email</th>
                            <th scope="col">Nama</th>
                            <th scope="col">Password</th>
                            <th scope="col">Aksi</th>
                         </tr>
                          </thead>
                          <tbody>
                          <?php $i = 1 ?>
                          <?php foreach($mahasiswa as $row):?>
                         <tr>
                         <td><?=$i?></td>
                         <td><?= $row ["email"]; ?></td>
                         <td><?= $row ["nama"]; ?></td>
                         <td><?= $row ["password"]; ?></td>
                         <td scope="row">
                                    <a href="ubah.php?op=edit&id=<?= $row["id"]; ?>"><button type="button" class="btn btn-warning">Edit</button></a>
                                    <a href="hapus.php?op=hapus&id=<?= $row["id"]; ?>" onclick="return confirm('Yakin mau delete data?')"><button type="button" class="btn btn-danger">Delete</button></a>            
                                </td>
                        </tr>
                        <?php $i++; ?>
                        <?php endforeach; ?>
                        </tbody>
                    </table>
            </div>
          </div>
        </div>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>

</html>