<?php
session_start();
header('Content-Type: application/json');
require '../Backend/db.php';
require '../Backend/rbac.php';
require_role('admin');

try {
    // Idinagdag ang size column (0 para sa folder, file_size para sa files)
    // Siniguro na 'file' ang lalabas na type imbes na extension (pdf, png, etc)
    $sql = "
        SELECT id, name, dept_id, 'folder' as type, 0 as size, created_at as deleted_at 
        FROM folders WHERE is_trash = 1
        UNION
        SELECT id, display_name as name, dept_id, 'file' as type, file_size as size, uploaded_at as deleted_at 
        FROM files WHERE is_trash = 1
        ORDER BY deleted_at DESC
    ";
    
    $result = $conn->query($sql);
    $items = [];

    while($row = $result->fetch_assoc()) {
        // Countdown Calculation base sa date (halimbawa 30 days limit)
        $deletedDate = new DateTime($row['deleted_at']);
        $now = new DateTime();
        $interval = $deletedDate->diff($now);
        $daysPassed = $interval->days;
        
        $row['days_remaining'] = max(0, 30 - $daysPassed);
        $row['size'] = (int)$row['size'];
        $items[] = $row;
    }
    
    echo json_encode($items);

} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(['error' => $e->getMessage()]);
}
?>