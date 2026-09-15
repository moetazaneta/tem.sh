# tem.sh

Personal homepage and CV built with Astro, Tailwind CSS, SolidJS, and Typst.

## Pages

- `src/pages/index.astro`: homepage at `/`.
- `src/pages/cv.astro`: CV at `/cv`, rendered from `src/assets/cv.typ` and `src/assets/theme.typ`.

## Development

Requires Node.js 22.12 or newer and pnpm.

```sh
pnpm install
pnpm astro dev --background
```

Manage the background server with `pnpm astro dev status`, `pnpm astro dev logs`, and `pnpm astro dev stop`.

```sh
pnpm build
pnpm preview
```

The production build is written to `dist/`.
