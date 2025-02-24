<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login Page</title>
        <link rel="stylesheet" href="../css/login_style_register.css">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    </head>
    <body>
        <div class="container">
            <form class="form" action="login.php" method="POST">
                <img src="../assets/images/logo.png" alt="Logo" class="logo">
                <h2>Login</h2>
                
                <div class="form-group">
                    <label for="contactEmail">Email</label>
                    <input type="email" id="contactEmail" name="contactEmail" required placeholder="Enter your email">
                </div>
                
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" required placeholder="Enter your password">
                </div>
                
                <button type="submit" name="btnLogin">Login</button>  
                
                <p class="register-link">
                    Don’t have an account yet? <a href="registration1.html">Register here</a>
                </p>
            </form>
        </div>
    </body>
</html>

<?php
session_start();
include("connection.php");

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['btnLogin'])) {
    $contactEmail = trim($_POST['contactEmail']);
    $password = trim($_POST['password']); 

    $sql = "SELECT customer_id, contactEmail, passwordHash FROM login_tbl WHERE contactEmail = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("s", $contactEmail);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();

        if ($password === $row['passwordHash']) {
            $_SESSION['customer_id'] = $row['customer_id'];
            $_SESSION['contactEmail'] = $row['contactEmail'];

            echo '<script>alert("Login successful!"); window.location.href="dashboard.php";</script>'; // Change to the desired landing page
        } else {
            echo '<script>alert("Incorrect password!"); window.location.href="login.php";</script>';
        }
    } else {
        echo '<script>alert("User not found!"); window.location.href="login.php";</script>';
    }

    $stmt->close();
    $conn->close();
}
?>
