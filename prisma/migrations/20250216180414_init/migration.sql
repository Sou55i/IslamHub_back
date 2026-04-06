-- CreateTable
CREATE TABLE "biographie" (
    "id" SERIAL NOT NULL,
    "nom" VARCHAR(255) NOT NULL,
    "status" VARCHAR(255) NOT NULL,
    "texte" TEXT NOT NULL,

    CONSTRAINT "biographie_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "croyance" (
    "id" SERIAL NOT NULL,
    "nom" VARCHAR(255) NOT NULL,
    "arabe" TEXT NOT NULL,
    "francais" TEXT NOT NULL,
    "type_id" INTEGER NOT NULL,
    "sujet" TEXT NOT NULL,
    "phonetique" TEXT NOT NULL,
    "explication" TEXT NOT NULL,
    "audio" TEXT NOT NULL,

    CONSTRAINT "croyance_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "douaa" (
    "id" SERIAL NOT NULL,
    "sujet" VARCHAR(255) NOT NULL,
    "texte_arabe" TEXT NOT NULL,
    "texte_francais" TEXT NOT NULL,
    "phonetique" TEXT NOT NULL,
    "explication" TEXT NOT NULL,
    "type_id" INTEGER,
    "commentaire" TEXT NOT NULL,

    CONSTRAINT "douaa_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "hadith" (
    "id" SERIAL NOT NULL,
    "sujet" VARCHAR(255) NOT NULL,
    "raporteur" VARCHAR(255) NOT NULL,
    "narrateur" VARCHAR(255) NOT NULL,
    "statut" VARCHAR(255) NOT NULL,
    "texte_arabe" TEXT NOT NULL,
    "texte_francais" TEXT NOT NULL,
    "phonetique" TEXT NOT NULL,
    "explication" TEXT NOT NULL,
    "type_id" INTEGER NOT NULL,

    CONSTRAINT "hadith_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "invocation" (
    "id" SERIAL NOT NULL,
    "sujet" VARCHAR(255) NOT NULL,
    "texte_arabe" TEXT NOT NULL,
    "texte_francais" TEXT NOT NULL,
    "phonetique" TEXT NOT NULL,
    "explication" TEXT NOT NULL,
    "type_id" INTEGER,
    "commentaire" TEXT NOT NULL,

    CONSTRAINT "invocation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "parole" (
    "id" SERIAL NOT NULL,
    "texte_arabe" TEXT NOT NULL,
    "texte_francais" TEXT NOT NULL,
    "phonetique" TEXT NOT NULL,
    "explication" TEXT NOT NULL,
    "type_id" INTEGER,

    CONSTRAINT "parole_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "type" (
    "id" SERIAL NOT NULL,
    "nom" VARCHAR(255) NOT NULL,

    CONSTRAINT "type_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "croyance" ADD CONSTRAINT "croyance_type_id_fkey" FOREIGN KEY ("type_id") REFERENCES "type"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "douaa" ADD CONSTRAINT "douaa_type_id_fkey" FOREIGN KEY ("type_id") REFERENCES "type"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "hadith" ADD CONSTRAINT "hadith_type_id_fkey" FOREIGN KEY ("type_id") REFERENCES "type"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "invocation" ADD CONSTRAINT "invocation_type_id_fkey" FOREIGN KEY ("type_id") REFERENCES "type"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "parole" ADD CONSTRAINT "parole_type_id_fkey" FOREIGN KEY ("type_id") REFERENCES "type"("id") ON DELETE SET NULL ON UPDATE NO ACTION;
