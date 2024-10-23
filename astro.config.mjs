import { defineConfig } from 'astro/config';

// https://astro.build/config
export default defineConfig({
    site: 'https://osbm.dev',
    trailingSlash: 'never',
    output: 'static',
});
