-- Vue inverse de scenarios_passes
create view vue_scenarios_passes_23 as
select scenario.zone AS localisation,scenario.id_scenario,humain.id_humain ,humain.vulnerabilite,robot.id_robot ,robot.nom_robot ,action.reussite_robot
from scenario 
join action on action.id_scenario = scenario.id_scenario
join robot on robot.id_robot = action.id_robot
join action_humain on action_humain.id_action = action.id_action
join humain on humain.id_humain = action_humain.id_humain
where scenario.priorite_loi <> '1';

-- Permet de regrouper les scenarios passés par localisatoion
-- et de comparer le nombre de scenarios critiques aux non critiques

CREATE VIEW scenarios_par_loc AS
SELECT vue_scenarios_passes.zone AS loc_v1,
COUNT(DISTINCT vue_scenarios_passes.id_scenario) AS nb_scenarios_v1, 
COUNT(DISTINCT vue_scenarios_passes_23.id_scenario) AS nb_scenarios_v23
FROM vue_scenarios_passes
LEFT JOIN vue_scenarios_passes_23
ON vue_scenarios_passes.zone = vue_scenarios_passes_23.localisation 
GROUP BY vue_scenarios_passes.zone;


-- Permet de classer les localisations par pourcentage de scenarios critiques
create view loc_critique as SELECT loc_v1, 
ROUND((nb_scenarios_v1/(nb_scenarios_v1+nb_scenarios_v23))*100) AS pourcentage_critique 
from scenarios_par_loc Order by pourcentage_critique DESC;

-- Permet d'identifier pour chaque localisation la période la plus critique
CREATE VIEW loc_periode_critique AS
SELECT t.zone, t.periode, MAX(t.nb_periode) AS nb_periode
FROM (SELECT scenario.zone, periode, COUNT(periode) AS nb_periode FROM vue_scenarios_passes JOIN scenario ON scenario.id_scenario = vue_scenarios_passes.id_scenario
GROUP BY periode, scenario.zone 
ORDER BY vue_scenarios_passes.zone) AS t
GROUP BY t.zone;

-- Permet d'identifier pour chaque localisation l'humain le plus critique
CREATE VIEW loc_humain_critique AS
SELECT t.zone, t.id_humain, MAX(t.nb_conflits) AS nb_conflits
FROM (SELECT zone, id_humain, COUNT(id_humain) AS nb_conflits FROM vue_scenarios_passes 
GROUP BY id_humain, zone 
ORDER BY zone) AS t
GROUP BY t.zone;

-- Vue finale regroupant les informations de risque potentiel par localisation
CREATE VIEW vue_risques_potentiels AS
select loc_humain_critique.zone, pourcentage_critique, id_humain, nb_conflits, periode 
from loc_critique
join loc_periode_critique on loc_periode_critique.zone = loc_critique.loc_v1
join loc_humain_critique on loc_humain_critique.zone = loc_critique.loc_v1;


CREATE INDEX idx_periode
ON scenario(periode);

CREATE INDEX idx_localisation
ON scenario(zone);


CREATE USER 'AureSara'@'localhost'
IDENTIFIED BY 'AureSara';
GRANT SELECT ON vue_risques_potentiels TO 'AureSara'@'localhost';
SHOW GRANTS FOR 'AureSara'@'localhost';