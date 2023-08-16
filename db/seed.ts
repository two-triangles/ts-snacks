import client from "./client"
import { categories } from "./data/categories"

import { snacks } from "./data/snacks"
import { vendingMachines } from "./data/vendingMachines"
import { formatVendingMachineData } from "./utils/utils"

export const seed = async () => {
  await client.snack.deleteMany()
  await client.category.deleteMany()
  await client.vendingMachine.deleteMany()

  await client.category.createMany({ data: categories })
  await client.snack.createMany({ data: snacks })

  const formattedMachineData = formatVendingMachineData(vendingMachines)

  await client.vendingMachine.createMany({ data: formattedMachineData })

  console.log(formattedMachineData)
  const insertedMachines = await client.vendingMachine.findMany()

  const insertedSnacks = await client.snack.findMany()

  console.log(insertedMachines)
  console.log("all seeded a ok")
}

seed()


// reference object for vending machines and their machine ids 

// reference object for snacks and snack_id 

// use vending machine reference obj and snack obj to insert the snacks into stock table