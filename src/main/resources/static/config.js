///<reference path = "https://ajax.googleapis.com/ajax/libs/angularjs/1.8.0/angular.js"/>
let app = angular.module('makrosPlusStore', ['ngRoute', 'ngStorage']);
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
            controller: 'nomenclatureCtrl'
        })
        .when('/nomenclature/add', {
            templateUrl: 'nomenclature/nomenclatureAdd.html',
            controller: 'nomenclatureCtrl'
        })
        .when('/category', {
            templateUrl: 'category/category.html',
            controller: 'categoryCtrl'
        })
        .when('/customer', {
            templateUrl: 'customer/customer.html',
            controller: 'customerCtrl'
        })
        .when('/invoice', {
            templateUrl: 'invoice/invoice.html',
            controller: 'invoiceCtrl'
        })
        .when('/invoice/edit', {
            templateUrl: 'invoice/invoiceEdit.html',
            controller: 'invoiceCtrl'
        })
        .otherwise({redirectTo: {template: '<h1>404 Error (роутинг провайденр не нашел такой путь)</h1>'}});

    // $locationProvider.html5Mode(true);
});

app.controller("routeUpdating", function ($scope, $sessionStorage, $rootScope, $window) {

    /*    $rootScope.$on('$routeChangeStart', function () {
            console.info("$routeChangeStart");
            // alert('refresh'); //показать модальное окно по истечению срока Токена
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
        delete $sessionStorage.currentUser;
        $http.defaults.headers.common.Authorization = '';
        $window.location.href = '#!/';
    });
});

app.factory('newInvoiceService', function ($log, $sessionStorage) {
    return {
        initNewPurchase: function () {
            sessionStorage.setItem("newInvoice", JSON.stringify({
                "datacreate": new Date(),
                "department": null,
                "comment": null,
                "ordernumber": null,
                "invoicenumber": null,
                "senttoapprove": null,
                "senttopurchase": null,
                "senttoprice": null,
                "totalprice": null,
                "resolveddate": null,
                "customer": null,
                "purchases": []
            }));
        },
        putNomenclature: function (nom) {

            let newInvoice = JSON.parse(sessionStorage.getItem("newInvoice"));

            if (newInvoice.purchases.findIndex(value => value.nomenclature.id === nom.id) < 0)
                newInvoice.purchases.push({
                nomenclature: nom,
                count: 1,
                approver: null,
                resolvingdate: null,
                comment: null,
                buyingPrice: null,
                commentnumenclature: null
            })
            // добавить в JSON количество + 1
            else newInvoice.purchases[newInvoice.purchases.findIndex(value => value.nomenclature.id === nom.id)].count++; // добавить в JSON количество + 1

            sessionStorage.setItem("newInvoice", JSON.stringify(newInvoice));
            return newInvoice;
        },
        getNewInvoiceJSON: function () {
            return JSON.parse(sessionStorage.getItem("newInvoice"))
        }
    };
});














