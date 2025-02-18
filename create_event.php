<?php
include 'db_connect.php';
session_start();

if (!isset($_SESSION['user_id'])) {
    header("Location: login.html");
    exit();
}

if ($_SERVER["REQUEST_METHOD"] == "POST") 
    $title = $_POST['event-name'];
    $description = $_POST['event-description'];
    $event_date = $_POST['event-date'] . ' ' . $_POST['event-time'];
    $location = $_POST['event-location'];
    $price = $_POST['event-price'];

    $stmt = $conn->prepare("INSERT INTO events (title, description, event_date, location, price ) VALUES (?, ?, ?, ?, ?)");
    $stmt->bind_param("ssssd", $title, $description, $event_date, $location, $price);

    if ($stmt->execute()) {
        header("Location: thankyou.php?");
        exit();
   
    $stmt->close();
}
$conn->close();
?>
