# Carga CV versions

Three layouts based on `../cv.typ` and the CARGA shipping manifest design brief.

- `manifest.typ`: two-page CV with numbered sections and full project details.
- `portfolio.typ`: two-page CV with a profile and skills sidebar, followed by project details.
- `compact.typ`: one-page CV with selected achievements.

PDFs are in `public/cv-versions/`. Shared copy is in `data.json`; typography, colors, and layout helpers are in `design.typ`. These are independent versions, so future edits to the original CV do not automatically update them.

The brief's cream, brown, pale green, square borders, Barlow Condensed, and IBM Plex Mono are used for print. Screen shadows, animation, and contradictory pill-radius guidance are omitted.

The source's employers, dates, contact details, degree wording, and reported metrics are retained. Wording is shortened. The compact version intentionally omits some details. No new achievements or job titles were inferred.

Build all PDFs from the repository root with Typst installed:

```sh
node src/assets/cv-versions/build.mjs
```

Fonts and their open font licenses are included in `fonts/`.
