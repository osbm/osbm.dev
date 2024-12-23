import { defineCollection, z } from 'astro:content';

const blog = defineCollection({
	type: 'content',
	// Type-check frontmatter using a schema
	schema: z.object({
		title: z.string(),
		description: z.string(),
		// Transform string to Date object
		pubDate: z.coerce.date(),
		updatedDate: z.coerce.date().optional(),
		filename: z.string().optional(),
		heroImage: z.string().optional(),
		includes_p5js: z.boolean().optional(),
		p5_script_path: z.string().optional(),
	}),
});

export const collections = { blog };
