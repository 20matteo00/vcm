<?php
$user = $_SESSION['username'];
if (isset($_GET['name']) && isset($_GET['mod'])) {
    $name = $_GET['name'];
    $mod = $_GET['mod'];
    $tablepartite = $_GET['tabpar'];
    $tablestatistiche = $_GET['tabstat'];
    if ($mod == "campionato") {

        ?>

        <div class="container my-5">
            <div class="col-12">
                <div class="card">
                    <div class="card-header text-center">
                        <h1><?php echo $name ?></h1>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-striped table-bordered text-center">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <?php
                                        // Simuliamo alcuni nomi di squadre
                                        $sql = "SELECT squadre FROM competizioni WHERE utente = ? AND nome = ?";
                                        $stmt = $conn->prepare($sql);
                                        $stmt->bind_param("ss", $user, $name);
                                        $stmt->execute();
                                        $result = $stmt->get_result();
                                        $row = $result->fetch_assoc();
                                        $squadre = explode(",", $row['squadre']);
                                        foreach ($squadre as $squadra) {
                                            echo "<th>$squadra</th>";
                                        }
                                        $stmt->close();
                                        ?>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php
                                    for ($i = 0; $i < count($squadre); $i++) {
                                        echo "<tr>";
                                        echo "<th>{$squadre[$i]}</th>"; // Nome della squadra nella prima colonna
                                        for ($j = 0; $j < count($squadre); $j++) {
                                            if ($i === $j) {
                                                echo "<td style='background-color: var(--secondarycolor)'></td>"; // Evitiamo di mettere il risultato di una squadra contro se stessa
                                            } else {
                                                $sql = "SELECT gol1, gol2 FROM $tablepartite WHERE utente = ? AND nome = ? AND squadra1 = ? AND squadra2 = ?";
                                                $stmt = $conn->prepare($sql);
                                                $stmt->bind_param("ssss", $user, $name, $squadre[$i], $squadre[$j]);
                                                $stmt->execute();
                                                $result = $stmt->get_result();
                                                $row = $result->fetch_assoc();
                                                $gol1 = isset($row['gol1']) ? $row['gol1'] : "";
                                                $gol2 = isset($row['gol2']) ? $row['gol2'] : "";
                                                echo "<td>$gol1 - $gol2</td>";
                                            }
                                        }
                                        echo "</tr>";
                                    }
                                    ?>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <?php include ("layout/menu_dettagli.php") ?>
                </div>
            </div>
        </div>

        <?php

    }
}