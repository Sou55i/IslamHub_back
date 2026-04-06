BEGIN;
-- Réinitialiser les tables et les identifiants
TRUNCATE TABLE "croyance" RESTART IDENTITY CASCADE; --
TRUNCATE TABLE "parole" RESTART IDENTITY CASCADE; --
TRUNCATE TABLE "type" RESTART IDENTITY CASCADE; --
TRUNCATE TABLE "hadith" RESTART IDENTITY CASCADE; --
TRUNCATE TABLE "biographie" RESTART IDENTITY CASCADE;
TRUNCATE TABLE "invocation" RESTART IDENTITY CASCADE;
TRUNCATE TABLE "douaa" RESTART IDENTITY CASCADE;



-- Insérer des types
INSERT INTO "type" ("id", "nom")
VALUES
    (DEFAULT, 'hadith'),
    (DEFAULT, 'coran'),
    (DEFAULT, 'douaa'),
    (DEFAULT, 'dhikr'),
    (DEFAULT, 'akida');
-- Insérer des croyances
INSERT INTO "croyance" (
    "id",
    "nom",
    "arabe",
    "francais",
    "type_id",
    "sujet",
    "phonetique",
    "explication",
    "audio"
)
VALUES
    (
        DEFAULT,
        'Croyance 1',
        'اللهُ مَوْجُودٌ بِلاَ كَيْفٍ وَلاَ مَكَان',
        'Dieu existe sans endroit et sans comment.',
        5,
        'Sujet sur l’unicité',
        'Allahu Mawjoudoun Bila Kayfin Wa La Makan',
        'Dieu est unique et transcende le temps et l’espace.'
    ),
    (
        DEFAULT,
        'Croyance 2',
        'توحيد الله',
        'Unicité de Dieu',
        5,
        'Sujet sur le tawhid',
        'Tawhidu Allahi',
        'Explication approfondie sur le tawhid (unicité).'
    );
-- Insérer des paroles
INSERT INTO "parole" (
    "id",
    "texte_arabe",
    "texte_francais",
    "phonetique",
    "explication",
    "type_id"
)
VALUES
    (
        DEFAULT,
        'الله الله ربّي لا أُشركُ به شيئًا',
        'Allāh, Allāh est mon Seigneur, je ne lui associe rien.',
        'Allāhou Allāhou rabbī lā `ouchrikou bihī chay`â',
        'Évocation à faire matin et soir.',
        ''
    ),
    (
        DEFAULT,
        'لا إله إلا الله محمد رسول الله',
        'Il n’y a de dieu qu’Allah et Muhammad est son messager.',
        'Lā ilāha illā Allāhou Muhammadou rasoulou Allāh',
        'La base de la croyance islamique.',
        ''
    );

INSERT INTO "hadith" (
    "id",
    "sujet",
    "raporteur",
    "narrateur",
    "statut",
    "texte_arabe",
    "texte_francais",
    "phonetique",
    "explication",
    "type_id"
),
    VALUES
        (

        );
INSERT INTO "biographie" (
    "id",
    "nom",
    "status",
    "texte"

)
    VALUES (
             DEFAULT,
             'Muhammad',
            'prophète',
             ''

           );
INSERT INTO "invocation" (
    "id",
    "sujet",
    "texte_arabe",
    "texte_francais",
    "phonetique",
    "explication",
    "type_id",
    "commentaire"
)
    VALUES
        (
         DEFAULT,
         '',
        'texte',
        'texte',
         'phon',
         '',
         '',
         'com'


        );

INSERT INTO "douaa" (
    "id",
    "sujet",
    "texte_arabe",
    "texte_francais",
    "phonetique",
    "explication",
    "type_id",
    "commentaire"
)
VALUES
    (
     DEFAULT,
    '',
     'texte',
     'texte',
    'phon',
    '',
    '',
    'com'


    );

COMMIT;