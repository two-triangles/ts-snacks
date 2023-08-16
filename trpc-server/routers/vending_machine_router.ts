import { z } from "zod"
import { procedure, router } from "../trpc"
import { buildMachine } from "../../models/vending-machine-models"

export const vendingMachineRouter = router({
  createMachine: procedure
    .input(
      z.object({
        location: z.string(),
      })
    )
    .output(
      z.object({
        machine_id: z.string(),
        location: z.string(),
        created_at: z.date(),
        last_updated_at: z.date()
      })
    )
    .mutation(async (opts) => {
      const {
        input: { location },
      } = opts
      const newMachine = await buildMachine(location)
      return newMachine
    }),
})

// export type definition of API
export type VendingMachineRouter = typeof vendingMachineRouter
