///<reference path = "https://ajax.googleapis.com/ajax/libs/angularjs/1.8.0/angular.js"/>
let app = angular.module('MakrosPlusStore', ['ngRoute', 'ngStorage']);
const contextPath = 'http://localhost:8189/makrosplusstore'

app.config(function ($routeProvider) {
    $routeProvider
        .when('/', {
            templateUrl: 'welcome.html'
        })
        .when('/login', {
            templateUrl: 'login.html',
            controller: 'loginControllerApiV1'
        })
        .when('/nomenclature', {
            templateUrl: 'nomenclature.html',
            controller: 'nomenclatureControllerApiV1'
        })
        .when('/nomenclature/add', {
            templateUrl: 'nomenclatureAdd.html',
            controller: 'nomenclatureControllerApiV1'
        })
        .when('/category', {
            templateUrl: 'category.html',
            controller: 'categoryControllerApiV1'
        })
        .when('/customer', {
            templateUrl: 'customer.html',
            controller: 'customerControllerApiV1'
        })
        .when('/invoice', {
            templateUrl: 'invoice.html',
            controller: 'invoiceControllerApiV1'
        })
        .when('/invoice/edit', {
            templateUrl: 'invoiceEdit.html',
            controller: 'invoiceControllerApiV1'
        })
        .when('/invoiceAddAnJS', {
            templateUrl: 'invoiceAdd.html',
            controller: 'invoiceControllerApiV1'
        })
        .otherwise({template: '<h1>404 Error (роутинг провайденр не нашел такой путь)</h1>'})
});

app.controller('categoryControllerApiV1', function ($scope, $http, $localStorage) {
    // проверяем вошедшего пользователя (см loginController)
    // не забыть инжектнуть в контроллер параметр $localStorage
    if ($localStorage.currentUser) {
        $http.defaults.headers.common.Authorization = 'Bearer ' + $localStorage.currentUser.token;
    }
    let Category = function () {

        $http.get(contextPath + "/api/v1/category")
            .then(function (response) {
                $scope.categoryList = response.data;
            });
    };
    Category();
});

app.controller('customerControllerApiV1', function ($scope, $http, $routeParams, invoiceFactory, $localStorage) {
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

app.factory('invoiceFactory', function () {
    return {
        invoiceJSON:
            {
                dataCreate: new Date(),
                orderNumber: null,
                department: null,
                comment: null,
                invoiceNumber: null,
                totalPrice: null,
                sentToPrice: false,
                sentToApprove: false,
                sentToPurchase: false,
                resolveDate: null,
                customer: {id: null},
                purchases: []
            }
    }
});












