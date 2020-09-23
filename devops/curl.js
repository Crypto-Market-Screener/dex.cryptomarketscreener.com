const token = process.env.GITHUB_TOKEN

const data = { ref: "master", inputs: { name: "Alice", home: "remote" } }

const str = `curl -i -X POST --header 'authorization: token ${token}' -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/crypto-market-screener/dex.cryptomarketscreener.com/actions/workflows/main.yml/dispatches -d '${JSON.stringify(
  data
)}'`

console.log(str)
