-- Scenario 1 : Ajouter des dimensions au modèle prédictif : Prenez en compte l’état des robots (disponibles ou en panne)
CREATE VIEW predictions_conflits_v2 AS
SELECT
    v.localisation,

    COUNT(*) AS nb_conflits_passes,
    SUM(v.vulnerabilite = 'elevee') AS nb_humains_vulnerables,

    
    COUNT(DISTINCT CASE 
        WHEN r.etat = 'disponible' THEN r.id_robot 
    END) AS nb_robots_disponibles,

    COUNT(DISTINCT CASE 
        WHEN r.etat <> 'disponible' THEN r.id_robot 
    END) AS nb_robots_indisponibles,

  
    10
    + 5 * SUM(v.vulnerabilite = 'elevee')
    + 3 * COUNT(*)
    + 4 * COUNT(DISTINCT CASE 
        WHEN r.etat <> 'disponible' THEN r.id_robot 
    END) AS score_risque,

    ROUND((30 * 24) / COUNT(*), 1) AS temps_avant_prochain_risque

FROM vue_scenarios_passes v
JOIN robot r ON r.id_robot = v.id_robot
GROUP BY v.localisation;


-- Scenario 3 :  si 10 % des robots deviennent indisponibles ?

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

-- Scenario 4 : Comment évoluent les risques si le nombre d’humains vulnérables augmente dans une zone spécifique ?

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

--Scenario 5 : Tableau d'alerte 

CREATE VIEW tableau_alerte AS
SELECT
    localisation,
    score_risque,
    CASE
        WHEN score_risque >= 3000 THEN 'Rouge'
        WHEN score_risque >= 2000 THEN 'Orange'
        ELSE 'Vert'
    END AS niveau_alerte,

    CASE 
        WHEN score_risque >= 3000 THEN 'Envoyez des robots immédiatement !!!'
        WHEN score_risque >= 2000 THEN 'Faites attentiion...'
        ELSE 'Situation sous contrôle'
    END AS recommandation

FROM predictions_conflits_v2
ORDER BY score_risque DESC; 
