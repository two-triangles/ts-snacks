import { z } from 'zod';
import { procedure, router } from '../trpc';

export const snacksRouter = router({
  list: procedure.input(z.object({})).query((opts) => {
    return []
  })
});

// export type definition of API
export type SnacksRouter = typeof snacksRouter;