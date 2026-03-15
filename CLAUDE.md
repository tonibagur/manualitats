# Manualitats — Recursos de manualitats

## Descripció

Col·lecció de recursos de manualitats (tutorials, canals YouTube, botigues) organitzats per categories, amb un visualitzador web per navegar-los. El projecte és per una nena i el seu pare.

## Estructura

- `index.html` — Visualitzador web (HTML + vanilla JS + marked.js via CDN). Fitxer únic, sense build.
- `serve.sh` — Arrenca servidor local (`python3 -m http.server 8080`) i obre el navegador.
- `perfil.md` — Perfil creatiu amb preferències i puntuacions destacades.
- `topics.md` — Taxonomia completa amb checkboxes i puntuacions (1-5) per cada tema.
- `XX_categoria.md` — 15 fitxers de recursos per categoria (només temes amb puntuació >= 3).

## Convencions

- Idioma del projecte: **català**. Codi, comentaris i commits en català.
- Els fitxers `.md` segueixen el format: títol H1, separadors `---`, seccions H2 per tema amb puntuació, llistes de recursos amb links.
- L'`index.html` carrega els `.md` via `fetch()` i els renderitza amb `marked.parse()`. No hi ha framework ni bundler.
- Els links externs sempre s'obren en pestanya nova (`target="_blank"`).

## Desenvolupament

```bash
./serve.sh          # Serveix a http://localhost:8080
```

## Com ampliar o refinar el contingut

### Actualitzar puntuacions a topics.md

Si la nena canvia d'opinió sobre algun tema, editar directament la puntuació a `topics.md`:
```
- [X] 1.5 Scrapbooking — _puntuació:3_   ← canviar el número
```
Les categories de recursos (`XX_categoria.md`) només inclouen temes amb puntuació >= 3.
Si un tema puja a 3+, cal afegir-lo al fitxer de la seva categoria. Si baixa de 3, es pot eliminar.

### Afegir temes nous a topics.md

Prompt per Claude:
> Llegeix topics.md i afegeix [descripció dels temes nous] a la categoria corresponent,
> seguint el format existent (checkbox, numeració, puntuació).

### Regenerar el perfil creatiu

Prompt per Claude:
> Llegeix topics.md i regenera perfil.md amb un resum de les preferències.
> Agrupa els temes per puntuació (5, 4, 3) i destaca patrons i interessos.

### Aprofundir en una categoria existent

Prompt per Claude:
> Llegeix [XX_categoria.md] i busca més recursos per als temes que ja hi són.
> Afegeix tutorials de YouTube, blogs i botigues online.
> Prioritza contingut en castellà/català, i contingut recent.
> Segueix el format existent: secció H2 per tema, subseccions per tipus de recurs
> (YouTube, Blogs i webs, Botigues), cada link amb descripció curta en català.

Per a una cerca més específica:
> Busca recursos de [nom del tema concret] per a una nena de [edat] anys.
> Vull tutorials pas a pas, preferiblement en vídeo, nivell principiant.

### Crear una categoria nova

Si es parteix una categoria o se'n crea una de nova:

1. Afegir els temes a `topics.md` amb puntuacions
2. Prompt per Claude:
   > Crea un fitxer [XX_nom.md] amb recursos pels temes de la categoria [nom]
   > que tenen puntuació >= 3 a topics.md. Segueix el format dels altres fitxers
   > de categoria (mira 03_joieria_bisuteria.md com a exemple).
3. Afegir el fitxer a l'array `FILES` dins `index.html`

### Notes

- El format dels recursos és: `[Títol del recurs](URL) — Descripció curta en català`
- Cada tema té seccions: YouTube, Blogs i webs, Botigues (segons disponibilitat)
- Els fitxers de categoria comencen amb `# XX - Nom — Recursos` i usen `---` entre temes

## Decisions

- Vanilla JS sense dependències locals (només marked.js per CDN) per mantenir-ho simple.
- Tot en un sol `index.html` (CSS + JS inline) per facilitar el desplegament.
- Compatible amb GitHub Pages sense configuració addicional.
