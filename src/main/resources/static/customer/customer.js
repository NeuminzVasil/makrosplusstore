/// <reference path = "customer.js"/>

app.controller('customerCtrl', function ($scope, $http, $routeParams, $sessionStorage) {
    // проверяем вошедшего пользователя (см loginController)
    // не забыть инжектнуть в контроллер параметр $sessionStorage
    if ($sessionStorage.currentUser) {
        $http.defaults.headers.common.Authorization = 'Bearer ' + $sessionStorage.currentUser.token;
    }

    $scope.customer = function () {
        $http.get(contextPath + "/api/v1/customer")
            .then(function (response) {
                $scope.customerList = response.data;
            });
    };
    $scope.customer();

});







