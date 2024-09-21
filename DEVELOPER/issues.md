## Issues

Write any issues on developer issues

## Issue / YARN

If you have problems with latest version of YARN v3 and wandering where are `./node_modules`,
you have to include `.yarnrc.yml` at root of the project, and add this line: `nodeLinker: node-modules`

## conventional commits setup

In order to install conventional commits , related modules: `[commitlint, standard-version]`, thes versions are required for `node.js@16`

```json
 "dependencies": {
    "@commitlint/cli": "^17.6.7",
    "@commitlint/config-conventional": "^17.6.7",
    "@types/standard-version": "^7.1.0",
    "standard-version": "^9.5.0"
  }
```

### Update to yarn 3.5.0 from yarn. 3.0.0

to fix steam issue:
`yarn Error [ERR_STREAM_PREMATURE_CLOSE]: Premature close`
source: https://github.com/ZJONSSON/node-unzipper/issues/228
we had to upgrade Yarn to later version

### Upgrade to Node@18 from Node@16

Latest node@18 release its SSL certificate in result not it requires to add:
`NODE_OPTIONS=--openssl-legacy-provider` prefix to execution scripts

some information here:
https://builtin.com/software-engineering-perspectives/err-ossl-evp-unsupported
