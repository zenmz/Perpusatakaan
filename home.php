<?php
session_start();
include "config.php";

if(!$_SESSION['level']){
    header('location:index.php');
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Administrasi Perpustakaan</title>
    <!-- ICON FONT AWESOME -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
</head>
<body>
    <div class="d-flex" id="wrapper">
        <div class="sidebar-heading border-bottom bg-dark"></div>
        <div class="list-group list-group-flush">
            <a href="#" class="list-group-item list-group-item-action list-group-item-dark p-3">Dashboard</a>
            <a href="#" class="list-group-item list-group-item-action list-group-item-dark p-3">Data</a>
            <a href="#" class="list-group-item list-group-item-action list-group-item-dark p-3">Peminjaman</a>
            <a href="#" class="list-group-item list-group-item-action list-group-item-dark p-3">Pengembalian</a>
        </div>
    </div>

    <div id="page-content-wrapper">

        <nav class="navbar navbar-expand-lg navbar-light bg-primary border-bottom">
            <div class="container-fluid">
                <button class="btn btn-primary" id="sidebarToggle">Penutup</button>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent">Tes</button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto mt-2 mt-lg-0">
                        <li class="nav-item"><a href="#" class="nav-link">Home</a></li>
                        <li class="nav-item"><a href="#" class="nav-link">Data</a></li>
                        <li class="nav-item dropdown">
                        
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>

<script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>