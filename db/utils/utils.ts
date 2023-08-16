const createStockRefObj = () => {}

type machineData = {
  location: string
  lastStockedAt: Date
  snacks: string[]
}

export const formatVendingMachineData = (machineData: machineData[]) => {
  return machineData.map((machine) => {
    const { location, lastStockedAt } = machine
    return { location: machine.location, last_updated_at: lastStockedAt }
  })
}
