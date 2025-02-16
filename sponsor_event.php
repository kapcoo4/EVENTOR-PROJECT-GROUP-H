<?php
include 'db_connect.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $company_name = $_POST['company_name'];
    $email = $_POST['email'];
    $event_id = (int)$_POST['event_id'];
    $tier = (int)$_POST['sponsorship_tier'];


    

    $stmt = $conn->prepare("INSERT INTO sponsorships (company_name, email, event_id, sponsorship_tier) VALUES (?, ?, ?, ?)");
    $stmt->bind_param("ssis", $company_name, $email, $event_id, $tier);

    if ($stmt->execute()) {
        header("Location: thankyou.php");
        exit();
    } else {
        echo "Error: " . $stmt->error;
    }

    $stmt->close();
}
$conn->close();
?>
