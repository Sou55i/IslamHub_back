BEGIN;

TRUNCATE TABLE "parole" RESTART IDENTITY CASCADE;

-- Insérer des paroles
INSERT INTO "parole" (
    "texte_arabe",
    "texte_francais",
    "phonetique",
    "explication",
    "type_id"
)
VALUES
    (
        'الله الله ربّي لا أُشركُ به شيئًا',
        'Allāh, Allāh est mon Seigneur, je ne lui associe rien.',
        'Allāhou Allāhou rabbī lā `ouchrikou bihī chay`â',
        'Évocation à faire matin et soir.',
        NULL
    ),
    (
        'لا إله إلا الله محمد رسول الله',
        'Il n’y a de dieu qu’Allah et Muhammad est son messager.',
        'Lā ilāha illā Allāhou Muhammadou rasoulou Allāh',
        'La base de la croyance islamique.',
        NULL
    );
COMMIT;