<?php
// Parametri di connessione al database
$servername = "localhost";
$username = "root";
$password = "Matteo00";
$dbname = "vcm";

// Creazione della connessione
$conn = new mysqli($servername, $username, $password, $dbname);

// Controllo della connessione
if ($conn->connect_error) {
    die("Connessione fallita: " . $conn->connect_error);
}
?>
