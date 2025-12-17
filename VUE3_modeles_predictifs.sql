CREATE VIEW predictions_conflits AS
SELECT
    zone,

    COUNT(*) AS nb_conflits_passes,
    SUM(vulnerabilite = 'elevee') AS nb_humains_vulnerables,

    10
    + 5 * SUM(vulnerabilite = 'elevee')
    + 3 * COUNT(*) AS score_risque,


round(30*24/count(*),1) as temps_avant_prochain_risque


FROM vue_scenarios_passes
GROUP BY zone
ORDER BY score_risque DESC;


-- Transactions : similation intervention préventive

-- 1/Etat initial des robots

SELECT etat, COUNT(*) AS nb_robots
FROM robot
GROUP BY etat;


-- 2/ DÉBUT DE LA TRANSACTION

START TRANSACTION;

-- 3/ SÉLECTION D'UN ROBOT DISPONIBLE

SELECT id_robot
INTO @robot_id
FROM robot
WHERE etat = 'disponible'
LIMIT 1;

/* Vérification : robot sélectionné */
SELECT @robot_id AS robot_selectionne;


-- 4️ CRÉATION D'UN SAVEPOINT AVANT INTERVENTION
SAVEPOINT avant_intervention;

-- 5️ MISE À JOUR DE L'ÉTAT DU ROBOT

UPDATE robot
SET etat = 'mission'
WHERE id_robot = @robot_id;

/* Vérification intermédiaire */
SELECT id_robot, etat
FROM robot
WHERE id_robot = @robot_id;


-- 6️ ENREGISTREMENT DE L'ACTION D'INTERVENTION PRÉVENTIVE ERREUR

INSERT INTO action (id_action, id_robot, id_scenario, action, timestamp, reussite_robot)
VALUES ("99999", @robot_id, 5678, 'intervention_preventive', NOW(), '1');


-- 7️ SIMULATION D'UNE ERREUR ET ROLLBACK AU SAVEPOINT

ROLLBACK TO SAVEPOINT avant_intervention;


-- 8️ VÉRIFICATION DE L'ÉTAT DU ROBOT APRÈS ROLLBACK

SELECT id_robot, etat
FROM robot
WHERE id_robot = @robot_id;


-- 9️ VALIDATION DE LA TRANSACTION
COMMIT;


-- 10️ VÉRIFICATION FINALE

-- Le robot est bien revenu à l’état initial
SELECT etat, COUNT(*) AS nb_robots
FROM robot
GROUP BY etat;

--Droit d'accès

CREATE USER 'analyste'@'localhost'
IDENTIFIED BY 'mdp_analyste';

GRANT SELECT
ON predictions_conflits
TO 'superviseur_ethique'@'localhost';

GRANT SELECT
ON predictions_conflits
TO 'analyste'@'localhost';
