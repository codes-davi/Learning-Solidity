const HelloWorld = artifacts.require("HelloWorld");
const Primitives = artifacts.require("Primitives");

contract('HelloWorld', () => {
  beforeEach(async ()=>{
    contract = await HelloWorld.new();
  });
  it.skip('Should return Hello World', async ()=>{
    let res = await contract.greet();
    assert(res === "Hello World");
  });
});

contract('Primitives', () => {
  beforeEach(async ()=>{
    contract = await Primitives.new();
  });
  it.skip('Should return max integer', async ()=>{
    let res = await contract.maxInt();
    console.log(typeof res)
    assert(res);
  });
  it.skip('Should return min integer', async ()=>{
    let res = await contract.minInt();
    console.log(res);
    assert(res)
  });
});