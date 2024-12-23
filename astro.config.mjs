import { defineConfig } from 'astro/config';
import rehypeMathjax from 'rehype-mathjax';
import remarkMath from 'remark-math';
import mdx from '@astrojs/mdx';
import sitemap from '@astrojs/sitemap';

// https://astro.build/config
export default defineConfig({
    site: 'https://osbm.dev',
    trailingSlash: 'never',
    output: 'static',
    // i18n: {
    //     defaultLocale: "en",
    //     locales: ["en", "tr", "ja"],
    // },
    integrations: [
        mdx(
            {
                remarkPlugins: [remarkMath],
                // rehypePlugins: [rehypeKatex],
                rehypePlugins: [rehypeMathjax],
            }
        ),
        sitemap(),
    ],
    markdown: {
        shikiConfig:{
            theme:'catppuccin-macchiato',
        },
    }
});
