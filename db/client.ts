import { PrismaClient } from "@prisma/client"

const buildClient = () => {
  const { DB_ENDPOINT, DB_USERNAME, DB_PORT, DB_NAME, DB_PASSWORD } =
    process.env
  const url = process.env.DATABASE_URL
  const prisma = new PrismaClient({ datasources: { db: { url } } })
  return prisma
}

const client = buildClient()

export default client

export type PrismaTransaction = Omit<
  PrismaClient<
    {
      datasources: {
        db: {
          url: string
        }
      }
    },
    never,
    false
  >,
  "$connect" | "$disconnect" | "$on" | "$transaction" | "$use"
>
