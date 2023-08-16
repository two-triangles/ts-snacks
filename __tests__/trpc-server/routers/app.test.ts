import { appRouter } from "../../../trpc-server/routers/_app"
import { seed } from "../../../db/seed"

beforeEach(() => {
  
})

describe("app.hello", () => {
  test("returns a 'hello world' greeting", async () => {
    const caller = appRouter.createCaller({})
    const greeting = await caller.hello({ name: "bob" })
    expect(greeting).toEqual({ greeting: "hello bob" })
  })
})

describe("snacksRouter.list", () => {
  test("returns an array", async () => {
    const caller = appRouter.createCaller({})
    const list = await caller.snacks.list({})
    expect(Array.isArray(list)).toBeTruthy()
  })
})

describe("vendingMachineRouter.createMachine", () => {
  test("returns an array", async () => {
    const caller = appRouter.createCaller({})
    const createdMachine = await caller.vendingMachine.createMachine({
      location: "Carlisle",
    })
    console.log(createdMachine)
    expect(createdMachine).toHaveProperty("machine_id")
    expect(createdMachine).toHaveProperty("location")
    expect(createdMachine).toHaveProperty("created_at")
    expect(createdMachine).toHaveProperty("last_updated_at")
  })
})
