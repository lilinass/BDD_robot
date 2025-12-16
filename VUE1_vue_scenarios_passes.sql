Create view vue_scenarios_passes AS
SELECT 
  scenario.zone AS zone,
  scenario.id_scenario,
  humain.id_humain,
  humain.vulnerabilite,
  robot.id_robot,
  nom_robot,
  action.reussite_robot 
FROM scenario

JOIN action ON action.id_scenario = scenario.id_scenario
JOIN robot ON robot.id_robot = action.id_robot
JOIN action_humain ON action_humain.id_action = action.id_action
JOIN humain ON humain.id_humain = action_humain.id_humain

WHERE scenario.priorite_loi = "1";

-- Analyse de cette vue :

-- 1 Pour avoir le nombre d'interventions et le nombre de réussites par robot :

SELECT 
    id_robot,
    nom_robot,
    COUNT(*) AS nb_interventions,
    SUM(reussite_robot) AS nb_reussite
FROM vue_scenarios_passes
GROUP BY id_robot, nom_robot
ORDER BY nb_reussite DESC


-- 2 Pour avoir le nombre d'interventions par localisation (donc les zones les plus critiques) :

SELECT
    localisation,
    COUNT(*) AS nb_incidents
FROM vue_scenarios_passes
GROUP BY localisation
ORDER BY nb_incidents DESC;

-- 3 Zones où les plus vulnérables doivent être protégés en priorité :

SELECT
    localisation,
    COUNT(*) AS nb_humains_tres_vulnerables
FROM vue_scenarios_passes
WHERE vulnerabilite = 'elevee'
GROUP BY localisation
ORDER BY nb_humains_tres_vulnerables DESC;

--Création des index pour optimiser les requêtes sur la vue
CREATE INDEX idx_scenario_priorite
ON scenario(priorite_loi);

CREATE INDEX idx_scenario_zone
ON scenario(zone);

CREATE INDEX idx_humain_vulnerabilite
ON humain(vulnerabilite);


-- Gestion d'accès

CREATE USER 'superviseur_ethique'@'localhost'
IDENTIFIED BY 'mot_de_passe_securise';

GRANT SELECT ON vue_scenarios_passes TO 'superviseur_ethique'@'localhost';


REVOKE ALL PRIVILEGES
ON scenario
FROM 'superviseur_ethique'@'localhost';

REVOKE ALL PRIVILEGES
ON humain
FROM 'superviseur_ethique'@'localhost';

REVOKE ALL PRIVILEGES
ON action
FROM 'superviseur_ethique'@'localhost';

SHOW GRANTS FOR 'superviseur_ethique'@'localhost';

