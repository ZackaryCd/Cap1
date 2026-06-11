<?php
session_start();
header('Content-Type: application/json');
require '../Backend/db.php';
require '../Backend/rbac.php';
require_login();

$user_id = $_SESSION['user_id'];
$dept_id = $_SESSION['dept_id'];

$response = [
    "total_my_files" => 0,
    "my_storage_used" => 0,
    "pending_requests" => 0,
    "dept_shared_size" => 0,
    "recent_files" => [],
    "chart_data" => ["documents" => 0, "spreadsheets" => 0, "images" => 0, "others" => 0],
    "full_name" => $_SESSION['full_name']
];

try {
    // 1. Files at Storage size ng User
    $stmt = $conn->prepare("SELECT COUNT(id) as count, IFNULL(SUM(file_size), 0) as total_size FROM files WHERE user_id = ? AND is_trash = 0");
    $stmt->bind_param("i", $user_id);
    $stmt->execute();
    $res = $stmt->get_result()->fetch_assoc();
    $response['total_my_files'] = (int)$res['count'];
    $response['my_storage_used'] = (int)$res['total_size'];

    // 2. Pending Requests mula sa access_requests table
    $stmt = $conn->prepare("SELECT COUNT(*) as count FROM access_requests WHERE user_id = ? AND status = 'pending'");
    $stmt->bind_param("i", $user_id);
    $stmt->execute();
    $response['pending_requests'] = (int)$stmt->get_result()->fetch_assoc()['count'];

    // 3. Department Shared Size
    $stmt = $conn->prepare("SELECT IFNULL(SUM(file_size), 0) as total_size FROM files WHERE dept_id = ? AND is_trash = 0");
    $stmt->bind_param("i", $dept_id);
    $stmt->execute();
    $response['dept_shared_size'] = (int)$stmt->get_result()->fetch_assoc()['total_size'];

    // 4. Recent Files at Chart Data
    $stmt = $conn->prepare("SELECT display_name, file_size, uploaded_at FROM files WHERE user_id = ? AND is_trash = 0 ORDER BY uploaded_at DESC LIMIT 5");
    $stmt->bind_param("i", $user_id);
    $stmt->execute();
    $result = $stmt->get_result();
    while ($row = $result->fetch_assoc()) {
        $response['recent_files'][] = $row;
        $ext = strtolower(pathinfo($row['display_name'], PATHINFO_EXTENSION));
        if (in_array($ext, ['pdf', 'doc', 'docx'])) $response['chart_data']['documents']++;
        elseif (in_array($ext, ['xls', 'xlsx'])) $response['chart_data']['spreadsheets']++;
        elseif (in_array($ext, ['jpg', 'png'])) $response['chart_data']['images']++;
        else $response['chart_data']['others']++;
    }

    echo json_encode($response);
} catch (Exception $e) {
    echo json_encode(["error" => $e->getMessage()]);
}
?>