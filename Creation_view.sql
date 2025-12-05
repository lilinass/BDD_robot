CREATE VIEW taux_reussite AS 
SELECT robot.id_robot, nom_robot, 
ROUND((COUNT(CASE WHEN reussite_robot = 1 THEN 1 END)*100)/COUNT(nom_robot),1 ) AS 'taux_reussite' 
FROM robot JOIN action ON action.id_robot = robot.id_robot GROUP BY nom_robot;