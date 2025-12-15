ALTER TABLE `action` ADD `reussite_robot` BOOLEAN NOT NULL DEFAULT TRUE AFTER `timestamp`;

-- Ajout des robots 
INSERT INTO `robot` (`nom_robot`, `modele`, `etat`) VALUES
('R. Daneel Olivaw', 'Humanoïde Série A', 'actif'),
('Giskard Reventlov', 'Cognitif Série B', 'actif'),
('SusanUnit-01', 'AssistPro V3', 'actif'),
('Multivac-Mini', 'DataCore X1', 'actif'),
('AuroraPrime', 'Exploration Zeta', 'actif'),
('Helios-7', 'SolarTech V2', 'actif'),
('Prometheus-X', 'InnovBot 3000', 'actif'),
('Galaxion', 'AstroMech S5', 'actif'),
('ZenithCore', 'AI-Drive 12', 'actif'),
('NovaSentinel', 'Guardian MkII', 'actif'),
('Atlas-9', 'TitanForge', 'actif'),
('Orpheus', 'HarmonyBot', 'actif'),
('Vega-Unit', 'Stellar AI', 'actif'),
('Horizon-X', 'Explorer 4X', 'actif'),
('Polaris', 'NavBot 22', 'actif'),
('Quantum-Delta', 'QBot 500', 'actif'),
('Neuronix', 'NeuroCore V5', 'actif'),
('Synapse', 'BioMech 2.0', 'actif'),
('Solaris', 'EnergyBot', 'actif'),
('Axioma', 'LogicUnit 7', 'actif')



-- Ajout des humains
INSERT INTO `humain` (`nom_humain`, `vulnerabilite`, `localisation`) VALUES
('Alice Dupont', 'faible', 'Mars'),
('Jean Martin', 'moyenne', 'Lune Europa'),
('Sophie Bernard', 'elevee', 'Titan'),
('Paul Durand', 'faible', 'Io'),
('Claire Petit', 'moyenne', 'Colonie Alpha Centauri'),
('Luc Moreau', 'faible', 'Mercure'),
('Emma Lefevre', 'elevee', 'Station orbitale Orion'),
('Hugo Robert', 'faible', 'Venus'),
('Chloé Fontaine', 'moyenne', 'Colonie sur Proxima b'),
('Louis Girard', 'faible', 'Ganymède'),
('Camille Roche', 'elevee', 'Callisto'),
('Julien Caron', 'faible', 'Phobos'),
('Manon Blanchard', 'moyenne', 'Deimos'),
('Antoine Fabre', 'faible', 'Colonie sur Kepler-452b'),
('Laura Gauthier', 'elevee', 'Station spatiale Aurora'),
('Thomas Chevalier', 'faible', 'Encelade'),
('Élise Marchand', 'moyenne', 'Colonie sur Gliese 581g'),
('Pierre Lambert', 'faible', 'Cérès'),
('Sarah Dupuis', 'elevee', 'Station orbitale Vega'),
('Nicolas Perrin', 'faible', 'Pluton'),
('Julie Masson', 'moyenne', 'Colonie sur Trappist-1e'),
('Adrien Noël', 'faible', 'Station orbitale Solaris'),
('Marine Colin', 'elevee', 'Colonie sur Tau Ceti f'),
('Alexandre Roy', 'faible', 'Station orbitale Helios'),
('Charlotte Henry', 'moyenne', 'Colonie sur Ross 128b'),
('Maxime Lucas', 'faible', 'Station orbitale Borealis'),
('Élodie Garnier', 'elevee', 'Colonie sur Wolf 1061c'),
('Bastien Renaud', 'faible', 'Station orbitale Hyperion'),
('Mélanie Barbier', 'moyenne', 'Colonie sur Luyten b'),
('Victor Leclerc', 'faible', 'Station orbitale Minerva'),
('Isabelle Dupre', 'elevee', 'Colonie sur Epsilon Eridani b'),
('Damien Millet', 'faible', 'Station orbitale Pandora'),
('Aurélie Faure', 'moyenne', 'Colonie sur Kapteyn b'),
('Guillaume Charpentier', 'faible', 'Station orbitale Atlas'),
('Caroline Hubert', 'elevee', 'Colonie sur HD 40307g'),
('Raphaël Morin', 'faible', 'Station orbitale Selene'),
('Amélie Renard', 'moyenne', 'Colonie sur Barnard’s Star b'),
('François Pelletier', 'faible', 'Station orbitale Daedalus'),
('Anaïs Guerin', 'elevee', 'Colonie sur Kepler-22b'),
('Mathieu Dumas', 'faible', 'Station orbitale Gaia'),
('Claire Renault', 'moyenne', 'Colonie sur Kepler-186f'),
('Olivier Georges', 'faible', 'Station orbitale Hermes'),
('Sandrine Boyer', 'elevee', 'Colonie sur Gliese 667Cc'),
('Cédric Pons', 'faible', 'Station orbitale Vulcan'),
('Valérie Didier', 'moyenne', 'Colonie sur Kepler-62f'),
('Stéphane Aubry', 'faible', 'Station orbitale Phoenix'),
('Nathalie Carpentier', 'elevee', 'Colonie sur Kepler-69c'),
('Romain Lefort', 'faible', 'Station orbitale Argus'),
('Patricia Millet', 'moyenne', 'Colonie sur Kepler-442b'),
('Laurent Faivre', 'faible', 'Station orbitale Nexus');


--  Ajout des scénarios
INSERT INTO `scenario` (`description`, `priorite_loi`, `zone`, `nom_scenario`, `periode`) VALUES
-- 🔹 Patrouille de sécurité (très fréquent, loi 1)
('Patrouille de sécurité dans la zone minière', '1', 'Mars', 'Patrouille de sécurité', 'matin'),
('Patrouille de sécurité dans la station orbitale', '1', 'Station Orion', 'Patrouille de sécurité', 'matin'),
('Patrouille de sécurité dans la colonie', '1', 'Proxima b', 'Patrouille de sécurité', 'soir'),
('Patrouille de sécurité dans la zone industrielle', '1', 'Titan', 'Patrouille de sécurité', 'nuit'),
('Patrouille de sécurité dans la zone agricole', '1', 'Europa', 'Patrouille de sécurité', 'midi'),
('Patrouille de sécurité dans la zone résidentielle', '1', 'Station Vega', 'Patrouille de sécurité', 'matin'),
('Patrouille de sécurité dans la zone scientifique', '1', 'Mars', 'Patrouille de sécurité', 'soir'),

-- 🔹 Sauvetage médical (fréquent, loi 1)
('Sauvetage médical dans la colonie', '1', 'Proxima b', 'Sauvetage médical', 'midi'),
('Sauvetage médical dans la station orbitale', '1', 'Station Vega', 'Sauvetage médical', 'soir'),
('Sauvetage médical dans la zone minière', '1', 'Mars', 'Sauvetage médical', 'matin'),
('Sauvetage médical dans la zone industrielle', '1', 'Titan', 'Sauvetage médical', 'nuit'),
('Sauvetage médical dans la zone agricole', '1', 'Europa', 'Sauvetage médical', 'midi'),

-- 🔹 Exploration scientifique (moyennement fréquent, loi 2)
('Exploration scientifique dans la zone polaire', '2', 'Europa', 'Exploration scientifique', 'matin'),
('Exploration scientifique dans la zone désertique', '2', 'Mars', 'Exploration scientifique', 'soir'),
('Exploration scientifique dans la zone aquatique', '2', 'Titan', 'Exploration scientifique', 'midi'),
('Exploration scientifique dans la zone forestière', '2', 'Proxima b', 'Exploration scientifique', 'nuit'),

-- 🔹 Maintenance robotique (fréquent, loi 3)
('Maintenance robotique dans la station orbitale', '3', 'Station Orion', 'Maintenance robotique', 'soir'),
('Maintenance robotique dans la colonie', '3', 'Proxima b', 'Maintenance robotique', 'matin'),
('Maintenance robotique dans la zone minière', '3', 'Mars', 'Maintenance robotique', 'nuit'),
('Maintenance robotique dans la zone industrielle', '3', 'Titan', 'Maintenance robotique', 'soir'),
('Maintenance robotique dans la zone agricole', '3', 'Europa', 'Maintenance robotique', 'midi'),
('Maintenance robotique dans la zone scientifique', '3', 'Station Vega', 'Maintenance robotique', 'soir'),

-- 🔹 Transport de ressources (assez fréquent, loi 2)
('Transport de ressources vers la station orbitale', '2', 'Station Orion', 'Transport de ressources', 'nuit'),
('Transport de ressources vers la colonie', '2', 'Proxima b', 'Transport de ressources', 'soir'),
('Transport de ressources vers la zone minière', '2', 'Mars', 'Transport de ressources', 'midi'),
('Transport de ressources vers la zone agricole', '2', 'Europa', 'Transport de ressources', 'matin'),

-- 🔹 Surveillance environnementale (fréquent, loi 1)
('Surveillance environnementale dans la zone polaire', '1', 'Europa', 'Surveillance environnementale', 'matin'),
('Surveillance environnementale dans la zone désertique', '1', 'Mars', 'Surveillance environnementale', 'soir'),
('Surveillance environnementale dans la zone aquatique', '1', 'Titan', 'Surveillance environnementale', 'midi'),
('Surveillance environnementale dans la zone forestière', '1', 'Proxima b', 'Surveillance environnementale', 'nuit'),
('Surveillance environnementale dans la zone orbitale', '1', 'Station Vega', 'Surveillance environnementale', 'matin'),

-- 🔹 Diplomatie inter-colonies (rare, loi 3)
('Diplomatie inter-colonies sur Proxima b', '3', 'Proxima b', 'Diplomatie inter-colonies', 'soir'),
('Diplomatie inter-colonies sur Station Vega', '3', 'Station Vega', 'Diplomatie inter-colonies', 'midi'),

-- 🔹 Défense militaire (moyennement fréquent, loi 1)
('Défense militaire dans la zone orbitale', '1', 'Station Orion', 'Défense militaire', 'nuit'),
('Défense militaire dans la colonie', '1', 'Proxima b', 'Défense militaire', 'soir'),
('Défense militaire dans la zone minière', '1', 'Mars', 'Défense militaire', 'matin'),
('Défense militaire dans la zone industrielle', '1', 'Titan', 'Défense militaire', 'soir'),

-- 🔹 Sauvegarde des données (rare, loi 2)
('Sauvegarde des données dans la station orbitale', '2', 'Station Vega', 'Sauvegarde des données', 'midi'),
('Sauvegarde des données dans la colonie', '2', 'Proxima b', 'Sauvegarde des données', 'soir'),

-- 🔹 Scénarios uniques (pour irrégularité)
('Inspection des communications interstellaires', '2', 'Station Orion', 'Inspection des communications', 'matin'),
('Formation des nouveaux pilotes', '3', 'Mars', 'Formation des pilotes', 'midi'),
('Expérimentation biologique', '2', 'Europa', 'Expérimentation biologique', 'soir'),
('Gestion de crise énergétique', '1', 'Titan', 'Crise énergétique', 'nuit'),
('Évacuation d’urgence', '1', 'Station Vega', 'Évacuation d’urgence', 'soir');


-- Ajout des actions liées aux scénarios

INSERT INTO `action` (`id_robot`, `id_scenario`, `action`, `timestamp`, `reussite_robot`) VALUES
-- Scénario 1 (matin, Mars) - Patrouille (répétitions sur l'année)
(1, 1, 'Patrouiller le périmètre', '2025-01-05 07:10:00', TRUE),
(2, 1, 'Surveiller les capteurs', '2025-01-05 08:05:00', TRUE),
(3, 1, 'Patrouiller le périmètre', '2025-01-05 09:45:00', FALSE),
(4, 1, 'Surveiller les capteurs', '2025-02-09 06:55:00', TRUE),
(5, 1, 'Patrouiller le périmètre', '2025-02-09 08:20:00', TRUE),
(6, 1, 'Sauver un humain', '2025-03-13 10:40:00', TRUE),
(7, 1, 'Patrouiller le périmètre', '2025-04-02 07:25:00', TRUE),
(8, 1, 'Surveiller les capteurs', '2025-04-02 08:50:00', FALSE),
(9, 1, 'Patrouiller le périmètre', '2025-05-18 06:30:00', TRUE),
(10, 1, 'Sauver un humain', '2025-05-18 10:15:00', TRUE),

-- Scénario 2 (matin, Station Orion) - Patrouille
(11, 2, 'Patrouiller le périmètre', '2025-01-12 06:40:00', TRUE),
(12, 2, 'Surveiller les capteurs', '2025-01-12 07:55:00', TRUE),
(13, 2, 'Patrouiller le périmètre', '2025-02-22 09:25:00', TRUE),
(14, 2, 'Sauver un humain', '2025-03-03 10:50:00', FALSE),
(15, 2, 'Surveiller les capteurs', '2025-03-03 08:15:00', TRUE),
(16, 2, 'Patrouiller le périmètre', '2025-04-11 06:05:00', TRUE),
(17, 2, 'Surveiller les capteurs', '2025-04-11 10:30:00', TRUE),
(18, 2, 'Patrouiller le périmètre', '2025-06-01 07:35:00', FALSE),
(19, 2, 'Patrouiller le périmètre', '2025-07-07 09:10:00', TRUE),
(20, 2, 'Sauver un humain', '2025-07-07 10:45:00', TRUE),

-- Scénario 6 (midi, Proxima b) - Sauvetage médical (très fréquent)
(1, 6, 'Sauver un humain', '2025-01-14 11:20:00', TRUE),
(2, 6, 'Analyser des données', '2025-01-14 11:55:00', TRUE),
(3, 6, 'Sauver un humain', '2025-01-14 12:40:00', TRUE),
(4, 6, 'Sauver un humain', '2025-01-14 13:15:00', FALSE),
(5, 6, 'Sauver un humain', '2025-02-10 11:35:00', TRUE),
(6, 6, 'Analyser des données', '2025-02-10 12:25:00', TRUE),
(7, 6, 'Sauver un humain', '2025-02-10 13:05:00', TRUE),
(8, 6, 'Sauver un humain', '2025-03-21 11:50:00', TRUE),
(9, 6, 'Sauver un humain', '2025-03-21 12:20:00', FALSE),
(10, 6, 'Analyser des données', '2025-03-21 13:40:00', TRUE),
(11, 6, 'Sauver un humain', '2025-04-09 11:10:00', TRUE),
(12, 6, 'Sauver un humain', '2025-04-09 12:50:00', TRUE),
(13, 6, 'Analyser des données', '2025-04-09 13:30:00', FALSE),
(14, 6, 'Sauver un humain', '2025-05-25 11:05:00', TRUE),
(15, 6, 'Sauver un humain', '2025-05-25 12:15:00', TRUE),
(16, 6, 'Analyser des données', '2025-05-25 13:10:00', TRUE),
(17, 6, 'Sauver un humain', '2025-06-18 11:45:00', FALSE),
(18, 6, 'Sauver un humain', '2025-06-18 12:40:00', TRUE),
(19, 6, 'Analyser des données', '2025-06-18 13:25:00', TRUE),
(20, 6, 'Sauver un humain', '2025-07-12 11:30:00', TRUE),
(1, 6, 'Sauver un humain', '2025-07-12 12:05:00', TRUE),
(2, 6, 'Analyser des données', '2025-07-12 12:50:00', FALSE),
(3, 6, 'Sauver un humain', '2025-08-03 11:40:00', TRUE),
(4, 6, 'Sauver un humain', '2025-08-03 12:35:00', TRUE),
(5, 6, 'Analyser des données', '2025-08-03 13:20:00', TRUE),
(6, 6, 'Sauver un humain', '2025-09-09 11:25:00', TRUE),
(7, 6, 'Sauver un humain', '2025-09-09 12:10:00', FALSE),
(8, 6, 'Analyser des données', '2025-09-09 13:05:00', TRUE),
(9, 6, 'Sauver un humain', '2025-10-16 11:55:00', TRUE),
(10, 6, 'Sauver un humain', '2025-10-16 12:40:00', TRUE),
(11, 6, 'Analyser des données', '2025-10-16 13:30:00', TRUE),
(12, 6, 'Sauver un humain', '2025-11-04 11:15:00', TRUE),
(13, 6, 'Sauver un humain', '2025-11-04 12:25:00', FALSE),
(14, 6, 'Sauver un humain', '2025-11-04 13:10:00', TRUE),

-- Scénario 13 (soir, Mars) - Exploration scientifique
(15, 13, 'Analyser des données', '2025-01-20 18:10:00', TRUE),
(16, 13, 'Transporter des ressources', '2025-01-20 19:05:00', TRUE),
(17, 13, 'Analyser des données', '2025-01-20 20:40:00', FALSE),
(18, 13, 'Analyser des données', '2025-03-02 18:50:00', TRUE),
(19, 13, 'Transporter des ressources', '2025-03-02 19:30:00', TRUE),
(20, 13, 'Analyser des données', '2025-03-02 20:20:00', TRUE),
(1, 13, 'Sauver un humain', '2025-05-08 17:25:00', TRUE),
(2, 13, 'Analyser des données', '2025-05-08 18:40:00', TRUE),
(3, 13, 'Analyser des données', '2025-05-08 19:55:00', FALSE),
(4, 13, 'Transporter des ressources', '2025-08-26 18:15:00', TRUE),
(5, 13, 'Analyser des données', '2025-08-26 19:10:00', TRUE),
(6, 13, 'Analyser des données', '2025-08-26 20:30:00', TRUE),

-- Scénario 17 (soir, Station Orion) - Maintenance
(7, 17, 'Réparer les systèmes', '2025-02-05 18:25:00', TRUE),
(8, 17, 'Réparer les systèmes', '2025-02-05 19:20:00', FALSE),
(9, 17, 'Analyser des données', '2025-02-05 20:15:00', TRUE),
(10, 17, 'Sauver un humain', '2025-04-14 17:50:00', TRUE),
(11, 17, 'Réparer les systèmes', '2025-04-14 18:30:00', TRUE),
(12, 17, 'Analyser des données', '2025-04-14 19:40:00', TRUE),
(13, 17, 'Réparer les systèmes', '2025-07-01 18:05:00', TRUE),
(14, 17, 'Réparer les systèmes', '2025-07-01 19:25:00', FALSE),
(15, 17, 'Analyser des données', '2025-07-01 20:50:00', TRUE),

-- Scénario 21 (nuit, Station Orion) - Transport
(16, 21, 'Transporter des ressources', '2025-01-28 23:35:00', TRUE),
(17, 21, 'Transporter des ressources', '2025-01-28 00:55:00', TRUE),
(18, 21, 'Analyser des données', '2025-01-28 02:15:00', FALSE),
(19, 21, 'Transporter des ressources', '2025-04-06 23:10:00', TRUE),
(20, 21, 'Transporter des ressources', '2025-04-06 01:05:00', TRUE),
(1, 21, 'Sauver un humain', '2025-04-06 03:40:00', FALSE),
(2, 21, 'Transporter des ressources', '2025-06-19 22:25:00', TRUE),
(3, 21, 'Transporter des ressources', '2025-06-19 23:50:00', TRUE),
(4, 21, 'Analyser des données', '2025-06-19 01:35:00', TRUE),

-- Scénario 26 (matin, Europa) - Surveillance environnementale
(5, 26, 'Surveiller les capteurs', '2025-02-17 07:20:00', TRUE),
(6, 26, 'Sauver un humain', '2025-02-17 08:45:00', TRUE),
(7, 26, 'Surveiller les capteurs', '2025-02-17 10:05:00', FALSE),
(8, 26, 'Surveiller les capteurs', '2025-05-23 06:40:00', TRUE),
(9, 26, 'Sauver un humain', '2025-05-23 09:30:00', TRUE),
(10, 26, 'Surveiller les capteurs', '2025-05-23 10:50:00', TRUE),
(11, 26, 'Sauver un humain', '2025-08-04 07:35:00', TRUE),
(12, 26, 'Surveiller les capteurs', '2025-08-04 08:55:00', FALSE),
(13, 26, 'Sauver un humain', '2025-08-04 09:40:00', TRUE),

-- Scénario 31 (soir, Proxima b) - Diplomatie
(14, 31, 'Analyser des données', '2025-03-11 17:10:00', TRUE),
(15, 31, 'Sauver un humain', '2025-03-11 18:25:00', TRUE),
(16, 31, 'Analyser des données', '2025-03-11 19:40:00', TRUE),
(17, 31, 'Sauver un humain', '2025-06-07 18:05:00', TRUE),
(18, 31, 'Analyser des données', '2025-06-07 19:15:00', FALSE),
(19, 31, 'Analyser des données', '2025-06-07 20:20:00', TRUE),

-- Scénario 35 (nuit, Station Orion) - Défense
(20, 35, 'Réparer les systèmes', '2025-02-01 23:50:00', TRUE),
(1, 35, 'Sauver un humain', '2025-02-01 01:10:00', TRUE),
(2, 35, 'Réparer les systèmes', '2025-02-01 02:35:00', FALSE),
(3, 35, 'Analyser des données', '2025-05-29 22:45:00', TRUE),
(4, 35, 'Sauver un humain', '2025-05-29 00:30:00', TRUE),
(5, 35, 'Analyser des données', '2025-05-29 03:10:00', TRUE),

-- Scénario 39 (midi, Station Vega) - Sauvegarde des données
(6, 39, 'Analyser des données', '2025-01-18 11:45:00', TRUE),
(7, 39, 'Sauver un humain', '2025-01-18 12:20:00', FALSE),
(8, 39, 'Analyser des données', '2025-01-18 13:40:00', TRUE),
(9, 39, 'Analyser des données', '2025-04-20 11:15:00', TRUE),
(10, 39, 'Sauver un humain', '2025-04-20 12:05:00', TRUE),
(11, 39, 'Analyser des données', '2025-04-20 13:25:00', TRUE),
(12, 39, 'Analyser des données', '2025-09-01 11:30:00', TRUE),
(13, 39, 'Sauver un humain', '2025-09-01 12:10:00', FALSE),
(14, 39, 'Analyser des données', '2025-09-01 13:35:00', TRUE),

-- Scénario 45 (matin, Station Orion) - Inspection communications
(15, 45, 'Surveiller les capteurs', '2025-03-06 07:05:00', TRUE),
(16, 45, 'Sauver un humain', '2025-03-06 08:35:00', TRUE),
(17, 45, 'Surveiller les capteurs', '2025-03-06 10:10:00', TRUE),
(18, 45, 'Surveiller les capteurs', '2025-07-24 06:55:00', FALSE),
(19, 45, 'Sauver un humain', '2025-07-24 09:50:00', TRUE),

-- Scénario 49 (soir, Station Vega) - Évacuation d’urgence (très fréquent sauvetage)
(20, 49, 'Sauver un humain', '2025-01-30 17:20:00', TRUE),
(1, 49, 'Sauver un humain', '2025-01-30 18:05:00', TRUE),
(2, 49, 'Analyser des données', '2025-01-30 19:15:00', FALSE),
(3, 49, 'Sauver un humain', '2025-03-15 18:50:00', TRUE),
(4, 49, 'Sauver un humain', '2025-03-15 19:30:00', TRUE),
(5, 49, 'Analyser des données', '2025-03-15 20:45:00', TRUE),
(6, 49, 'Sauver un humain', '2025-05-10 17:35:00', TRUE),
(7, 49, 'Sauver un humain', '2025-05-10 18:25:00', FALSE),
(8, 49, 'Sauver un humain', '2025-05-10 19:40:00', TRUE),
(9, 49, 'Analyser des données', '2025-07-19 17:10:00', TRUE),
(10, 49, 'Sauver un humain', '2025-07-19 18:45:00', TRUE),
(11, 49, 'Sauver un humain', '2025-07-19 20:10:00', TRUE),
(12, 49, 'Sauver un humain', '2025-09-27 17:55:00', TRUE),
(13, 49, 'Analyser des données', '2025-09-27 18:35:00', FALSE),
(14, 49, 'Sauver un humain', '2025-09-27 19:25:00', TRUE),

-- Reprises supplémentaires pour atteindre 200 (répartitions et répétitions variées)

-- Scénario 6 (midi) - lot supplémentaire
(15, 6, 'Sauver un humain', '2025-12-02 11:05:00', TRUE),
(16, 6, 'Analyser des données', '2025-12-02 11:50:00', TRUE),
(17, 6, 'Sauver un humain', '2025-12-02 12:30:00', TRUE),
(18, 6, 'Sauver un humain', '2025-12-02 13:10:00', FALSE),

-- Scénario 49 (soir) - lot supplémentaire
(19, 49, 'Sauver un humain', '2025-12-11 17:30:00', TRUE),
(20, 49, 'Sauver un humain', '2025-12-11 18:20:00', TRUE),
(1, 49, 'Analyser des données', '2025-12-11 19:35:00', TRUE),
(2, 49, 'Sauver un humain', '2025-12-11 20:10:00', FALSE),

-- Scénario 1 (matin)
(3, 1, 'Patrouiller le périmètre', '2025-10-05 06:50:00', TRUE),
(4, 1, 'Surveiller les capteurs', '2025-10-05 08:25:00', TRUE),
(5, 1, 'Sauver un humain', '2025-10-05 09:55:00', TRUE),

-- Scénario 2 (matin)
(6, 2, 'Patrouiller le périmètre', '2025-11-18 07:15:00', TRUE),
(7, 2, 'Surveiller les capteurs', '2025-11-18 09:05:00', FALSE),

-- Scénario 13 (soir)
(8, 13, 'Analyser des données', '2025-11-22 18:40:00', TRUE),
(9, 13, 'Transporter des ressources', '2025-11-22 19:20:00', TRUE),
(10, 13, 'Analyser des données', '2025-11-22 20:10:00', TRUE),

-- Scénario 17 (soir)
(11, 17, 'Réparer les systèmes', '2025-10-14 17:35:00', TRUE),
(12, 17, 'Analyser des données', '2025-10-14 18:50:00', TRUE),

-- Scénario 21 (nuit)
(13, 21, 'Transporter des ressources', '2025-10-21 22:15:00', TRUE),
(14, 21, 'Analyser des données', '2025-10-21 23:55:00', FALSE),

-- Scénario 26 (matin)
(15, 26, 'Surveiller les capteurs', '2025-10-08 07:25:00', TRUE),

-- Scénario 31 (soir)
(16, 31, 'Sauver un humain', '2025-11-07 18:10:00', TRUE),
(17, 31, 'Analyser des données', '2025-11-07 19:35:00', TRUE),

-- Scénario 35 (nuit)
(18, 35, 'Réparer les systèmes', '2025-11-27 23:05:00', TRUE),
(19, 35, 'Sauver un humain', '2025-11-27 00:50:00', TRUE),

-- Scénario 39 (midi)
(20, 39, 'Analyser des données', '2025-11-13 11:25:00', TRUE),
(1, 39, 'Sauver un humain', '2025-11-13 12:05:00', FALSE),
(2, 39, 'Analyser des données', '2025-11-13 13:15:00', TRUE),

-- Scénario 45 (matin)
(3, 45, 'Surveiller les capteurs', '2025-12-07 06:45:00', TRUE),
(4, 45, 'Sauver un humain', '2025-12-07 08:20:00', TRUE),

-- Scénario 49 (soir)
(5, 49, 'Sauver un humain', '2025-10-28 17:10:00', TRUE),
(6, 49, 'Analyser des données', '2025-10-28 18:25:00', TRUE),
(7, 49, 'Sauver un humain', '2025-10-28 19:35:00', FALSE),

-- Ajouts massifs pour atteindre 200: cycles avec forte présence de "Sauver un humain"

-- Cycle A: 6 (midi), 49 (soir)
(8, 6, 'Sauver un humain', '2025-08-12 11:10:00', TRUE),
(9, 6, 'Sauver un humain', '2025-08-12 12:00:00', TRUE),
(10, 6, 'Analyser des données', '2025-08-12 13:20:00', TRUE),
(11, 49, 'Sauver un humain', '2025-08-13 17:25:00', TRUE),
(12, 49, 'Sauver un humain', '2025-08-13 18:30:00', FALSE),
(13, 49, 'Analyser des données', '2025-08-13 19:45:00', TRUE),

-- Cycle B: 1 (matin), 2 (matin)
(14, 1, 'Patrouiller le périmètre', '2025-09-06 06:55:00', TRUE),
(15, 1, 'Surveiller les capteurs', '2025-09-06 08:35:00', TRUE),
(16, 2, 'Patrouiller le périmètre', '2025-09-08 07:20:00', FALSE),
(17, 2, 'Sauver un humain', '2025-09-08 10:45:00', TRUE),

-- Cycle C: 13 (soir), 17 (soir), 21 (nuit)
(18, 13, 'Analyser des données', '2025-07-03 18:30:00', TRUE),
(19, 17, 'Réparer les systèmes', '2025-07-03 19:40:00', FALSE),
(20, 21, 'Transporter des ressources', '2025-07-04 00:20:00', TRUE),

-- Cycle D: 26 (matin), 31 (soir), 35 (nuit)
(1, 26, 'Surveiller les capteurs', '2025-06-26 06:35:00', TRUE),
(2, 31, 'Sauver un humain', '2025-06-26 18:05:00', TRUE),
(3, 35, 'Analyser des données', '2025-06-27 01:15:00', TRUE),

-- Cycle E: 39 (midi), 45 (matin), 49 (soir)
(4, 39, 'Analyser des données', '2025-05-15 11:35:00', TRUE),
(5, 45, 'Surveiller les capteurs', '2025-05-16 07:15:00', TRUE),
(6, 49, 'Sauver un humain', '2025-05-16 18:10:00', TRUE),

-- Cycle F: répétitions orientées sauvetage
(7, 6, 'Sauver un humain', '2025-04-04 11:10:00', TRUE),
(8, 6, 'Sauver un humain', '2025-04-04 12:50:00', FALSE),
(9, 49, 'Sauver un humain', '2025-04-05 17:40:00', TRUE),
(10, 49, 'Sauver un humain', '2025-04-05 19:00:00', TRUE),

-- Cycle G: variantes action/robot
(11, 1, 'Patrouiller le périmètre', '2025-03-01 06:45:00', TRUE),
(12, 2, 'Surveiller les capteurs', '2025-03-01 10:15:00', TRUE),
(13, 13, 'Analyser des données', '2025-03-02 18:20:00', TRUE),
(14, 17, 'Réparer les systèmes', '2025-03-02 19:35:00', FALSE),
(15, 21, 'Transporter des ressources', '2025-03-03 23:55:00', TRUE),
(16, 26, 'Sauver un humain', '2025-03-04 09:20:00', TRUE),
(17, 31, 'Analyser des données', '2025-03-04 19:15:00', TRUE),
(18, 35, 'Sauver un humain', '2025-03-05 02:05:00', TRUE),
(19, 39, 'Analyser des données', '2025-03-05 12:40:00', TRUE),
(20, 45, 'Surveiller les capteurs', '2025-03-06 07:30:00', TRUE),

-- Lot H: renfort sauvetage pour densifier "Sauver un humain"
(1, 6, 'Sauver un humain', '2025-02-01 11:05:00', TRUE),
(2, 6, 'Sauver un humain', '2025-02-01 12:25:00', TRUE),
(3, 6, 'Sauver un humain', '2025-02-01 13:05:00', FALSE),
(4, 49, 'Sauver un humain', '2025-02-02 17:20:00', TRUE),
(5, 49, 'Sauver un humain', '2025-02-02 18:45:00', TRUE),
(6, 49, 'Sauver un humain', '2025-02-02 19:30:00', TRUE),

-- Lot I: clôture avec répartitions supplémentaires
(7, 1, 'Surveiller les capteurs', '2025-12-20 06:55:00', TRUE),
(8, 2, 'Patrouiller le périmètre', '2025-12-20 08:30:00', TRUE),
(9, 6, 'Sauver un humain', '2025-12-20 11:45:00', TRUE),
(10, 13, 'Analyser des données', '2025-12-20 18:30:00', TRUE),
(11, 17, 'Réparer les systèmes', '2025-12-20 19:40:00', FALSE),
(12, 21, 'Transporter des ressources', '2025-12-21 23:20:00', TRUE),
(13, 26, 'Surveiller les capteurs', '2025-12-21 08:35:00', TRUE),
(14, 31, 'Sauver un humain', '2025-12-21 18:20:00', TRUE),
(15, 35, 'Analyser des données', '2025-12-22 00:50:00', TRUE),
(16, 39, 'Analyser des données', '2025-12-22 12:35:00', TRUE),
(17, 45, 'Surveiller les capteurs', '2025-12-23 07:10:00', TRUE),
(18, 49, 'Sauver un humain', '2025-12-23 18:15:00', TRUE),

-- Derniers compléments pour totaliser 200
(19, 6, 'Sauver un humain', '2025-10-02 11:20:00', TRUE),
(20, 6, 'Analyser des données', '2025-10-02 12:05:00', TRUE),
(1, 49, 'Sauver un humain', '2025-10-02 18:10:00', FALSE),
(2, 49, 'Sauver un humain', '2025-10-02 19:25:00', TRUE),
(3, 13, 'Analyser des données', '2025-10-03 18:35:00', TRUE),
(4, 17, 'Réparer les systèmes', '2025-10-03 19:40:00', TRUE),
(5, 21, 'Transporter des ressources', '2025-10-04 22:45:00', TRUE),
(6, 26, 'Surveiller les capteurs', '2025-10-04 08:55:00', TRUE),
(7, 31, 'Analyser des données', '2025-10-04 19:10:00', FALSE),
(8, 35, 'Sauver un humain', '2025-10-05 00:40:00', TRUE),
(9, 39, 'Analyser des données', '2025-10-05 11:50:00', TRUE),
(10, 45, 'Surveiller les capteurs', '2025-10-06 07:35:00', TRUE),
(11, 1, 'Patrouiller le périmètre', '2025-10-06 09:10:00', TRUE),
(12, 2, 'Surveiller les capteurs', '2025-10-07 06:45:00', TRUE),
(13, 6, 'Sauver un humain', '2025-10-07 12:40:00', TRUE),
(14, 13, 'Analyser des données', '2025-10-08 18:20:00', TRUE),
(15, 17, 'Réparer les systèmes', '2025-10-08 19:55:00', FALSE),
(16, 21, 'Transporter des ressources', '2025-10-09 23:30:00', TRUE),
(17, 26, 'Surveiller les capteurs', '2025-10-09 10:20:00', TRUE),
(18, 31, 'Sauver un humain', '2025-10-10 17:50:00', TRUE),
(19, 35, 'Analyser des données', '2025-10-10 02:30:00', TRUE),
(20, 39, 'Analyser des données', '2025-10-11 11:35:00', TRUE);


INSERT INTO action_humain (id_humain, id_action) VALUES
-- Scénario critique 1 (Mars)
(3, 1),
(5, 1),
(7, 2),
(11, 3),

-- Scénario critique 6 (Station Vega)
(15, 6),
(19, 6),
(11, 7),

-- Sauvetage médical critique (Mars)
(3, 10),
(7, 10),
(15, 10),

-- Titan – scénario critique de nuit
(23, 11),
(27, 11),

-- Europa – surveillance environnementale
(5, 27),
(17, 27),

-- Mars – surveillance environnementale
(3, 28),
(31, 28),

-- Titan – environnement
(27, 29),
(35, 29),

-- Proxima b – nuit
(9, 30),
(23, 30),

-- Station Vega – environnement
(15, 31),
(19, 31),

-- Cas multi-humains sur une même action (analyse riche)
(3, 135),
(7, 135),
(15, 135),

(11, 138),
(19, 138);
