-- Scenario 1 :  si 10 % des robots deviennent indisponibles ?

SELECT COUNT(*) AS nb_actions_avant
FROM action;


(SELECT etat, COUNT(*) AS nb_robots
FROM robot
GROUP BY etat;)


UPDATE robot
SET etat = 'hs'
WHERE id_robot IN (1, 2);

SELECT COUNT(*) AS nb_actions_apres
FROM action a
JOIN robot r ON r.id_robot = a.id_robot
WHERE r.etat = 'disponible';

-- Scenario 2 : Comment évoluent les risques si le nombre d’humains vulnérables augmente dans une zone spécifique ?


SELECT
    localisation,
    COUNT(*) AS nb_conflits_passes,
    SUM(vulnerabilite = 'elevee') AS nb_humains_vulnerables,
    10
    + 5 * SUM(vulnerabilite = 'elevee')
    + 3 * COUNT(*) AS score_risque
FROM vue_scenarios_passes
WHERE localisation = 'Mars'
GROUP BY localisation;

START TRANSACTION;

UPDATE humain
SET vulnerabilite = 'elevee'
WHERE localisation LIKE 'Mars'
LIMIT 50;

SELECT
    localisation,
    COUNT(*) AS nb_conflits_passes,
    SUM(vulnerabilite = 'elevee') AS nb_humains_vulnerables,
    10
    + 5 * SUM(vulnerabilite = 'elevee')
    + 3 * COUNT(*) AS score_risque
FROM vue_scenarios_passes
WHERE localisation = 'Mars'
GROUP BY localisation;

ROLLBACK;


