CREATE VIEW taux_reussite AS 
SELECT robot.id_robot, nom_robot, 
ROUND((COUNT(CASE WHEN reussite_robot = 1 THEN 1 END)*100)/COUNT(nom_robot),1 ) AS 'taux_reussite' 
FROM robot JOIN action ON action.id_robot = robot.id_robot GROUP BY nom_robot;


CREATE VIEW vue_globale_robots_risque AS
SELECT
    pc.localisation,
    pc.score_risque,

    r.id_robot,
    r.nom_robot,
    r.modele,

    tr.taux_reussite
FROM predictions_conflits pc
JOIN vue_scenarios_passes v
    ON v.localisation = pc.localisation
JOIN robot r
    ON r.id_robot = v.id_robot
JOIN taux_reussite tr
    ON tr.id_robot = r.id_robot
WHERE pc.score_risque >= 2000
GROUP BY
    pc.localisation,
    pc.score_risque,
    r.id_robot,
    r.nom_robot,
    r.modele,
    tr.taux_reussite;

-- Analyse de cette vue :
SELECT *
FROM vue_globale_robots_risque
ORDER BY taux_reussite DESC
LIMIT 3;

SELECT *
FROM vue_globale_robots_risque
ORDER BY taux_reussite ASC
LIMIT 1;

