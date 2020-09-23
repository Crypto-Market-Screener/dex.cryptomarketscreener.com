## Remove a submodule

```
git submodule deinit <path_to_submodule>
git rm <path_to_submodule>
git commit-m "Removed submodule "
rm -rf .git/modules/<path_to_submodule>
```

curl https://api.github.com/repos/Crypto-Market-Screener/dex.cryptomarketscreener.com/commits/master
