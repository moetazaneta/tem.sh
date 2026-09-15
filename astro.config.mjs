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
      target: (id) => {
        console.debug(`Detecting ${id}`);
        return "html";
        // if (id.endsWith(".html.typ") || id.includes("/html/")) return "html";
        // return "svg";
      },
      // === Use html-text output rather than hAST ===
      // htmlMode: "hast", // added in v0.12.3
      // === <img src="xxx.svg"> instead of inlined <svg> ===
      // emitSvg: true,
      // emitSvgDir: ".astro/typst"
      // === Add non-system fonts here ===
      // fontArgs: [
      //   { fontPaths: ['/system/fonts', '/user/fonts'] },
      //   { fontBlobs: [customFontBuffer] }
      // ],
    }),
  ],
});
