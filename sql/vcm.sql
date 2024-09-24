-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Set 24, 2024 alle 17:22
-- Versione del server: 10.4.25-MariaDB
-- Versione PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vcm`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `competizioni`
--

CREATE TABLE `competizioni` (
  `utente` varchar(200) NOT NULL,
  `nome` varchar(200) NOT NULL,
  `modalita` varchar(200) NOT NULL,
  `gironi` int(11) NOT NULL,
  `ar` int(11) NOT NULL,
  `partecipanti` int(11) NOT NULL,
  `fasefinale` int(11) NOT NULL,
  `finita` int(11) NOT NULL,
  `squadre` varchar(10000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `gruppi`
--

CREATE TABLE `gruppi` (
  `utente` varchar(200) NOT NULL,
  `nome` varchar(200) NOT NULL,
  `colore1` varchar(200) NOT NULL,
  `colore2` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `gruppi`
--

INSERT INTO `gruppi` (`utente`, `nome`, `colore1`, `colore2`) VALUES
('a', '0', '#000000', '#ffffff'),
('a', 'Albania - Kategoria Superiore', '#ffffff', '#ff8000'),
('a', 'Andorra - Primera Divisio', '#ffffff', '#0000ff'),
('a', 'Armenia - Bardsragujn Chumb', '#ff8000', '#ffffff'),
('a', 'Austria - Bundesliga', '#ff0000', '#ffff00'),
('a', 'Azerbaigian - Premyer Liqa', '#ffffff', '#0000ff'),
('a', 'Belgio - Pro League', '#000080', '#00d5d5'),
('a', 'Bielorussia - Vysheyshaya Liga', '#ffffff', '#008040'),
('a', 'Bosnia - Premijer Liga Bih', '#ff0000', '#ffffff'),
('a', 'Bulgaria - Efbet Liga', '#000000', '#ffff00'),
('a', 'Cipro - Protathlima Cyta', '#ffffff', '#004080'),
('a', 'Croazia - Supersport HNL', '#ff0000', '#000000'),
('a', 'Danimarca - Superliga', '#ffffff', '#000000'),
('a', 'Estonia - Premium Liiga', '#ffffff', '#ff0000'),
('a', 'Faroe - Betri Deildin', '#00df00', '#ffffff'),
('a', 'Finlandia - Veikkausliiga', '#ffffff', '#004080'),
('a', 'Francia - Ligue 1', '#0000a0', '#00ff00'),
('a', 'Galles - Championship', '#ffffff', '#b7b700'),
('a', 'Georgia - Erovnuli Liga', '#000000', '#ffffff'),
('a', 'Germania - Bundesliga', '#ff0000', '#ffffff'),
('a', 'Gibilterra - Football League', '#000000', '#ffffff'),
('a', 'Grecia - Super League 1', '#0000ff', '#ffffff'),
('a', 'Inghilterra - Premier League', '#ffffff', '#400080'),
('a', 'Irlanda - Premier Division', '#000000', '#00ffff'),
('a', 'Irlanda Del Nord - Premiership', '#ffffff', '#000000'),
('a', 'Islanda - Besta Deild', '#ffffff', '#0000a0'),
('a', 'Israele - Ligat Ha\'al', '#ffffff', '#000000'),
('a', 'Italia - Serie A', '#ffffff', '#0000ff'),
('a', 'Italia - Serie B', '#ffffff', '#008000'),
('a', 'Italia - Serie C', '#ffffff', '#0000a0'),
('a', 'Kazakistan - Premier Liga', '#009d9d', '#ffff00'),
('a', 'Kosovo - Superliga', '#ff0000', '#ffff00'),
('a', 'Lettonia - Virsliga', '#ffffff', '#000000'),
('a', 'Liechtenstein - Challenge League', '#ffffff', '#000000'),
('a', 'Lituania - A Lyga', '#0000ff', '#ffffff'),
('a', 'Lussemburgo - Bgl Ligue', '#ffffff', '#000000'),
('a', 'Macedonia - Prva Liga', '#ff0000', '#ffff00'),
('a', 'Malta - Premier League', '#800080', '#ffffff'),
('a', 'Moldavia - Super Liga', '#ffffff', '#0000ff'),
('a', 'Montenegro - Meridianbet', '#ffffff', '#ff0000'),
('a', 'Norvegia - Eliteserien', '#ffffff', '#0000a0'),
('a', 'Olanda - Eredivisie', '#ffffff', '#0000a0'),
('a', 'Polonia - Ekstraklasa', '#ffffff', '#0000ff'),
('a', 'Portogallo - Liga Portugal', '#ffffff', '#0000a0'),
('a', 'Rep Ceca - Liga Ceca', '#ffffff', '#0000a0'),
('a', 'Romania - Superliga', '#ff0000', '#ffffff'),
('a', 'Russia - Premier Liga', '#000000', '#ffffff'),
('a', 'San Marino - Campionato Sammarinese', '#c0c0c0', '#808000'),
('a', 'Scozia - Premiership', '#ffffff', '#004080'),
('a', 'Serbia - Super Liga Srbije', '#ffff00', '#000000'),
('a', 'Slovacchia - Nike Liga', '#000000', '#ff8000'),
('a', 'Slovenia - Prva Liga', '#00ffff', '#000000'),
('a', 'Spagna - La Liga', '#ffffff', '#fb7d00'),
('a', 'Svezia - Allsvenskan', '#0000ff', '#000000'),
('a', 'Svizzera - Super League', '#ffffff', '#0000ff'),
('a', 'Turchia - Super Lig', '#c0c0c0', '#000000'),
('a', 'Ucraina - Premier Liga', '#ffffff', '#ff00ff'),
('a', 'Ungheria - NBI', '#ffffff', '#008000');

-- --------------------------------------------------------

--
-- Struttura della tabella `squadre`
--

CREATE TABLE `squadre` (
  `utente` varchar(200) NOT NULL,
  `nome` varchar(200) NOT NULL,
  `forza` int(11) NOT NULL,
  `gruppo` varchar(200) NOT NULL DEFAULT '0',
  `colore1` varchar(200) NOT NULL,
  `colore2` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `squadre`
--

INSERT INTO `squadre` (`utente`, `nome`, `forza`, `gruppo`, `colore1`, `colore2`) VALUES
('a', 'Aek Atene', 72, 'Grecia - Super League 1', '#ffff00', '#000000'),
('a', 'Ajax', 241, 'Olanda - Eredivisie', '#ffffff', '#000000'),
('a', 'Anderlecht', 112, 'Belgio - Pro League', '#8000ff', '#ffffff'),
('a', 'Andorra', 7, 'Andorra - Primera Divisio', '#000080', '#ff0000'),
('a', 'Arezzo', 4, 'Italia - Serie C', '#ffffff', '#800000'),
('a', 'Arsenal', 1170, 'Inghilterra - Premier League', '#ff0000', '#ffffff'),
('a', 'Ascoli', 5, 'Italia - Serie C', '#ffffff', '#ff0000'),
('a', 'Aston Villa', 595, 'Inghilterra - Premier League', '#00aeae', '#ffff4a'),
('a', 'Atalanta', 426, 'Italia - Serie A', '#0080ff', '#000000'),
('a', 'Athletic Bilbao', 318, 'Spagna - La Liga', '#ffffff', '#ff0000'),
('a', 'Atletico Madrid', 529, 'Spagna - La Liga', '#ff0000', '#0000ff'),
('a', 'Audace Cerignola', 4, 'Italia - Serie C', '#0000ff', '#ffff00'),
('a', 'Avellino', 7, 'Italia - Serie C', '#008000', '#ffffff'),
('a', 'Az', 65, 'Olanda - Eredivisie', '#ffffff', '#000000'),
('a', 'Backa Topola', 27, 'Serbia - Super Liga Srbije', '#ffffff', '#8080ff'),
('a', 'Ballkani', 6, 'Kosovo - Superliga', '#ffff00', '#ff0000'),
('a', 'Barcellona', 875, 'Spagna - La Liga', '#ffff00', '#ff0000'),
('a', 'Bari', 15, 'Italia - Serie B', '#ffffff', '#ff0000'),
('a', 'Basilea', 36, 'Svizzera - Super League', '#ff0000', '#0000ff'),
('a', 'Bayer Leverkusen', 627, 'Germania - Bundesliga', '#ffff00', '#ff0000'),
('a', 'Bayern Monaco', 943, 'Germania - Bundesliga', '#ff0000', '#ffffff'),
('a', 'Benevento', 8, 'Italia - Serie C', '#ff0000', '#ffff00'),
('a', 'Benfica', 344, 'Portogallo - Liga Portugal', '#c0c0c0', '#ff0000'),
('a', 'Besiktas', 140, 'Turchia - Super Lig', '#000000', '#ff0000'),
('a', 'Bodo-glimt', 37, 'Norvegia - Eliteserien', '#ffff00', '#000000'),
('a', 'Bologna', 285, 'Italia - Serie A', '#ff0000', '#0000a0'),
('a', 'Borussia Dortmund', 461, 'Germania - Bundesliga', '#ffff00', '#000000'),
('a', 'Borussia Monchengladbach', 139, 'Germania - Bundesliga', '#ffffff', '#000000'),
('a', 'Braga', 135, 'Portogallo - Liga Portugal', '#ff0000', '#ffffff'),
('a', 'Brescia', 19, 'Italia - Serie B', '#ffffff', '#0000ff'),
('a', 'Brighton', 543, 'Inghilterra - Premier League', '#0000ff', '#ffffff'),
('a', 'Cagliari', 71, 'Italia - Serie A', '#ff2020', '#0000a0'),
('a', 'Campobasso', 4, 'Italia - Serie C', '#000080', '#ff0000'),
('a', 'Cardiff', 48, 'Galles - Championship', '#ffffff', '#0000ff'),
('a', 'Carrarese', 13, 'Italia - Serie B', '#0000ff', '#ffff00'),
('a', 'Catania', 7, 'Italia - Serie C', '#0000bb', '#ff0000'),
('a', 'Catanzaro', 20, 'Italia - Serie B', '#ffff00', '#ff0000'),
('a', 'Celje', 15, 'Slovenia - Prva Liga', '#000080', '#ffffff'),
('a', 'Celtic', 119, 'Scozia - Premiership', '#008000', '#ffffff'),
('a', 'Cercle Brugge', 53, 'Belgio - Pro League', '#00ff00', '#ffffff'),
('a', 'Cesena', 23, 'Italia - Serie B', '#ffffff', '#000000'),
('a', 'Chelsea', 975, 'Inghilterra - Premier League', '#0000a0', '#ffffff'),
('a', 'Cittadella', 10, 'Italia - Serie B', '#800000', '#ffffff'),
('a', 'Club Bruges', 136, 'Belgio - Pro League', '#ffffff', '#0000ff'),
('a', 'Como', 106, 'Italia - Serie A', '#ffffff', '#0000a0'),
('a', 'Copenhagen', 71, 'Danimarca - Superliga', '#ffffff', '#004080'),
('a', 'Cosenza', 12, 'Italia - Serie B', '#ff0000', '#000040'),
('a', 'Cremonese', 40, 'Italia - Serie B', '#df0000', '#cda432'),
('a', 'Crotone', 5, 'Italia - Serie C', '#fb0000', '#0000a0'),
('a', 'Cska Mosca', 79, 'Russia - Premier Liga', '#ffff00', '#e17100'),
('a', 'Cska Sofia', 24, 'Bulgaria - Efbet Liga', '#ffffff', '#ff0000'),
('a', 'Dinamo Minsk', 7, 'Bielorussia - Vysheyshaya Liga', '#0000ff', '#ffffff'),
('a', 'Dinamo Mosca', 88, 'Russia - Premier Liga', '#ffffff', '#0000ff'),
('a', 'Dinamo Zagabria', 73, 'Croazia - Supersport HNL', '#0000ff', '#ff0000'),
('a', 'Dynamo Kyiv', 75, 'Ucraina - Premier Liga', '#ffffff', '#0000ff'),
('a', 'Eintracht Francoforte', 248, 'Germania - Bundesliga', '#ff0000', '#ffffff'),
('a', 'Empoli', 59, 'Italia - Serie A', '#0000ff', '#ffffff'),
('a', 'Fcsb', 37, 'Romania - Superliga', '#ff0000', '#ffff00'),
('a', 'Fenerbahce', 233, 'Turchia - Super Lig', '#ffffff', '#008000'),
('a', 'Feralpisalo', 5, 'Italia - Serie C', '#0000a0', '#00a600'),
('a', 'Ferencvarosi', 63, 'Ungheria - NBI', '#00df00', '#ffffff'),
('a', 'Feyenoord', 276, 'Olanda - Eredivisie', '#ff0000', '#ffffff'),
('a', 'Fiorentina', 278, 'Italia - Serie A', '#8000ff', '#ff0080'),
('a', 'Foggia', 6, 'Italia - Serie C', '#ffffff', '#ff0000'),
('a', 'Friburgo', 181, 'Germania - Bundesliga', '#ffffff', '#000000'),
('a', 'Frosinone', 30, 'Italia - Serie B', '#ffff00', '#0000ff'),
('a', 'Galatasaray', 281, 'Turchia - Super Lig', '#ffffff', '#ff8000'),
('a', 'Genk', 76, 'Belgio - Pro League', '#0000ff', '#ffffff'),
('a', 'Genoa', 134, 'Italia - Serie A', '#ff0000', '#0000ff'),
('a', 'Gent', 52, 'Belgio - Pro League', '#0000ff', '#ffffff'),
('a', 'Girona', 208, 'Spagna - La Liga', '#ff0000', '#ffffff'),
('a', 'Gubbio', 4, 'Italia - Serie C', '#8080ff', '#bf0060'),
('a', 'Hajduk Spalato', 50, 'Croazia - Supersport HNL', '#ff0000', '#0000ff'),
('a', 'Helsinki', 7, 'Finlandia - Veikkausliiga', '#0000ff', '#ffffff'),
('a', 'Hoffenheim', 154, 'Germania - Bundesliga', '#0000ff', '#ffffff'),
('a', 'Inter', 673, 'Italia - Serie A', '#0080ff', '#000000'),
('a', 'Juve Stabia', 8, 'Italia - Serie B', '#ffff00', '#0000ff'),
('a', 'Juventus', 593, 'Italia - Serie A', '#000000', '#ffffff'),
('a', 'Kauno Zalgiris', 6, 'Lituania - A Lyga', '#000000', '#008000'),
('a', 'Klaksvík', 2, 'Faroe - Betri Deildin', '#0000ff', '#ffffff'),
('a', 'Krasnodar', 81, 'Russia - Premier Liga', '#008000', '#000000'),
('a', 'Larne', 3, 'Irlanda Del Nord - Premiership', '#ffffff', '#ff0000'),
('a', 'Lask', 43, 'Austria - Bundesliga', '#ffffff', '#000000'),
('a', 'Latina', 4, 'Italia - Serie C', '#0000a0', '#000000'),
('a', 'Lazio', 223, 'Italia - Serie A', '#0080ff', '#ffffff'),
('a', 'Lecce', 93, 'Italia - Serie A', '#408080', '#ffff80'),
('a', 'Lech Poznan', 22, 'Polonia - Ekstraklasa', '#0000ff', '#ffffff'),
('a', 'Legia Varsavia', 26, 'Polonia - Ekstraklasa', '#008000', '#ffffff'),
('a', 'Lens', 172, 'Francia - Ligue 1', '#ff0000', '#ffff00'),
('a', 'Levadia', 3, 'Estonia - Premium Liiga', '#00ff00', '#000000'),
('a', 'Lilla', 247, 'Francia - Ligue 1', '#ff0000', '#0000ff'),
('a', 'Lipsia', 549, 'Germania - Bundesliga', '#ffffff', '#ff0000'),
('a', 'Liverpool', 923, 'Inghilterra - Premier League', '#00ffff', '#ff0000'),
('a', 'Lokomotiv Mosca', 65, 'Russia - Premier Liga', '#ff0000', '#00ff00'),
('a', 'Ludogorets', 51, 'Bulgaria - Efbet Liga', '#008000', '#000000'),
('a', 'Lugano', 35, 'Svizzera - Super League', '#000000', '#ffffff'),
('a', 'Maccabi Haifa', 24, 'Israele - Ligat Ha\'al', '#ffffff', '#00ff00'),
('a', 'Maccabi Tel Aviv', 22, 'Israele - Ligat Ha\'al', '#000080', '#ffff00'),
('a', 'Malmo', 33, 'Svezia - Allsvenskan', '#ffffff', '#0000ff'),
('a', 'Manchester City', 1260, 'Inghilterra - Premier League', '#00c6c6', '#ffffff'),
('a', 'Manchester United', 857, 'Inghilterra - Premier League', '#ff0000', '#ffb76f'),
('a', 'Mantova', 9, 'Italia - Serie B', '#ff0000', '#ffffff'),
('a', 'Midtjylland', 63, 'Danimarca - Superliga', '#000000', '#ff0000'),
('a', 'Milan', 601, 'Italia - Serie A', '#ff0000', '#000000'),
('a', 'Modena', 19, 'Italia - Serie B', '#ffff80', '#0000a0'),
('a', 'Molde', 29, 'Norvegia - Eliteserien', '#0080ff', '#ffffff'),
('a', 'Monopoli', 4, 'Italia - Serie C', '#ffffff', '#008000'),
('a', 'Monza', 90, 'Italia - Serie A', '#ff0000', '#ffffff'),
('a', 'Napoli', 531, 'Italia - Serie A', '#ffffff', '#0080ff'),
('a', 'Newcastle', 655, 'Inghilterra - Premier League', '#00ffff', '#000000'),
('a', 'Nizza', 226, 'Francia - Ligue 1', '#ff0000', '#000000'),
('a', 'Noah Yerevan', 7, 'Armenia - Bardsragujn Chumb', '#ffffff', '#000000'),
('a', 'Olympiacos', 92, 'Grecia - Super League 1', '#ff0000', '#ffffff'),
('a', 'Olympique Lione', 256, 'Francia - Ligue 1', '#004080', '#ff0000'),
('a', 'Olympique Marsiglia', 298, 'Francia - Ligue 1', '#00caca', '#ffffff'),
('a', 'Ordabasy', 10, 'Kazakistan - Premier Liga', '#0000ff', '#ffffff'),
('a', 'Padova', 6, 'Italia - Serie C', '#ff0000', '#ffffff'),
('a', 'Pafos', 23, 'Cipro - Protathlima Cyta', '#0000ff', '#ffffff'),
('a', 'Palermo', 51, 'Italia - Serie B', '#ff80ff', '#000000'),
('a', 'Panathinaikos', 94, 'Grecia - Super League 1', '#00ca00', '#ffffff'),
('a', 'PAOK Salonicco', 92, 'Grecia - Super League 1', '#000000', '#ffffff'),
('a', 'Paris Saint-germain', 882, 'Francia - Ligue 1', '#0000a0', '#ff0000'),
('a', 'Parma', 107, 'Italia - Serie A', '#cda434', '#000000'),
('a', 'Partizan Belgrado', 27, 'Serbia - Super Liga Srbije', '#ffffff', '#000000'),
('a', 'Partizani', 5, 'Albania - Kategoria Superiore', '#ff0000', '#ffffff'),
('a', 'Perugia', 5, 'Italia - Serie C', '#ff0000', '#ffffff'),
('a', 'Pescara', 5, 'Italia - Serie C', '#0000a0', '#00ffff'),
('a', 'Picerno', 4, 'Italia - Serie C', '#ff0000', '#0000a0'),
('a', 'Pisa', 39, 'Italia - Serie B', '#1414ff', '#ffffff'),
('a', 'Podgorica', 4, 'Montenegro - Meridianbet', '#ffffff', '#004080'),
('a', 'Porto', 316, 'Portogallo - Liga Portugal', '#0000ff', '#ffffff'),
('a', 'Psv', 311, 'Olanda - Eredivisie', '#ff0000', '#ffffff'),
('a', 'Qarabag', 20, 'Azerbaigian - Premyer Liqa', '#ffffff', '#aeae00'),
('a', 'Rakow', 25, 'Polonia - Ekstraklasa', '#ff0000', '#0070df'),
('a', 'Rangers', 78, 'Scozia - Premiership', '#0000b0', '#ff0000'),
('a', 'Rapid Vienna', 29, 'Austria - Bundesliga', '#ffff00', '#0000ff'),
('a', 'Real Betis', 192, 'Spagna - La Liga', '#00ff00', '#ffffff'),
('a', 'Real Madrid', 1340, 'Spagna - La Liga', '#e1e100', '#0000ff'),
('a', 'Real Sociedad', 431, 'Spagna - La Liga', '#0000ff', '#ff8040'),
('a', 'Reggiana', 11, 'Italia - Serie B', '#800000', '#ffff00'),
('a', 'Riga', 10, 'Lettonia - Virsliga', '#004080', '#ffffff'),
('a', 'Roma', 310, 'Italia - Serie A', '#ffb000', '#ff0000'),
('a', 'Rosenborg', 25, 'Norvegia - Eliteserien', '#000000', '#ffffff'),
('a', 'Royal Antwerp', 56, 'Belgio - Pro League', '#ff0000', '#000000'),
('a', 'Salernitana', 28, 'Italia - Serie B', '#800000', '#ffffff'),
('a', 'Salisburgo', 178, 'Austria - Bundesliga', '#ffffff', '#ff0000'),
('a', 'Sampdoria', 35, 'Italia - Serie B', '#0000ff', '#ffffff'),
('a', 'San Marino Calcio', 1, 'San Marino - Campionato Sammarinese', '#ffffff', '#0000ff'),
('a', 'Sarajevo', 10, 'Bosnia - Premijer Liga Bih', '#800000', '#ffffff'),
('a', 'Sassuolo', 85, 'Italia - Serie B', '#008000', '#000000'),
('a', 'Shakhtar Donetsk', 161, 'Ucraina - Premier Liga', '#000000', '#ff8000'),
('a', 'Shamrock', 4, 'Irlanda - Premier Division', '#00b900', '#ffffff'),
('a', 'Sheriff Tiraspol', 10, 'Moldavia - Super Liga', '#ffff00', '#000000'),
('a', 'Siviglia', 190, 'Spagna - La Liga', '#ff0000', '#ffffff'),
('a', 'Slavia Praga', 86, 'Rep Ceca - Liga Ceca', '#ffffff', '#ff0000'),
('a', 'Sliema Wanderers', 3, 'Malta - Premier League', '#004080', '#ffffff'),
('a', 'Slovan Bratislava', 24, 'Slovacchia - Nike Liga', '#00ffff', '#ff0000'),
('a', 'Spal', 5, 'Italia - Serie C', '#0080ff', '#ffffff'),
('a', 'Sparta Praga', 72, 'Rep Ceca - Liga Ceca', '#000000', '#ffffff'),
('a', 'Spartak Mosca', 95, 'Russia - Premier Liga', '#ffffff', '#ff0000'),
('a', 'Spezia', 24, 'Italia - Serie B', '#ffffff', '#000000'),
('a', 'Sporting', 392, 'Portogallo - Liga Portugal', '#008000', '#cece00'),
('a', 'St Josephs', 2, 'Gibilterra - Football League', '#ffffff', '#0000ff'),
('a', 'Stade Brestois', 123, 'Francia - Ligue 1', '#ff0000', '#ffffff'),
('a', 'Stade Reims', 119, 'Francia - Ligue 1', '#ffffff', '#ff0000'),
('a', 'Stade Rennes', 196, 'Francia - Ligue 1', '#000000', '#ff0000'),
('a', 'Standard Liegi', 48, 'Belgio - Pro League', '#bfbf00', '#ffffff'),
('a', 'Stella Rossa', 78, 'Serbia - Super Liga Srbije', '#ffffff', '#ff0000'),
('a', 'Stoccarda', 295, 'Germania - Bundesliga', '#ffff00', '#ff0000'),
('a', 'Strasburgo', 159, 'Francia - Ligue 1', '#0080ff', '#ff0000'),
('a', 'Struga Trim', 5, 'Macedonia - Prva Liga', '#000000', '#ffffff'),
('a', 'Sturm Graz', 67, 'Austria - Bundesliga', '#000000', '#ffffff'),
('a', 'Sudtirol', 12, 'Italia - Serie B', '#ff0000', '#ffffff'),
('a', 'Swansea', 41, 'Galles - Championship', '#ffffff', '#000000'),
('a', 'Swift', 3, 'Lussemburgo - Bgl Ligue', '#ff0000', '#ffffff'),
('a', 'Ternana', 7, 'Italia - Serie C', '#008040', '#ff0000'),
('a', 'Torino', 173, 'Italia - Serie A', '#800000', '#ffffff'),
('a', 'Torpedo Kutaisi', 6, 'Georgia - Erovnuli Liga', '#ffffff', '#000000'),
('a', 'Torres', 4, 'Italia - Serie C', '#ff0000', '#000000'),
('a', 'Tottenham', 770, 'Inghilterra - Premier League', '#0000a0', '#ffffff'),
('a', 'Trabzonspor', 96, 'Turchia - Super Lig', '#800040', '#0080c0'),
('a', 'Trapani', 6, 'Italia - Serie C', '#800000', '#ffff80'),
('a', 'Triestina', 8, 'Italia - Serie C', '#ff0000', '#ffffff'),
('a', 'Twente', 68, 'Olanda - Eredivisie', '#ff0000', '#ffffff'),
('a', 'Udinese', 117, 'Italia - Serie A', '#808080', '#ffffff'),
('a', 'Union Saint-gilloise', 73, 'Belgio - Pro League', '#0080ff', '#ffff00'),
('a', 'Utrecht', 39, 'Olanda - Eredivisie', '#ffffff', '#ff0000'),
('a', 'Vaduz', 4, 'Liechtenstein - Challenge League', '#ffffff', '#ff0000'),
('a', 'Valencia', 260, 'Spagna - La Liga', '#ffff00', '#df0000'),
('a', 'Valur', 3, 'Islanda - Besta Deild', '#ff0000', '#0000ff'),
('a', 'Venezia', 57, 'Italia - Serie A', '#008000', '#ff8040'),
('a', 'Verona', 79, 'Italia - Serie A', '#0000a0', '#ffff00'),
('a', 'Vicenza', 8, 'Italia - Serie C', '#ffffff', '#ff0000'),
('a', 'Viktoria Plzen', 37, 'Rep Ceca - Liga Ceca', '#ff0000', '#000080'),
('a', 'Villareal', 196, 'Spagna - La Liga', '#0000ff', '#ffff00'),
('a', 'Virtus Entella', 4, 'Italia - Serie C', '#ffffff', '#0080ff'),
('a', 'West Ham', 482, 'Inghilterra - Premier League', '#800000', '#dd6f00'),
('a', 'Wolfsburg', 211, 'Germania - Bundesliga', '#00ff00', '#ffffff'),
('a', 'Young Boys', 62, 'Svizzera - Super League', '#ffff00', '#000000'),
('a', 'Zenit', 179, 'Russia - Premier Liga', '#ffffff', '#00aeae');

-- --------------------------------------------------------

--
-- Struttura della tabella `users`
--

CREATE TABLE `users` (
  `username` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `users`
--

INSERT INTO `users` (`username`, `password`) VALUES
('a', '$2y$10$.Gie7sOEKUy6N9YQu39ANOMKJ9RjOKMHILymY3oYaxNiVkY3k6pPK');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `competizioni`
--
ALTER TABLE `competizioni`
  ADD PRIMARY KEY (`utente`,`nome`);

--
-- Indici per le tabelle `gruppi`
--
ALTER TABLE `gruppi`
  ADD PRIMARY KEY (`utente`,`nome`);

--
-- Indici per le tabelle `squadre`
--
ALTER TABLE `squadre`
  ADD PRIMARY KEY (`utente`,`nome`,`gruppo`),
  ADD KEY `squadre_ibfk_1` (`utente`,`gruppo`);

--
-- Indici per le tabelle `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`);

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `competizioni`
--
ALTER TABLE `competizioni`
  ADD CONSTRAINT `competizioni_ibfk_1` FOREIGN KEY (`utente`) REFERENCES `squadre` (`utente`) ON UPDATE CASCADE;

--
-- Limiti per la tabella `gruppi`
--
ALTER TABLE `gruppi`
  ADD CONSTRAINT `gruppi_ibfk_1` FOREIGN KEY (`utente`) REFERENCES `users` (`username`) ON UPDATE CASCADE;

--
-- Limiti per la tabella `squadre`
--
ALTER TABLE `squadre`
  ADD CONSTRAINT `squadre_ibfk_1` FOREIGN KEY (`utente`,`gruppo`) REFERENCES `gruppi` (`utente`, `nome`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
