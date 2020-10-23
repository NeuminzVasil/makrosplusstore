///<reference path = "https://ajax.googleapis.com/ajax/libs/angularjs/1.8.0/angular.js"/>
let app = angular.module('MakrosPlusStore', ['ngRoute', 'ngStorage']);
const contextPath = 'http://localhost:8189/makrosplusstore'

app.config(function ($routeProvider) {

    $routeProvider
        .when('/', {
            templateUrl: 'welcome/welcome.html'
        })
        .when('/login', {
            templateUrl: 'login/login.html',
            controller: 'loginCtrl'
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
            controller: 'customerCtrl'
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
        .otherwise({template: '<h1>404 Error (роутинг провайденр не нашел такой путь)</h1>'});

    // $locationProvider.html5Mode(true);
});

app.controller("routeUpdating", function ($scope, $localStorage, $rootScope, $window) {

/*    $rootScope.$on('$routeChangeStart', function () {
        console.info("$routeChangeStart");
        // alert('refresh');
    });*/


    // 'event' - это объект, описывающий среду, окружающую запущенное событие,
    // 'current' - текущий маршрут,
    // 'previous' - это маршрут, который существовал до того, как это было достигнуто
    // 'rejection' - это настраиваемое сообщение об отклонении, которое здесь поступает из параметра defer.reject ().
    $rootScope.$on("$routeChangeError", function (event, current, previous, rejection) {
        console.error("failed to change routes");
        $scope.errorEvent = event;
        $scope.errorCurrent = current;
        $scope.errorPrevious = previous;
        $scope.errorRejection = rejection;

        // $('#exampleModal').modal('show');
        // $window.location.href = 'http://localhost:8189/makrosplusstore/logout';
        delete $localStorage.currentUser;
        $http.defaults.headers.common.Authorization = '';
        $window.location.href = '#!/';
    });
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











