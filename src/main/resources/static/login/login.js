/// <reference path = "login.js"/>

app.controller('loginCtrl', function ($log, $scope, $window, $http, $sessionStorage) {
    $scope.tryToAuth = function () {

        $http.post(contextPath + '/api/v1/login', $scope.user).then(function success(response) {
            if (response.data.token) {

                $http.defaults.headers.common.Authorization = 'Bearer ' + response.data.token;
                // $log.info(response.data.token);
                $sessionStorage.currentUser = {username: $scope.user.username, token: response.data.token};
                // сохраняем id пользователя в фабрику
                sessionStorage.setItem("userDetails", JSON.stringify(response.data));
                $window.location.href = '#!/invoice';

            }
        }, function error(response) {

            $scope.errorMessage = response.data.message;
            $scope.errorCode1 = response.data.status;
            $scope.errorTime = response.data.timestamp;

            $('#exampleModal').modal('show')

        }).catch(function (response) {
            $log.info("tryToAuth.catch: " + response);
            alert(response);
        });
    };

    $scope.tryToLogout = function () {
        delete $sessionStorage.currentUser;
        $http.defaults.headers.common.Authorization = '';
        $window.location.href = '#!/login';
    };

    $scope.isLoggedIn = function () {
        return !!$sessionStorage.currentUser;
    }

    $scope.getUserName = function () {
        return $sessionStorage.currentUser ? $sessionStorage.currentUser.username : null;
    }

});