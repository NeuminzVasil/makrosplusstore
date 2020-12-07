/// <reference path = "login.js"/>

app.controller('loginCtrl', function ($log, $scope, $window, $location, $http, $sessionStorage) {
    $scope.tryToAuth = function () {

        $http.post(contextPath + '/api/v1/login', $scope.user).then(function success(response) {
            if (response.data.token) {

                $http.defaults.headers.common.Authorization = 'Bearer ' + response.data.token;

                // $log.debug(response.data.token);
                $sessionStorage.currentUser = {username: $scope.user.username, token: response.data.token};

                // сохраняем id пользователя в фабрику
                sessionStorage.setItem("userDetails", JSON.stringify(response.data));

                // инициализация выбранного invoice
                currentInvoiceService.initCurrentPurchase();

                $window.location.href = '#!/invoice';

            }
        }, function error(response) {

            $log.debug("tryToAuth.error.data.message: " + response.data.message);
            $log.debug("tryToAuth.error.status: " + response.status);

            $scope.errorMessage = response.data.message;
            $scope.errorStatus = response.status;

            $('#errorLoginModal').modal('show')

        }).catch(function (response) {
            $log.debug("tryToAuth.error.data.message: " + response.data.message);
            $log.debug("tryToAuth.error.status: " + response.status);

            $scope.errorMessage = response.data.message;
            $scope.errorStatus = response.status;

            $('#errorLoginModal').modal('show')
        });
    };

    $scope.tryToLogout = function () {
        sessionStorage.clear();
    };

    $scope.isLoggedIn = function () {
        return !!$sessionStorage.currentUser;
    }

    $scope.getUserName = function () {
        return $sessionStorage.currentUser ? $sessionStorage.currentUser.username : null;
    }

});