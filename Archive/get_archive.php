<?php
session_start();
header('Content-Type: application/json');
require '../Backend/db.php';
require '../Backend/rbac.php';
require_role('admin');

try {
    // Idinagdag ang '0 as size' para sa folders at 'file_size as size' para sa files
    $sql = "
        SELECT id, name, dept_id, 'folder' as type, 0 as size, created_at as date 
        FROM folders WHERE is_archived = 1 AND is_trash = 0
        UNION
        SELECT id, display_name as name, dept_id, 'file' as type, file_size as size, uploaded_at as date 
        FROM files WHERE is_archived = 1 AND is_trash = 0
        ORDER BY date DESC
    ";
    
    $result = $conn->query($sql);

    if (!$result) {
        throw new Exception($conn->error);
    }

    echo json_encode($result->fetch_all(MYSQLI_ASSOC));
} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(['error' => $e->getMessage()]);
}
?>