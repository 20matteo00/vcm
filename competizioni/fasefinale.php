<?php
$user = $_SESSION['username'];
if (isset($_GET['name']) && isset($_GET['mod'])) {
    $name = $_GET['name'];
    $mod = $_GET['mod'];
    $tablepartite = $_GET['tabpar'];
    $tablestatistiche = $_GET['tabstat'];

    $sql = "UPDATE competizioni SET finita = 1 WHERE utente = ? AND nome = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ss", $user, $name);
    $stmt->execute();
    $result = $stmt->get_result();
    $stmt->close();

    $sql = "SELECT * FROM competizioni WHERE utente=? AND nome=?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ss", $user, $name);
    $stmt->execute();
    $result = $stmt->get_result();
    $row = $result->fetch_assoc();

    $partecipanti = $row['partecipanti'];
    $gironi = $row['gironi'];
    $fasefinale = $row['fasefinale'];

    $limit = $fasefinale/$gironi;

    $squadrepassate = [];
    for ($i = 1; $i <= $gironi; $i++) {
        // Query per calcolare i punti, la differenza reti e ordinare i risultati
        $sql = "
        SELECT squadra, 
            (vinte_casa * 3 + pari_casa + vinte_trasferta * 3 + pari_trasferta) AS punti,
            (fatti_casa - subiti_casa + fatti_trasferta - subiti_trasferta) AS differenza_reti,
            (fatti_casa + fatti_trasferta) AS gol_fatti
        FROM $tablestatistiche
        WHERE utente = ? AND nome = ? AND girone = ?
        ORDER BY punti DESC, differenza_reti DESC, gol_fatti DESC, squadra ASC LIMIT ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("ssii", $user, $name, $i, $limit);
        $stmt->execute();
        $result = $stmt->get_result();
        $stmt->close();

        while ($row = $result->fetch_assoc()) {
            $squadrepassate[] = $row['squadra'];
        }
    }
    var_dump($squadrepassate);

}
?>