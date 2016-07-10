# Instalacija

- Instalirajte [vagrant](https://www.vagrantup.com/)
- Vzpostavite okolje ``vagrant up`` (lahko traja nekaj casa)
- Prijavite se v navidezno okolje ``vagrant ssh``

# Uporaba

## Prijava v konzolo
```
geth attach
```

## Odklep denarnice
```
personal.unlockAccount(eth.accounts[0])
```
Geslo je ``dev``

## Deploy pogodbe

Uporabi Web3 deploy [spletnega prevajalnika](https://ethereum.github.io/browser-solidity/#version=soljson-latest.js).

## Klic bralne metode

```
pogodba.metoda.call([[ parametri ]])
```

## Klic pisalne metode

```
pogodba.metoda.sendTransaction([[ parametri ]], {from:eth.accounts[0], gas:300000})
```

# Viri

- [Solidity dokumentacija](http://solidity.readthedocs.io/en/latest/index.html)
- [Mist wallet](https://github.com/ethereum/mist/releases)
- [Mix debugger](https://github.com/ethereum/webthree-umbrella/releases)
- [Online solidity compiler](https://ethereum.github.io/browser-solidity/)
- [Zastonj testnet etri](https://zerogox.com/ethereum/wei_faucet)
- [Blockchain explorer](http://etherscan.io/)
- [Testnet blockchain explorer](http://testnet.etherscan.io/)
