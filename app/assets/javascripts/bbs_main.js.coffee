window.App = angular.module('BBSOnRails', ['ngResource', 'ngRoute', 'ngAnimate'])

App.config ($httpProvider) ->
  $httpProvider.defaults.headers.common['X-CSRF-Token'] =
    document.getElementsByName("csrf-token")[0].content