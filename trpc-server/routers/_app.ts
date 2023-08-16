import { z } from 'zod';
import { procedure, router } from '../trpc';

import { SnacksRouter, snacksRouter } from './snacks_router';

export const appRouter = router({
  hello: procedure
    .input(
      z.object({
        name: z.string(),
      })
    )
    .output(z.object({ greeting: z.string() }))
    .query((opts) => {
      return {
        greeting: `hello ${opts.input.name}`,
      };
    }),
    snacks: snacksRouter
});

// export type definition of API
export type AppRouter = typeof appRouter;
