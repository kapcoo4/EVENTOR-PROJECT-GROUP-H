<?php
include 'db_connect.php';
session_start();

if (!isset($_SESSION['user_id'])) {
    header("Location: login.html"); 
    exit();
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $name = $_POST['fname'];
    


    $stmt = $conn->prepare("INSERT INTO tickets (first_name, last_name) VALUES (?, ?)");
    $stmt->bind_param("ss", $first_name, $last_name);

    if ($stmt->execute()) {
        header("Location: thankyou.php?message=ticket"); 
        exit();
    } 

    $stmt->close();
}
$conn->close();
?>
