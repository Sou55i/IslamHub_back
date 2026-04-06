BEGIN;

TRUNCATE TABLE "douaa" RESTART IDENTITY CASCADE;




-- Insérer des douaa
INSERT INTO "douaa" (
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
        'Invocation à dire lorsque le vent souffle ',
        'اللَّهُمَّ إِنِّي أسْألُكَ خَيْرَهَا وخَيْرَ مَا فِيْهَا وَخَيْرَ مَا أُرْسِلَتْ بِهِ وأعُوذُ بِكَ مِنْ شَرِّهَا وَشَرِّ مَا فِيْهَا وَشَرِّ مَا أُرْسِلَتْ بِهِِ',
        'Ô mon Dieu, je Te demande son bien, le bien qu’il contient et le bien avec lequel il a été envoyé, et je cherche refuge auprès de Toi contre son mal, le mal qu’il contient et le mal avec lequel il a été envoyé.',
        '',
        '',
        3,
        ''
    );

COMMIT;