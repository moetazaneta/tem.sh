// @ts-check
import { defineConfig } from "astro/config";
import tailwindcss from "@tailwindcss/vite";
import solid from "@astrojs/solid-js";
import { typst } from "astro-typst";

// https://astro.build/config
export default defineConfig({
  vite: {
    plugins: [tailwindcss()],
  },
  integrations: [
    solid(),
    typst({
      options: {
        remPx: 14,
      },
      target: () => "html",
    }),
  ],
});
