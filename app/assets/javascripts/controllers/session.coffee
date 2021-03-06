'use strict'

angular.module('icastApp')
  .controller 'SessionCtrl', ($scope, $rootScope, Authentication, Restangular, $location) ->
    $scope.logout = () ->
      Restangular.all('user').one('sessions', 'current').remove().then () ->
        $rootScope.currentUser = null

    $scope.login = () ->
      Restangular.all('user').all('sessions')
        .post({ user_session: $scope.session }).then () ->
          Authentication.refreshCurrentUser()
          $location.path('/')
