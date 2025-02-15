<?php
// Connect to the database
$servername = "localhost";
$username = "username";
$password = "password";
$dbname = "ticket_booking";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Collect data from the form
$user_id = 1; // This can be changed to reflect the current user
$ticket_type_id = $_POST['ticket_type_id'];
$payment_method = $_POST['payment_method'];
$amount = $_POST['amount'];
$pay_at = date('Y-m-d H:i:s');

// Insert data into the table
$sql = "INSERT INTO event_booking_tickets (user_id, ticket_type_id, payment_method, pay_at, Amount)
VALUES ('$user_id', '$ticket_type_id', '$payment_method', '$pay_at', '$amount')";

if ($conn->query($sql) === TRUE) {
    echo "Payment processed successfully!";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>