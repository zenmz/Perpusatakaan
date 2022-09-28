<?php
 include "config.php"

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Daftar</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
</head>

<body>
    <div class="login-wrapper d-flex justify-content-center align-items-center" style="height: 100vh;">
        <div class="input-wrapper p-4 w-25 bg-secondary rounded-4 bg-opacity-25">
            <form action="" method="POST">
                <h2 class="text-center">Daftar</h2>
                <div class="my-4">
                    <label for="" class="form-label">Username</label>
                    <input type="text" class="form-control" id="exampleInputEmail1" name="username">
                </div>
                <div class="my-4">
                    <label for="" class="form-label">Password</label>
                    <input type="password" class="form-control" id="exampleInputEmail1" name="password">
                </div>
                <div class="my-4">
                    <label for="" class="form-label">konfirmasi Password</label>
                    <input type="password" class="form-control" id="exampleInputEmail1" name="cpassword">
                </div>
                <div class="text-center">
                    <button type="submit" name="submit" class="btn btn-primary">Daftar</button>
                    <a href="index.php" class="btn btn-danger">Cancel</a>
                </div>
            </form>
        </div>
    </div>


    <script src="assets/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>

<?php
if (isset($_POST['submit'])) {
    $username = $_POST['username'];
    $password = $_POST['password'];
    $cp = $_POST['cpassword'];

    if($cp == $password){
        $query = "INSERT INTO users(username, password) VALUES('$username', '$password')";
        $sql = mysqli_query($conn, $query);
        $data = mysqli_fetch_assoc($sql);
    } else {
        header('location:regis.php');
    }

    if($query) {
        echo "<script>window.location.href='index.php'</script>";
    }
}
?>
