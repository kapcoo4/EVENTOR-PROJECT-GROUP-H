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
    $organizer_id = $_SESSION['user_id']; 

    $stmt = $conn->prepare("INSERT INTO events (title, description, event_date, location, price, organizer_id) VALUES (?, ?, ?, ?, ?, ?)");
    $stmt->bind_param("ssssdi", $title, $description, $event_date, $location, $price, $organizer_id);

    if ($stmt->execute()) {
        header("Location: thankyou.php?");
        exit();
   
    $stmt->close();
}
$conn->close();
?>
