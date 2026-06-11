<?php
session_start();
header('Content-Type: application/json');
require '../Backend/db.php';
require '../Backend/rbac.php';
require_login(); // Sinisiguro na naka-login ang user

// Siguraduhing may session ang user
if (!isset($_SESSION['user_id'])) {
    echo json_encode(["status" => "error", "message" => "Unauthorized access."]);
    exit;
}

// Kunin ang role at department id mula sa session
$user_dept_id = $_SESSION['dept_id'] ?? 0;
$user_role = $_SESSION['role'] ?? 'Staff';

// Kung Staff siya at walang department, i-block
if ($user_role !== 'Admin' && empty($user_dept_id)) {
    echo json_encode(["status" => "error", "message" => "No department assigned for this staff account."]);
    exit;
}

$parent_id = (isset($_GET['parent_id']) && $_GET['parent_id'] !== "" && $_GET['parent_id'] !== "null") ? $_GET['parent_id'] : NULL;
$dept_id = (isset($_GET['dept_id']) && $_GET['dept_id'] !== "" && $_GET['dept_id'] !== "null") ? $_GET['dept_id'] : NULL;

$response = ["folders" => [], "files" => []];

try {
    // ==========================================
    // ROOT LEVEL: Ipakita lahat ng Departments
    // ==========================================
    if ($parent_id === NULL && $dept_id === NULL) {
        $stmt = $conn->prepare("SELECT id, name FROM departments ORDER BY name ASC");
        $stmt->execute();
        $result = $stmt->get_result();
        
        while ($row = $result->fetch_assoc()) {
            
            // RBAC LOGIC: I-lock lang ang folder kung "Staff" siya at hindi tugma ang dept_id niya.
            // Kung "Admin", laging false ang $is_locked (bukas lahat).
            $is_locked = false;
            if ($user_role !== 'Admin' && $row['id'] != $user_dept_id) {
                $is_locked = true;
            }
            
            $response["folders"][] = [
                "id" => "dept_" . $row['id'], // Special ID format para ma-detect sa JS
                "name" => $row['name'],
                "type" => "folder",
                "is_locked" => $is_locked,
                "date" => "System Directory"
            ];
        }
        $stmt->close();
    } 
    // ==========================================
    // INSIDE A DEPARTMENT: Ipakita ang Folders & Files
    // ==========================================
    else {
        // RBAC Security Check: I-block lang kung Staff at pumapasok sa ibang dept
        if ($user_role !== 'Admin' && $dept_id != $user_dept_id) {
             throw new Exception("Access Denied. Folder is locked.");
        }

        // Fetch Folders
        if ($parent_id === NULL) {
            $stmt = $conn->prepare("SELECT id, name, created_at as date FROM folders WHERE parent_id IS NULL AND dept_id = ? AND is_trash = 0 AND is_archived = 0");
            $stmt->bind_param("i", $dept_id);
        } else {
            $stmt = $conn->prepare("SELECT id, name, created_at as date FROM folders WHERE parent_id = ? AND dept_id = ? AND is_trash = 0 AND is_archived = 0");
            $stmt->bind_param("ii", $parent_id, $dept_id);
        }
        $stmt->execute();
        $result = $stmt->get_result();
        while ($row = $result->fetch_assoc()) {
            $row['is_locked'] = false; 
            $row['type'] = 'folder';
            $response["folders"][] = $row;
        }
        $stmt->close();

        // Fetch Files
        if ($parent_id === NULL) {
            $stmt = $conn->prepare("SELECT id, display_name as name, storage_name, file_size as size, uploaded_at as date FROM files WHERE folder_id IS NULL AND dept_id = ? AND is_trash = 0 AND is_archived = 0");
            $stmt->bind_param("i", $dept_id);
        } else {
            $stmt = $conn->prepare("SELECT id, display_name as name, storage_name, file_size as size, uploaded_at as date FROM files WHERE folder_id = ? AND dept_id = ? AND is_trash = 0 AND is_archived = 0");
            $stmt->bind_param("ii", $parent_id, $dept_id);
        }
        $stmt->execute();
        $result = $stmt->get_result();
        while ($row = $result->fetch_assoc()) {
            $row['is_locked'] = false;
            $row['type'] = 'file';
            $response["files"][] = $row;
        }
        $stmt->close();
    }

    echo json_encode($response);

} catch (Exception $e) {
    echo json_encode(["status" => "error", "message" => $e->getMessage()]);
}
?>