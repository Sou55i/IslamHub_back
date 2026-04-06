BEGIN;

TRUNCATE TABLE "croyance" RESTART IDENTITY CASCADE;

INSERT INTO "croyance" (
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
        'Attributs de Allah',
        'اللهُ مَوْجُودٌ بِلاَ كَيْفٍ وَلاَ مَكَان',
        'Dieu existe sans endroit et sans comment.',
        5,
        'Sujet sur l’unicité',
        'Allahu Mawjoudoun Bila Kayfin Wa La Makan',
        'Dieu est unique et transcende le temps et l’espace.',
        'audio_1.mp3'
    ),
    (
        'Attributs de Allah',
        ' لَوْ كَانَ فِيهِمَا آلِهَةٌ إِلَّا اللَّـهُ لَفَسَدَتَا ۚ',
        'Unicité de Dieu',
        5,
        'Sujet sur le tawhid',
        'Law kāna fīhimā ''ālihatoun ''il-la l-Lāhou lafaçadatā',
        'ce qui signifie: « S''il y avait [pour le ciel et la terre] des dieux hormis Allāh, [les cieux et les terres] seraient certes en discordance » [soūrat al-''Anbiyā'' / ''āyah 22].',
        'audio_2.mp3'
    );

COMMIT ;