<?php

namespace App\Controller;

use DateInterval;
use DateTime;
use Exception;

require_once __DIR__ . "/../../config/config.php";

class ProposalController extends AbstractController
{

    public function index()
    {
        session_start();

        $pdo = new \PDO(DB_DSN, DB_USER, DB_PASSWORD);

        $query = "SELECT * FROM userProposal WHERE sentDate IS NULL";
        $statement = $pdo->query($query);
        $proposalsToSend = $statement->fetchAll();

        // S'il n'y a plus de propositions à envoyer, je remet la date à NULL en base pour gagner du temps pendant les tests et je vide la session
        if (empty($proposalsToSend)) {
            $query = "UPDATE userProposal SET sentDate = NULL;";
            $pdo->exec($query);
            session_destroy();
            throw new Exception("Toutes les offres ont été envoyées. Rafraichissez la page pour recommencer le cycle.");
        }

        $now = new DateTime('now');

        self::sendProposals($proposalsToSend, $now->add(new DateInterval('PT15M')), 15, $pdo);
    }

    public function sendProposals(array $userProposals, DateTime $deadline, int $proposalsByWaveMin = null, $pdo)
    {

        ### Calcul du nombre de vagues ###
        $now = new DateTime();
        if ($deadline < $now) {
            return 'La date entrée est déjà passée';
        }
        // Calcul des minutes jusqu'à $endTime
        $difference = $now->diff($deadline);
        $minutes = $difference->days * 24 * 60;
        $minutes += $difference->h * 60;
        $minutes += $difference->i;
        // On obtient le nombre de vagues à exécuter
        $wavesLeft = round($minutes / 5);
        // S'il ne s'agit pas de la première vague, le nombre de vagues restant est récupéré en session
        if (isset($_SESSION['wavesLeft'])) {
            $wavesLeft = $_SESSION['wavesLeft'];
        }
        // De même pour le nombre de propositions par vague
        if (isset($_SESSION['proposalsByWave'])) {
            $proposalsByWave = $_SESSION['proposalsByWave'];
        }

        ### Calcul de la taille de chaque vague (sauf pour la dernière) ###
        $proposalsByWave = round(count($userProposals) / $wavesLeft);
        // Si le nombre minimal de proposition à envoyer fournit est supérieur à celui calculé ci-dessus
        if (null !== $proposalsByWaveMin && $proposalsByWaveMin > $proposalsByWave) {
            $proposalsByWave = $proposalsByWaveMin;
        }

        // Pour garder le même nombre de propositions par vague dans le temps
        $_SESSION['proposalsByWave'] = $proposalsByWave;

        // S'il reste des vagues à exécuter, l'envoi de propositions se poursuit
        if ($wavesLeft) {
            // Initialisation du tableau de sortie
            $sentProposals = [];

            // Gestion du cas de la dernière vague ou le nombres de propositions est inférieur au nombre de propositions par vague, qui cause une erreur 'undefined offset'
            if (count($userProposals) < $proposalsByWave) {
                $proposalsByWave = count($userProposals);
            }

            // $i est le compteur d'offres à envoyer qui décrémente à chaque envoi
            for ($i = $proposalsByWave, $j = 0; $i > 0; $i--, $j++) {

                // Construction du tableau de sortie
                $sentProposals[$j] = $userProposals[$j];                
                $sentProposals[$j]['sentDate'] = $now;

                // Insertion de la date d'envoi en base
                $query = "UPDATE userProposal SET sentDate = CAST('". $now->format('Y-m-d H:i:s') . "' AS DATETIME) WHERE id = ". $userProposals[$j]['id'] ." ;";
                $pdo->exec($query);
            }

            // Stockage en session du nombre de vagues à jour (décrémenté)
            $_SESSION['wavesLeft'] = $wavesLeft - 1;

            // dump
            var_dump($sentProposals);
            
            return $sentProposals;
        }
    }
}
