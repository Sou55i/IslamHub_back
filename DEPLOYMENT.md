# Déploiement — API IslamHub (Render + Supabase)

Ce guide déploie le **backend** (API Node.js + base PostgreSQL) gratuitement.
Le **front** peut ensuite être hébergé n'importe où (Netlify, Vercel, GitHub
Pages, Hostinger…) en le pointant vers l'URL de l'API.

---

## Partie A — Base de données sur Supabase

1. Crée un compte sur https://supabase.com → **New project**.
   - Note bien le **mot de passe** de la base (affiché une seule fois).
   - Région : **Central EU (Frankfurt)** pour coller à Render.
2. Attends que le projet soit prêt (~2 min).
3. Récupère la chaîne de connexion :
   **Project Settings → Database → Connection string → onglet `URI`**.
   - ⚠️ **Important** : choisis le **Session pooler** (compatible IPv4), pas la
     connexion directe — le plan gratuit de Render ne gère pas l'IPv6.
     La chaîne ressemble à :
     `postgresql://postgres.xxxx:MOT_DE_PASSE@aws-0-eu-central-1.pooler.supabase.com:5432/postgres`

### Importer tes données locales

Sur ta machine, exporte ta base locale puis importe-la dans Supabase :

```bash
# 1. Export (sans les infos de propriétaire/droits, pour éviter les erreurs)
pg_dump -U postgres -d islamhub --no-owner --no-privileges -f islamhub_dump.sql

# 2. Import dans Supabase (colle ta chaîne Session pooler)
psql "postgresql://postgres.xxxx:MOT_DE_PASSE@aws-0-eu-central-1.pooler.supabase.com:5432/postgres" -f islamhub_dump.sql
```

Si tu n'avais pas encore créé la table multimedia dans ta base locale, applique
aussi la migration : `scripts/003_create_multimedia.sql`.

---

## Partie B — API sur Render

1. Crée un compte sur https://render.com (connexion via GitHub).
2. **New → Blueprint** → sélectionne le repo `islamhub_back`.
   Render lit automatiquement `render.yaml`.
   - ⚠️ Vérifie que la branche `main` contient bien le code à jour
     (fusionne la branche de travail dans `main` avant, ou change `branch:`
     dans `render.yaml`).
3. Renseigne les variables d'environnement (marquées `sync: false`) :
   - `DATABASE_URL` → ta chaîne de connexion **Session pooler** Supabase
   - `ALLOWED_ORIGINS` → l'URL de ton front (ex : `https://mon-site.netlify.app`)
     Plusieurs origines possibles, séparées par des virgules **sans espace**.
4. **Create** → Render installe et démarre l'API.
5. Teste : ouvre `https://ton-api.onrender.com/health` → doit renvoyer
   `{"status":"ok"}`. Puis `https://ton-api.onrender.com/api/hadiths/tags`.

> 💤 Plan gratuit : l'API s'endort après 15 min d'inactivité. Le premier appel
> suivant prend ~30 s (cold start), puis c'est rapide. Pour supprimer ce délai,
> passe à un plan payant (~7$/mois) ou un VPS.

---

## Partie C — Rebrancher le front

Dans le repo `islamhub_front`, crée un fichier `.env.production` :

```env
VITE_API_URL=https://ton-api.onrender.com/api
```

Puis reconstruis et re-déploie :

```bash
npm run build
# puis upload le dossier dist/ chez ton hébergeur (ou push si Netlify/Vercel auto-deploy)
```

---

## Partie D — Vérifications finales (CORS)

Si le front affiche une erreur CORS dans la console du navigateur :
- Vérifie que l'URL exacte du front (avec `https://`, sans `/` final) est bien
  dans `ALLOWED_ORIGINS` sur Render.
- Après modification d'une variable sur Render, clique **Manual Deploy → Deploy
  latest commit** pour redémarrer avec la nouvelle valeur.

---

## Récapitulatif des variables d'environnement

| Variable          | Où              | Exemple |
|-------------------|-----------------|---------|
| `DATABASE_URL`    | Render          | `postgresql://postgres.xxx:pwd@aws-0-eu-central-1.pooler.supabase.com:5432/postgres` |
| `ALLOWED_ORIGINS` | Render          | `https://mon-site.netlify.app` |
| `NODE_ENV`        | Render          | `production` (déjà dans render.yaml) |
| `VITE_API_URL`    | Front (build)   | `https://ton-api.onrender.com/api` |
