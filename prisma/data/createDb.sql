BEGIN;

-- Création de la table "type"
CREATE TABLE "type" (
                        "id" SERIAL PRIMARY KEY,
                        "nom" VARCHAR(255) NOT NULL
);

-- Création de la table "croyance"
CREATE TABLE "croyance" (
                            "id" SERIAL PRIMARY KEY,
                            "nom" VARCHAR(255) NOT NULL,
                            "arabe" TEXT NOT NULL,
                            "francais" TEXT NOT NULL,
                            "type_id" INTEGER NOT NULL,
                            "sujet" TEXT NOT NULL,
                            "phonetique" TEXT NOT NULL,
                            "explication" TEXT NOT NULL,
                            "audio" TEXT NOT NULL,
                            FOREIGN KEY ("type_id") REFERENCES "type"("id") ON DELETE CASCADE
);

-- Création de la table "parole"
CREATE TABLE "parole" (
                          "id" SERIAL PRIMARY KEY,
                          "texte_arabe" TEXT NOT NULL,
                          "texte_francais" TEXT NOT NULL,
                          "phonetique" TEXT NOT NULL,
                          "explication" TEXT NOT NULL,
                          "type_id" INTEGER,
                          FOREIGN KEY ("type_id") REFERENCES "type"("id") ON DELETE SET NULL
);

-- Création de la table "hadith"
CREATE TABLE "hadith" (
                          "id" SERIAL PRIMARY KEY,
                          "sujet" VARCHAR(255) NOT NULL,
                          "raporteur" VARCHAR(255) NOT NULL,
                          "narrateur" VARCHAR(255) NOT NULL,
                          "statut" VARCHAR(255) NOT NULL,
                          "texte_arabe" TEXT NOT NULL,
                          "texte_francais" TEXT NOT NULL,
                          "phonetique" TEXT NOT NULL,
                          "explication" TEXT NOT NULL,
                          "type_id" INTEGER NOT NULL,
                          FOREIGN KEY ("type_id") REFERENCES "type"("id") ON DELETE CASCADE
);

-- Création de la table "biographie"
CREATE TABLE "biographie" (
                              "id" SERIAL PRIMARY KEY,
                              "nom" VARCHAR(255) NOT NULL,
                              "status" VARCHAR(255) NOT NULL,
                              "texte" TEXT NOT NULL
);

-- Création de la table "dhikr"
CREATE TABLE "invocation" (
                              "id" SERIAL PRIMARY KEY,
                              "sujet" VARCHAR(255) NOT NULL,
                              "texte_arabe" TEXT NOT NULL,
                              "texte_francais" TEXT NOT NULL,
                              "phonetique" TEXT NOT NULL,
                              "explication" TEXT NOT NULL,
                              "type_id" INTEGER,
                              "commentaire" TEXT NOT NULL,
                              FOREIGN KEY ("type_id") REFERENCES "type"("id") ON DELETE SET NULL
);

-- Création de la table "douaa"
CREATE TABLE "douaa" (
                         "id" SERIAL PRIMARY KEY,
                         "sujet" VARCHAR(255) NOT NULL,
                         "texte_arabe" TEXT NOT NULL,
                         "texte_francais" TEXT NOT NULL,
                         "phonetique" TEXT NOT NULL,
                         "explication" TEXT NOT NULL,
                         "type_id" INTEGER,
                         "commentaire" TEXT NOT NULL,
                         FOREIGN KEY ("type_id") REFERENCES "type"("id") ON DELETE SET NULL
);

COMMIT;