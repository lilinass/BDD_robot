-- Permet de regrouper les scenarios passés par localisatoion
-- et de comparer le nombre de scenarios critiques aux non critiques
CREATE VIEW scenarios_par_loc AS
SELECT vue_scenarios_passes.localisation AS loc_v1,
COUNT(DISTINCT vue_scenarios_passes.id_scenario) AS nb_scenarios_v1, 
COUNT(DISTINCT vue_scenarios_passes_23.id_scenario) AS nb_scenarios_v23
FROM vue_scenarios_passes
LEFT JOIN vue_scenarios_passes_23
ON vue_scenarios_passes.localisation = vue_scenarios_passes_23.localisation 
GROUP BY vue_scenarios_passes.localisation


-- Permet de classer les localisations par pourcentage de scenarios critiques
create view loc_critique as SELECT loc_v1, 
ROUND((nb_scenarios_v1/(nb_scenarios_v1+nb_scenarios_v23))*100) AS pourcentage_critique 
from scenarios_par_loc Order by pourcentage_critique DESC;

-- Permet d'identifier pour chaque localisation la période la plus critique
CREATE VIEW loc_periode_critique AS
SELECT t.localisation, t.periode, MAX(t.nb_periode) AS nb_periode
FROM (SELECT localisation, periode, COUNT(periode) AS nb_periode FROM vue_scenarios_passes JOIN scenario ON scenario.id_scenario = vue_scenarios_passes.id_scenario
GROUP BY periode, localisation 
ORDER BY localisation) AS t
GROUP BY t.localisation;

-- Permet d'identifier pour chaque localisation l'humain le plus critique
CREATE VIEW loc_humain_critique AS
SELECT t.localisation, t.id_humain, MAX(t.nb_conflits) AS nb_conflits
FROM (SELECT localisation, id_humain, COUNT(id_humain) AS nb_conflits FROM vue_scenarios_passes 
GROUP BY id_humain, localisation 
ORDER BY localisation) AS t
GROUP BY t.localisation;

-- Vue finale regroupant les informations de risque potentiel par localisation
CREATE VIEW vue_risques_potentiels AS
select loc_humain_critique.localisation, pourcentage_critique, id_humain, nb_conflits, periode 
from loc_critique
join loc_periode_critique on loc_periode_critique.localisation = loc_critique.loc_v1
join loc_humain_critique on loc_humain_critique.localisation = loc_critique.loc_v1


CREATE INDEX idx_periode
ON scenario(periode);

CREATE INDEX idx_localisation
ON scenario(zone);


CREATE USER 'AureSara'@'localhost'
IDENTIFIED BY 'AureSara';
GRANT SELECT ON vue_risques_potentiels TO 'AureSara'@'localhost';
SHOW GRANTS FOR 'AureSara'@'localhost';