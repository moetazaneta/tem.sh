import { fileURLToPath } from 'node:url';
import { resolve } from 'node:path';
import { mkdirSync } from 'node:fs';
import { execFileSync } from 'node:child_process';
const here = fileURLToPath(new URL('.', import.meta.url));
const root = resolve(here, '../../..');
const output = resolve(root, 'public/cv-versions');
mkdirSync(output, { recursive: true });
for (const name of ['manifest', 'portfolio', 'compact']) {
  execFileSync('typst', ['compile', '--ignore-system-fonts', '--root', root, '--font-path', resolve(here, 'fonts'),
    resolve(here, `${name}.typ`), resolve(output, `artem-sotnichenko-${name}.pdf`)], { stdio: 'inherit' });
  console.log(`Built ${name}`);
}
