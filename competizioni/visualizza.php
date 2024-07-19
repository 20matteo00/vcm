<?php
$user = $_SESSION['username'];
if (isset($_GET['name']) && isset($_GET['mod'])) {
    $name = $_GET['name'];
    $mod = $_GET['mod'];
    $tablepartite = $_GET['tabpar'];
    $tablestatistiche = $_GET['tabstat'];

    $sql = "SELECT * FROM competizioni WHERE utente=? AND nome=?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ss", $user, $name);
    $stmt->execute();
    $result = $stmt->get_result();
    while ($row = $result->fetch_assoc()) {
        $ar = $row['ar'];
        $partecipanti = $row['partecipanti'];
        $s = $row['squadre'];
        $finita = $row['finita'];
    }
    $squadre = explode(",", $s);
    $numberOfTeams = count($squadre);
    if ($mod == "campionato") {
        $giornate = 2 * ($numberOfTeams - 1);
        $sections = ($ar == 1) ? ['Girone di Andata' => 0, 'Girone di Ritorno' => $giornate / 2] : ['Girone Unico' => 0];
        $par = 0;
        if ($ar == 1) {
            $totpartite = $giornate * $partecipanti / 2;
        } else {
            $totpartite = $giornate * $partecipanti / 4;
        }
    } elseif ($mod == "eliminazione") {
        $giornate = logBase2($numberOfTeams);
        $sections = ["Trentaduesimi", "Sedicesimi", "Ottavi", "Quarti", "Semifinali", "Finale"];
        $sections2 = ["Trentaduesimi", "Trentaduesimi", "Sedicesimi", "Sedicesimi", "Ottavi", "Ottavi", "Quarti", "Quarti", "Semifinali", "Semifinali", "Finale"];
        if ($ar == 1) {
            $totpartite = (($numberOfTeams - 1) * 2) - 1;
            $sec = $sections2;
            $par = (count($sec) - ($giornate * 2)) + 1;
            $j = $par;
        } else {
            $totpartite = $numberOfTeams - 1;
            $sec = $sections;
            $par = (count($sec) - $giornate);
            $j = $par * 2;
        }
        $p =  (count($sec) - $giornate);
    }
    $stmt->close();
    $readonly = "";
    $scheduler = creagiornate($squadre, $numberOfTeams, $giornate, $mod);
    if ($finita == 1) {
        $readonly = "readonly";
    }
    $query = "SELECT count(*) as count FROM {$tablepartite} WHERE utente = ? AND nome = ?";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("ss", $user, $name);
    $stmt->execute();
    $result = $stmt->get_result();
    $row = $result->fetch_assoc();
    $count = $row['count'];
    $stmt->close();

    ?>
    <div class="container my-5">
        <h1 class="text-center m-5"><?php echo $name ?></h1>
        <?php include ("layout/menu_dettagli.php") ?>

        <div class="row">
            <?php
            if ($mod == "campionato") {
                foreach ($sections as $title => $start) {
                    echo "<h2 class='text-center mt-5'>{$title}</h2>";
                    for ($round = $start; $round < $start + $giornate / 2; $round++) {
                        echo "<div id='giornata" . ($round + 1) . "' class='col-xxl-4 col-lg-6 col-12 text-center p-3'>";
                        echo "<form action='#' method='POST'>";
                        echo "<div class='card shadow-sm miacard'>";
                        echo "<div class='card-header partecipants miacardbody'>";
                        echo "Giornata " . ($round + 1);
                        echo "</div>";
                        echo "<div class='card-body miacardbody'>";
                        foreach ($scheduler[$round] as $match) {
                            $query1 = "SELECT * FROM squadre WHERE utente = ? AND nome = ?";
                            $stmt1 = $conn->prepare($query1);
                            $stmt1->bind_param("ss", $user, $match[0]);
                            $stmt1->execute();
                            $result1 = $stmt1->get_result();
                            $row1 = $result1->fetch_assoc();

                            $query2 = "SELECT * FROM squadre WHERE utente = ? AND nome = ?";
                            $stmt2 = $conn->prepare($query2);
                            $stmt2->bind_param("ss", $user, $match[1]);
                            $stmt2->execute();
                            $result2 = $stmt2->get_result();
                            $row2 = $result2->fetch_assoc();

                            $query3 = "SELECT * FROM " . $tablepartite . " WHERE utente = ? AND nome = ? and squadra1 = ? and squadra2 = ?";
                            $stmt3 = $conn->prepare($query3);
                            $stmt3->bind_param("ssss", $user, $name, $match[0], $match[1]);
                            $stmt3->execute();
                            $result3 = $stmt3->get_result();
                            $row3 = $result3->fetch_assoc();
                            $stmt1->close();
                            $stmt2->close();
                            $stmt3->close();

                            $gol = isset($row3['gol1']) && isset($row3['gol2']) ?
                                "<input type='number' name='gol1" . $match[0] . "' min='0' value=" . $row3['gol1'] . " style='-moz-appearance: textfield; margin: 0; width: 25px;' " . $readonly . " > - <input type='number' name='gol2" . $match[1] . "' min='0' value=" . $row3['gol2'] . " style='-moz-appearance: textfield; margin: 0; width: 25px;' " . $readonly . ">" :
                                "<input type='number' name='gol1" . $match[0] . "' min='0' style='-moz-appearance: textfield; margin: 0; width: 25px;' " . $readonly . "> - <input type='number' name='gol2" . $match[1] . "' min='0' style='-moz-appearance: textfield; margin: 0; width: 25px;' " . $readonly . ">";
                            echo "<input type ='hidden' name='round' value='" . ($round + 1) . "'>";
                            echo "<input type='hidden' name='scheduler' value='" . htmlspecialchars(json_encode($scheduler[$round])) . "'>";
                            echo "<div class='match py-1 d-flex justify-content-between align-items-center'>";
                            echo "<div class='d-flex align-items-center'>";
                            echo "<span class='team' style='border: 1px solid black; color: " . $row1['colore2'] . "; background-color: " . $row1['colore1'] . "; padding: 5px 10px; width: 120px; text-align: center;'>" . $match[0] . "</span>";
                            echo "<span class='vs' style='margin: 0 10px;'>VS</span>";
                            echo "<span class='team' style='border: 1px solid black; color: " . $row2['colore2'] . "; background-color: " . $row2['colore1'] . "; padding: 5px 10px; width: 120px; text-align: center;'>" . $match[1] . "</span>";
                            echo "</div>";
                            echo "<div class='d-flex align-items-center'>";
                            echo "<span class='vs' style='margin: 0 10px;'>" . $gol . "</span>";
                            echo "</div>";
                            echo "</div>";

                        }

                        echo "</div>";
                        echo "<div class='card-footer partecipants miacardbody d-flex justify-content-between'>";
                        if ($finita == 0) {
                            echo "<button type='submit' name='save' class='btn btn-success'>Salva</button>";
                            echo "<button type='submit' name='delete' class='btn btn-danger'>Cancella</button>";
                        }
                        echo "</div>";
                        echo "</div>";
                        echo "</form>";
                        echo "</div>";
                    }
                }
            } elseif ($mod == "eliminazione") {
                /* $round = 0;

                for ($i = $par; $i < count($sec); $i++) {
                    echo "<div class='col-6 text-center p-3'>";
                    echo "<form action='#' method='POST'>";
                    echo "<div class='card shadow-sm miacard'>";
                    echo "<div class='card-header partecipants miacardbody'>";
                    echo $sec[$i];
                    echo "</div>";
                    echo "<div class='card-body miacardbody'>";
                    if (isset($scheduler[$i])) {
                        foreach ($scheduler[$i] as $match) {
                            $query1 = "SELECT * FROM squadre WHERE utente = ? AND nome = ?";
                            $stmt1 = $conn->prepare($query1);
                            $stmt1->bind_param("ss", $user, $match[0]);
                            $stmt1->execute();
                            $result1 = $stmt1->get_result();
                            $row1 = $result1->fetch_assoc();

                            $query2 = "SELECT * FROM squadre WHERE utente = ? AND nome = ?";
                            $stmt2 = $conn->prepare($query2);
                            $stmt2->bind_param("ss", $user, $match[1]);
                            $stmt2->execute();
                            $result2 = $stmt2->get_result();
                            $row2 = $result2->fetch_assoc();

                            $query3 = "SELECT * FROM " . $tablepartite . " WHERE utente = ? AND nome = ? and squadra1 = ? and squadra2 = ?";
                            $stmt3 = $conn->prepare($query3);
                            $stmt3->bind_param("ssss", $user, $name, $match[0], $match[1]);
                            $stmt3->execute();
                            $result3 = $stmt3->get_result();
                            $row3 = $result3->fetch_assoc();
                            $stmt1->close();
                            $stmt2->close();
                            $stmt3->close();

                            $gol = isset($row3['gol1']) && isset($row3['gol2']) ?
                                "<input type='number' name='gol1" . $match[0] . "' min='0' value=" . $row3['gol1'] . " style='-moz-appearance: textfield; margin: 0; width: 25px;' " . $readonly . " > - <input type='number' name='gol2" . $match[1] . "' min='0' value=" . $row3['gol2'] . " style='-moz-appearance: textfield; margin: 0; width: 25px;' " . $readonly . ">" :
                                "<input type='number' name='gol1" . $match[0] . "' min='0' style='-moz-appearance: textfield; margin: 0; width: 25px;' " . $readonly . "> - <input type='number' name='gol2" . $match[1] . "' min='0' style='-moz-appearance: textfield; margin: 0; width: 25px;' " . $readonly . ">";
                            echo "<input type ='hidden' name='round' value='" . ($j + 1) . "'>";
                            echo "<input type='hidden' name='sec' value='" . $sec[$i] . "'>";
                            echo "<input type='hidden' name='scheduler' value='" . htmlspecialchars(json_encode($scheduler[$i])) . "'>";
                            echo "<div class='match py-1 d-flex justify-content-between align-items-center'>";
                            echo "<div class='d-flex align-items-center'>";
                            echo "<span class='team' style='border: 1px solid black; color: " . $row1['colore2'] . "; background-color: " . $row1['colore1'] . "; padding: 5px 10px; width: 120px; text-align: center;'>" . $match[0] . "</span>";
                            echo "<span class='vs' style='margin: 0 10px;'>VS</span>";
                            echo "<span class='team' style='border: 1px solid black; color: " . $row2['colore2'] . "; background-color: " . $row2['colore1'] . "; padding: 5px 10px; width: 120px; text-align: center;'>" . $match[1] . "</span>";
                            echo "</div>";
                            echo "<div class='d-flex align-items-center'>";
                            echo "<span class='vs' style='margin: 0 10px;'>" . $gol . "</span>";
                            echo "</div>";
                            echo "</div>";

                        }
                    }
                    echo "</div>";
                    echo "<div class='card-footer partecipants miacardbody d-flex justify-content-between'>";
                    if ($finita == 0) {
                        echo "<button type='submit' name='save' class='btn btn-success'>Salva</button>";
                        echo "<button type='submit' name='delete' class='btn btn-danger'>Cancella</button>";
                    }
                    echo "</div>";
                    echo "</div>";
                    echo "</form>";
                    echo "</div>";
                    $round++;
                    $j++;
                    if ($ar == 0) {
                        $round++;
                        $j++;
                    }

                } */


            }
            ?>
        </div>
    </div>
    <?php
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $round = $_POST['round'];
    $scheduler = json_decode($_POST['scheduler'], true);

    if (isset($_POST['save'])) {


        foreach ($scheduler as $index => $match) {

            $squadra1 = $match[0];
            $squadra2 = $match[1];
            $gol1 = $_POST['gol1' . $match[0]];
            $gol2 = $_POST['gol2' . $match[1]];
            $sql_save = "INSERT INTO {$tablepartite} (utente, nome, squadra1, squadra2, gol1, gol2, giornata) VALUES (?, ?, ?, ?, ?, ?, ?)
             ON DUPLICATE KEY UPDATE gol1 = VALUES(gol1), gol2 = VALUES(gol2)";

            $stmt_save = $conn->prepare($sql_save);

            // Assicurati che gol1 e gol2 siano numeri interi
            $stmt_save->bind_param("ssssiii", $user, $name, $squadra1, $squadra2, $gol1, $gol2, $round);
            $stmt_save->execute();
            $stmt_save->close();


        }

    } elseif (isset($_POST['delete'])) {
        // Delete logic
        $sql_delete = "DELETE FROM {$tablepartite} WHERE utente = ? AND nome = ? AND giornata = ?";
        $stmt_delete = $conn->prepare($sql_delete);
        $stmt_delete->bind_param("ssi", $user, $name, $round);
        $stmt_delete->execute();
        $stmt_delete->close();


    }
    header("Location: index.php?page=visualizza&name={$name}&mod={$mod}&tabpar={$tablepartite}&tabstat={$tablestatistiche}#giornata{$round}");
    exit();
}

function logBase2($n)
{
    return log($n) / log(2);
}

function creagiornate($teams, $numberOfTeams, $rounds, $mod)
{
    // Check if the number of teams is even
    if ($numberOfTeams % 2 != 0) {
        echo "Error: Invalid number of teams. Must be even.";
        return;
    }

    // Create an array to hold the schedule
    $schedule = [];

    if ($mod == "campionato") {
        // Generate the schedule for the first round
        for ($round = 0; $round < $numberOfTeams - 1; $round++) {
            $schedule[$round] = [];
            for ($match = 0; $match < $numberOfTeams / 2; $match++) {
                $home = ($round + $match) % ($numberOfTeams - 1);
                $away = ($numberOfTeams - 1 - $match + $round) % ($numberOfTeams - 1);
                // Last team is fixed
                if ($match == 0) {
                    $away = $numberOfTeams - 1;
                }
                $schedule[$round][$match] = [$teams[$home], $teams[$away]];
            }
        }
        // Randomize the order of the rounds
        /* shuffle($schedule); */
        // Generate the second round (return matches)
        for ($round = $numberOfTeams - 1; $round < $rounds; $round++) {
            $schedule[$round] = [];
            foreach ($schedule[$round - ($numberOfTeams - 1)] as $match) {
                $schedule[$round][] = array_reverse($match);
            }
        }
    } elseif ($mod == "eliminazione") {
        /* var_dump($dim-$p);
        for ($round = ($dim-$p); $round < $dim; $round ++) {
            $schedule[$par] = [];
            for ($match = 0; $match < $numberOfTeams / 2; $match++) {
                $home = ($match) % ($numberOfTeams - 1);
                $away = ($numberOfTeams - 1 - $match) % ($numberOfTeams - 1);
                // Last team is fixed
                if ($match == 0) {
                    $away = $numberOfTeams - 1;
                }
                $schedule[$par][$match] = [$teams[$home], $teams[$away]];
            }
            if ($ar == 1) {
                $schedule[$par + 1] = [];
                foreach ($schedule[$par] as $match) {
                    $schedule[$par + 1][] = array_reverse($match);
                }
            }
            $par+=2;
        } */

    }


    return $schedule;
}




?>