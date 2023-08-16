import { appRouter } from '../../../trpc-server/routers/_app';

describe('app.hello', () => {
  test("returns a 'hello world' greeting", async () => {
    const caller = appRouter.createCaller({});
    const greeting = await caller.hello({ name: 'bob' });
    expect(greeting).toEqual({ greeting: 'hello bob' });
  });
});

describe('snacksRouter.list', () => {
  test('returns an array', async () => {
    const caller = appRouter.createCaller({});
    const list = await caller.snacks.list({})
    expect(Array.isArray(list)).toBeTruthy()
  });
});
