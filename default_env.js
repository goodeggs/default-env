var _ = require('underscore')

module.exports = {

  environments: {},

  define: function (defaultsByEnvironment) {
    this.environments = _.extend(
      this.environments,
      defaultsByEnvironment
    )
  },

  use: function () {
    var defaults = {},
        _this = this;

    [].map.call(arguments, function (environment) {
      defaults = _.extend(defaults, _this.environments[environment])
    })
    _.defaults(process.env, defaults)
  }
}
