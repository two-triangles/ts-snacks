import { PrismaClient } from "@prisma/client"

const prisma = new PrismaClient()

export const buildMachine = async (location: string) => {
  const createdMachine = await prisma.vendingMachine.create({
    data: { location: location },
    select: {
      machine_id: true,
      location: true,
      created_at: true,
      last_updated_at: true,
    },
  })
  return createdMachine
}
