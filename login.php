
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>

<body>
    <!-- Halaman Login -->
    <div class="container mt-5">
        <div class="row">
            <div class="col-md-6 mx-auto">
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">Register</h3>
                    </div>
                    <div class="card-body">
                        <form action="" method="POST">
                            <div class="mb-2">
                                <label for="email" class="form-label">Email</label>
                                <input type="text" name="email" id="email" class="form-control" value="<?php echo $email ?>>
                            </div>
                            <div class="mb-2">
                                <label for="password" class="form-label">Password</label>
                                <input type="password" name="password" id="password" class="form-control" value="<?php echo $password ?>>
                            </div>
                            <div class="mb-2">
                                <label for="username" class="form-label">Username</label>
                                <input type="text" name="nama" id="nama" class="form-control" value="<?php echo $nama ?>>
                            </div>
                            <input type="submit" value="Regist" name="proses" class="btn btn-primary">
                        </form>
                         <?php
                                 include "koneksi.php";
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

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>

</html>