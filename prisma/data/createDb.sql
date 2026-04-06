BEGIN;

-- Création de la table "coran"
CREATE TABLE "tag" (
    "id" SERIAL PRIMARY KEY,
    "nom" TEXT
);

CREATE TABLE "coran" (

                         "id" SERIAL PRIMARY KEY,
                         "sujet" VARCHAR(255),
                         "sourate" VARCHAR(255) ,
                         "text_arabe" TEXT ,
                         "texte_francais" TEXT ,
                         "type_id" INTEGER ,
                         "phonétique" TEXT ,
                         "explication" TEXT,
    "tag" TEXT

);


-- Création de la table "parole"
CREATE TABLE "parole" (
                          "id" SERIAL PRIMARY KEY,
                        "sujet" TEXT,
                        "savant" TEXT,
                         "texte_arabe" TEXT ,
                          "texte_francais" TEXT ,
                          "phonétique" TEXT ,
                          "explication" TEXT ,
                          "tag" TEXT

);

-- Création de la table "hadith"
CREATE TABLE "hadith" (
                          "id" SERIAL PRIMARY KEY,
                          "sujet" VARCHAR(255) ,
                          "rapporteur" VARCHAR(255) ,
                          "narrateur" VARCHAR(255) ,
                          "statut" VARCHAR(255) ,
                          "texte_arabe" TEXT ,
                          "texte_francais" TEXT ,
                          "phonétique" TEXT ,
                          "explication" TEXT ,
                          "tag" TEXT

);

-- Création de la table "biographie"
CREATE TABLE "biographie" (
                              "id" SERIAL PRIMARY KEY,
                              "nom" VARCHAR(255) ,
                              "status" VARCHAR(255) ,
                              "texte" TEXT,
                          "tag" TEXT
);

-- Création de la table "dhikr"
CREATE TABLE "dhikr" (
                              "id" SERIAL PRIMARY KEY,
                              "sujet" VARCHAR(255) ,
                              "texte_arabe" TEXT ,
                              "texte_francais" TEXT ,
                              "phonétique" TEXT ,
                              "explication" TEXT ,
                              "tag" TEXT,
                              "commentaire" TEXT

);

-- Création de la table "douaa"
CREATE TABLE "douaa" (
                         "id" SERIAL PRIMARY KEY,
                         "sujet" VARCHAR(255) ,
                         "texte_arabe" TEXT ,
                         "texte_francais" TEXT ,
                         "phonétique" TEXT ,
                         "explication" TEXT ,
                         "tag" TEXT,
                         "commentaire" TEXT

);

COMMIT;