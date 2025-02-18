<?php
include 'db_connect.php';
session_start();



if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $fname = $_POST['fname'];
    $lname = $_POST['lname'];
    $user_id = $_SESSION['user_id']; 

   
    $stmt = $conn->prepare("INSERT INTO tickets (user_id, fname, lname) VALUES (?, ?, ?)");
    $stmt->bind_param("iss", $user_id, $fname, $lname);

    if ($stmt->execute()) {
        header("Location: payment.html");
        exit();
    } else {
        echo "Error: An Error ocuurd please retry" . $stmt->error;
    }

    $stmt->close();
}

$conn->close();
?>
