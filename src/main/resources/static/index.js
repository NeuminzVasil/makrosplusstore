///<reference path = "https://ajax.googleapis.com/ajax/libs/angularjs/1.8.0/angular.js"/>
let app = angular.module('MakrosPlusStore', ['ngRoute', 'ngStorage']);
const contextPath = 'https://makrosplusstore.herokuapp.com'

app.config(function ($routeProvider) {
    $routeProvider
        .when('/', {
            templateUrl: 'welcome/welcome.html'
        })
        .when('/login', {
            templateUrl: 'login/login.html',
            controller: 'loginControllerApiV1'
        })
        .when('/nomenclature', {
            templateUrl: 'nomenclature/nomenclature.html',
            controller: 'nomenclatureControllerApiV1'
        })
        .when('/nomenclature/add', {
            templateUrl: 'nomenclature/nomenclatureAdd.html',
            controller: 'nomenclatureControllerApiV1'
        })
        .when('/category', {
            templateUrl: 'category/category.html',
            controller: 'categoryControllerApiV1'
        })
        .when('/customer', {
            templateUrl: 'customer/customer.html',
            controller: 'customerControllerApiV1'
        })
        .when('/invoice', {
            templateUrl: 'invoice/invoice.html',
            controller: 'invoiceControllerApiV1'
        })
        .when('/invoice/edit', {
            templateUrl: 'invoice/invoiceEdit.html',
            controller: 'invoiceControllerApiV1'
        })
        .when('/invoiceAddAnJS', {
            templateUrl: 'invoice/invoiceAdd.html',
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












