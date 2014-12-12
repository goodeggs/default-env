require('chai').should()
defaultEnv = require '..'

describe 'default-env', ->
  beforeEach ->
    delete process.env.LOG_LEVEL
    delete process.env.PORT
    delete process.env.OPTIMIZE

    defaultEnv.define
      test:
        PORT: 4001
        LOG_LEVEL: 'error'
        OPTIMIZE: false
      integration:
        OPTIMIZE: true
      development:
        OPTIMIZE: false
        PORT: 4000
        LOG_LEVEL: 'warning'
      production:
        OPTIMIZE: true
        LOG_LEVEL: 'verbose'

  it 'uses named environments', ->
    defaultEnv.use 'test'
    process.env.LOG_LEVEL.should.equal 'error'

  it 'wont clobber already defined environment', ->
    process.env.LOG_LEVEL = 'extreme'
    defaultEnv.use 'test'
    process.env.LOG_LEVEL.should.equal 'extreme'

  it 'gives higher precedence to rightmost environments', ->
    defaultEnv.use 'test', 'integration'
    process.env.OPTIMIZE.should.equal 'true'
