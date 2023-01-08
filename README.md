# LocalArchway

## What is LocalArchway?

LocalArchway (a fork of LocalTerra) is a complete Archway testnet and ecosystem containerized with Docker and orchestrated with a simple `docker-compose` file. It simplifies the way smart-contract developers test their contracts in a sandbox before they deploy them on a testnet or mainnet.

LocalArchway comes preconfigured with opinionated, sensible defaults for standard testing environments.

LocalArchway has the following advantages over a public testnet:

- Easily modifiable world states
- Quick to reset for rapid iterations
- Simple simulations of different scenarios
- Controllable validator behavior

## Prerequisites

- [Docker](https://www.docker.com/)
- [`docker-compose`](https://github.com/docker/compose)
- Supported known architecture: x86_64
- 16+ GB of RAM is recommended

## Install LocalArchway

1. Run the following commands:

    ```sh
        git clone --depth 1 https://github.com/alessandro-baldassarre/LocalArchway.git
        cd LocalArchway
    ```

2. Make sure your Docker daemon is running in the background and [`docker-compose`](https://github.com/docker/compose) is installed:

## Start, stop, and reset LocalArchway

- Start LocalArchway:

    ```sh
        docker-compose up
    ```

Your environment now contains:

- [archwayd] RPC node running on "tcp://localhost:26657"
- LCD running on "http://localhost:1317"
- [FCD] running on "http://localhost:3060"

Stop LocalArchway:

```sh
    docker-compose stop
```

Reset the world state:

```sh
    docker-compose rm
```

## Integrations

You can integrate LocalArchway in `archwayd`.

## Configure LocalArchway

The majority of LocalArchway is implemented through a `docker-compose.yml` file, making it easily customizable. You can use LocalArchway as a starting template point for setting up your own local Terra testnet with Docker containers.

Out of the box, LocalArchway comes preconfigured with opinionated settings such as:

- ports defined for RPC (26657), LCD (1317) and FCD (3060)
- standard [accounts](#accounts)

### Modifying node configuration

You can modify the node configuration of your validator in the `config/config.toml` and `config/app.toml` files.

#### Pro tip: Speed Up Block Time

You can greatly improve the experience by speeding up the block time.

To increase block time, edit the `[consensus]` parameters in the `config/config.toml` file, and specify your own values.

The following example configures all timeouts to `200ms`:

```diff
##### consensus configuration options #####
[consensus]

wal_file = "data/cs.wal/wal"
- timeout_propose = "3s"
- timeout_propose_delta = "500ms"
- timeout_prevote = "1s"
- timeout_prevote_delta = "500ms"
- timeout_precommit_delta = "500ms"
- timeout_commit = "5s"
+ timeout_propose = "200ms"
+ timeout_propose_delta = "200ms"
+ timeout_prevote = "200ms"
+ timeout_prevote_delta = "200ms"
+ timeout_precommit_delta = "200ms"
+ timeout_commit = "200ms"
```

### Modifying genesis

You can change the `genesis.json` file by altering `config/genesis.json`. To load your changes, restart your LocalArchway.

## Accounts

LocalArchway is pre-configured with one validator and 10 accounts with ARCH balances.

| Account   | Address                                                                                                  | Mnemonic                                                                                                                                                                   |
| --------- | -------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| validator | `archway1r9rw6f4k2q2nswem7uauwu40v06nugx5kgds5m`<br/>`archwayvaloper1r9rw6f4k2q2nswem7uauwu40v06nugx5kvyjej` | `game mom anxiety ghost hello brain produce fall mango spend come nut rare surprise grab setup pill jewel valve lawn primary glory roast budget`                    |
| test1     | `archway1xlr2ew69wp9qkyxw8ta6dwxfvds7muuuxfy57k`                                                           | `beauty rally cable disease glare give cause expect lend floor attract swamp summer crop crouch pull miracle rescue junk tower chapter lemon inside wood`                       |
| test2     | `archway1gf7km9nu6kjs5hzjvsy4xmj29f8wqqxcq342w8`                                                           | `umbrella crush hero perfect sibling enlist skull ensure bag yellow save still boss list mouse symbol soda shoot match moment inner stage tunnel alien`              |
| test3     | `archway18zrc5xc5q2ajt7ga93tj6702jrm2g0jpa2aqwz`                                                           | `supply culture wire buffalo ritual choose primary mandate vault ethics visual canvas ramp fossil cable swing sand napkin situate stamp breeze link knife rigid`        |
| test4     | `archway1mqkuh28lnajvu78su4a9an4vkf0rv44zse7vhh`                                                           | `olympic gorilla notable vendor zoo laptop yard live female light tray sketch session cable rib day keep company twist shoot luxury squeeze inch right` |
| test5     | `archway1zt0n74n6n3cp2wthgs8haaphpc09j8p3vtaxnn`                                                           | `hen toss faith economy flush tennis bench city nerve song road dumb crash humble token frown include cloud assault change become exhaust inmate city`        |
| test6     | `archway1k638d5zz07tqhe60np8n4ghynglfrurv3qqu44`                                                           | `gorilla ladder response thrive since scissors casual bring enter basic portion near crane wagon pumpkin manage phrase flee vapor track surge nose option vacuum`                  |
| test7     | `archway195u4ct6atav5g8nydfw23p6h2ckg2lz3ezv0fj`                                                           | `repair slogan laundry mistake thank slide parade robust eagle pioneer what visual conduct brain angry trick loud anxiety cruise right clown fortune master retreat`                       |
| test8     | `archway1htjh0pwmenqq0v8eqcz5xg545f5a9ur6grs6en`                                                           | `puzzle legend version push until twice guard boss castle year grief budget critic engine excite coffee miss relax found fiber scissors matter script arrange`                 |
| test9     | `archway1q2h6ydwl560g253dyw09kv7dem3k5y8r85rlg9`                                                           | `carpet patrol holiday gorilla laugh orphan bench bus snap invite volcano gate merit siege vanish meadow stereo rib method home month virus cause habit`       |
| test10    | `archway1nr6gc884l5u2w99rcyqw4weh8r90u5r80wrjfm`                                                           | `six mushroom seed outside fade danger busy crime night zebra crash tail husband vague dad magic idle cupboard baby book ankle jar wedding situate`
