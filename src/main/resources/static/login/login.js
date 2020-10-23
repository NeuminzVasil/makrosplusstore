/// <reference path = "login.js"/>

app.controller('loginCtrl', function ($log, $scope, $window, $http, $localStorage) {
    $scope.tryToAuth = function () {

        $http.post(contextPath + '/api/v1/login', $scope.user).then(function success(response) {
            if (response.data.token) {
                $http.defaults.headers.common.Authorization = 'Bearer ' + response.data.token;
                // $log.info(response.data.token);
                $localStorage.currentUser = {username: $scope.user.username, token: response.data.token};
                $window.location.href = '#!/invoice';
            }
        }, function error(response) {

            $scope.errorMessage = response.data.message;
            $scope.errorCode1 = response.data.status;
            $scope.errorTime = response.data.timestamp;

            $('#exampleModal').modal('show')

        });
    };

    $scope.tryToLogout = function () {
        delete $localStorage.currentUser;
        $http.defaults.headers.common.Authorization = '';
        $window.location.href = '#!/login';
    };

    $scope.isLoggedIn = function () {
        if ($localStorage.currentUser) return true;
        return false;
    }

    $scope.getUserName = function () {
        if ($localStorage.currentUser) return $localStorage.currentUser.username;
        return null;
    }

});