BEGIN;



-- Réinitialiser les identifiants des tables


TRUNCATE TABLE "type" RESTART IDENTITY CASCADE;





-- Insérer des types
INSERT INTO "type" ("nom")
VALUES
    ('hadith'),
    ('coran'),
    ('douaa'),
    ('dhikr'),
    ('akida');

-- Insérer des croyances


COMMIT;
