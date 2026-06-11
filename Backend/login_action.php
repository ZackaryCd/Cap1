<?php
session_start();
require 'db.php'; 

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $email = trim($_POST['email']);
    $password = trim($_POST['password']);

    // Kinukuha ang user info base sa email
    $stmt = $conn->prepare("SELECT id, dept_id, first_name, last_name, password, role FROM users WHERE email = ? LIMIT 1");
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows === 1) {
        $user = $result->fetch_assoc();

        // Bine-verify ang hashed password
        if (password_verify($password, $user['password'])) {
            $_SESSION['user_id'] = $user['id'];
            $_SESSION['role'] = $user['role'];
            $_SESSION['full_name'] = $user['first_name'] . ' ' . $user['last_name'];

            // Redirect base sa role na nasa database
            if ($user['role'] === 'Admin') {
                header("Location: ../Landing/Dashboard.html"); 
                exit();
            } else {
                header("Location: ../User_Dashboard/User_Dashboard.html");
                exit();
            }
        } else {
            header("Location: ../Login.html?error=invalid_password");
            exit();
        }
    } else {
        header("Location: ../Login.html?error=user_not_found");
        exit();
    }
}
?>