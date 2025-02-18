<?php
include 'db_connect.php';
session_start();
if (!isset($_SESSION['user_id'])) {
    die("Please log in to make a payment.");
}
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $fname = $_POST['fname']; 
    $payment_method = $_POST['payment_method'];
    $amount = $_POST['amount'];
    $user_id = $_SESSION['user_id'];
    
    $stmt = $conn->prepare("INSERT INTO payments (user_id, fname, payment_method, amount ) VALUES (?, ?, ?, ?)");
    $stmt->bind_param("issd", $user_id, $fname, $payment_method, $amount);
    if ($stmt->execute()) {
        header("Location:thankyou.php"); 
    } else {
        echo "Error: payment failed try again " . $stmt->error;
    }
    $stmt->close();
}
$conn->close();
?>