/// <reference path = "customer.js"/>

app.controller('customerCtrl', function ($scope, $http, $routeParams, invoiceFactory, $localStorage) {
    // проверяем вошедшего пользователя (см loginController)
    // не забыть инжектнуть в контроллер параметр $localStorage
    if ($localStorage.currentUser) {
        $http.defaults.headers.common.Authorization = 'Bearer ' + $localStorage.currentUser.token;
    }

    $scope.customer = function () {
        $http.get(contextPath + "/api/v1/customer")
            .then(function (response) {
                $scope.customerList = response.data;
            });
    };
    $scope.customer();

});







