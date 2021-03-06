# defaultEnv

Composable cascading environment variable defaults.

[![NPM version](http://img.shields.io/npm/v/default-env.svg?style=flat-square)](https://www.npmjs.org/package/default-env)
[![Build Status](http://img.shields.io/travis/goodeggs/default-env.svg?style=flat-square)](https://travis-ci.org/goodeggs/default-env)
[![MIT License](http://img.shields.io/badge/license-MIT-blue.svg?style=flat-square)](https://github.com/goodeggs/default-env/blob/master/LICENSE.md)

The environments your app runs in don't divide into neat buckets like development, staging, and production. Your client side unit tests shouldn't spend time minifying. Your integration tests should. You always minify in production. Your continuous integration host doesn't install the browser that
gives you nice test failure debugging in development, but sometimes you want to run those just like CI, because they fail there but pass on your machine.

Instead of coding all those configuration rules into your app, layer on additive environments.  Define your environments near eachother, so the composition is easy to reason about.

Variables explicitly set in the environment [always have final say](http://12factor.net/config).

## Usage

```
npm install default-env
```

```javascript
var defaultEnv = require('default-env')

defaultEnv.define({
  test: {
    PORT: 4001,
    LOG_LEVEL: 'error',
    OPTIMIZE: false
  },
  integration: {
    OPTIMIZE: true
  },
  development: {
    OPTIMIZE: false,
    PORT: 4000,
    LOG_LEVEL: 'warning'
  },
  production: {
    OPTIMIZE: true,
    LOG_LEVEL: 'verbose'
  }
})

task('test:integation', function() {
  defaultEnv.use('test', 'integration')
  // ...
})

```

See [tests](test/default_env.test.coffee) for more examples.

## Contributing

Please follow our [Code of Conduct](https://github.com/goodeggs/mongoose-webdriver/blob/master/CODE_OF_CONDUCT.md)
when contributing to this project.

```
$ git clone https://github.com/goodeggs/default-env && cd default-env
$ npm install
$ npm test
```

_Module scaffold generated by [generator-goodeggs-npm](https://github.com/goodeggs/generator-goodeggs-npm)._
