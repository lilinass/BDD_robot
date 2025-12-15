Select localisation,

COUNT(*) as conflits_passes,

SUM(CASE WHEN vulnerabilite = 'elevee' THEN 1 ELSE 0 END) as nb_humains_vulnerables

-- il manque l'addition que j'ai pas tout compris lol 

FROM vue_scenarios_passes
GROUP BY localisation


