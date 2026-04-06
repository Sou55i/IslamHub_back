BEGIN;

TRUNCATE TABLE "biographie" RESTART IDENTITY CASCADE;



-- Insérer des biographies
INSERT INTO "biographie" (
    "nom",
    "status",
    "texte"
)
VALUES
    (
        'Muhammad',
        'prophète',
        'Le prophète Muhammad est le dernier messager.'
    );

COMMIT;