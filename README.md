This is repository to replicate a bug with Yarn when installing local tarball files.


# What's the error

See this github issue: https://github.com/yarnpkg/yarn/issues/999

Basically installing a dependency using the protocol `file:relative-path-to-file.tgz` works on `npm` but fails on `yarn`.

# How to reproduce the example

In this example there are two packages. `package1` is packed using `npm pack` and copied over to the `package2` folder. Then I added the tar file as a dependency of the `package2` package.

```bash
cd package2
npm install          # this works
yarn                 # this fails
cat yarn-error.log   # To view the failure message
```

The error message is:

```
Trace:
  Error: Invalid URI "file:///package1-1.0.0.tgz"
      at Request.init (/Users/josecruz/.nvm/versions/node/v6.5.0/lib/node_modules/yarn/node_modules/request/request.js:274:31)
      at new Request (/Users/josecruz/.nvm/versions/node/v6.5.0/lib/node_modules/yarn/node_modules/request/request.js:128:8)
      at request (/Users/josecruz/.nvm/versions/node/v6.5.0/lib/node_modules/yarn/node_modules/request/index.js:54:10)
      at RequestManager.execute (/Users/josecruz/.nvm/versions/node/v6.5.0/lib/node_modules/yarn/lib/util/request-manager.js:327:17)
      at RequestManager.shiftQueue (/Users/josecruz/.nvm/versions/node/v6.5.0/lib/node_modules/yarn/lib/util/request-manager.js:353:10)
      at Promise (/Users/josecruz/.nvm/versions/node/v6.5.0/lib/node_modules/yarn/lib/util/request-manager.js:150:12)
      at RequestManager.request (/Users/josecruz/.nvm/versions/node/v6.5.0/lib/node_modules/yarn/lib/util/request-manager.js:148:21)
      at NpmRegistry.request (/Users/josecruz/.nvm/versions/node/v6.5.0/lib/node_modules/yarn/lib/registries/npm-registry.js:97:32)
      at TarballFetcher.fetchFromExternal (/Users/josecruz/.nvm/versions/node/v6.5.0/lib/node_modules/yarn/lib/fetchers/tarball-fetcher.js:176:21)
      at TarballFetcher._fetch (/Users/josecruz/.nvm/versions/node/v6.5.0/lib/node_modules/yarn/lib/fetchers/tarball-fetcher.js:218:19)
```
