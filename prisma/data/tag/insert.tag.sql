BEGIN;

TRUNCATE TABLE "tag" RESTART IDENTITY CASCADE;

INSERT INTO "tag" (nom)
VALUES ('vent'),
('croyance'),
('taawil'),
('tawhid'),
('protection'),
('tahsin'),
('révélation'),
('intention'),
('actes'),
('exemption'),
('enfer'),
('parole'),
('attributs'),
('mécréance'),
('apostasie'),
('méditation'),
('chatîment'),
('tombe'),
('science'),
('apprentissage'),
('intention'),
('comportement'),
('purification'),
('ablutions'),
('repentir'),
('oeuvres'),
('foi'),
('propĥètes'),
('comportement'),
('pêchés'),
('obeissance'),
('révélation'),
('mawlid'),
('bonne croyance');


COMMIT;





