<?php
$user = $_SESSION['username'];
if (isset($_GET['squadra'])) {
    $squadra = $_GET['squadra'];
    $query = "SELECT * FROM competizioni WHERE utente = ?";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("s", $user);
    $stmt->execute();
    $result = $stmt->get_result();
    $stmt->close();
    while ($row = $result->fetch_assoc()) {
        $nome = $row['nome'];
        $squadre = $row['squadre'];
    }
    $squadre = explode(",", $squadre);
    for ($i = 0; $i < count($nome); $i++) {
        if (in_array($squadra, $squadre)) {
            echo "ciao<br>";
        }
    }
}
