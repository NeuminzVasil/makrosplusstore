///<reference path = "https://ajax.googleapis.com/ajax/libs/angularjs/1.8.0/angular.js"/>
let app = angular.module('makrosPlusStore', ['ngRoute', 'ngStorage']);
const contextPath = 'http://localhost:8189/makrosplusstore'

app.config(function ($routeProvider) {
    $routeProvider.caseInsensitiveMatch =true;
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
        .when('/nomenclature/edit', {
            templateUrl: 'nomenclature/nomenclatureEdit.html',
            controller: 'nomenclatureCtrl'
        })
        .when('/nomenclature/load', {
            templateUrl: 'nomenclature/nomenclatureLoad.html',
            controller: 'nomenclatureCtrl'
        })
        .when('/nomenclature/catalog', {
            templateUrl: 'nomenclature/nomenclatureCatalog.html',
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
        .when('/invoiceDetails', {
            templateUrl: 'invoice/invoiceDetails.html',
            controller: 'invoiceCtrl',
        })
        .when('/invoice/edit', {
            templateUrl: 'invoice/invoiceEdit.html',
            controller: 'invoiceCtrl'
        })
        .otherwise({redirectTo: {templateUrl:'welcome/welcome.html'}});

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

/*app.factory('newInvoiceService', function ($log, $sessionStorage) {
    return {
        initNewInvoice: function () {
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
        getNewInvoiceJSON: function () {
            return JSON.parse(sessionStorage.getItem("newInvoice"))
        },
        putNomenclatureToNewInvoiceJSON: function (nom) {

            let tempInvoice = JSON.parse(sessionStorage.getItem("newInvoice"));

            if (tempInvoice.purchases.findIndex(value => value.nomenclature.id === nom.id) < 0)
                tempInvoice.purchases.push({
                nomenclature: nom,
                count: 1,
                approver: null,
                resolvingdate: null,
                comment: null,
                buyingPrice: null,
                commentnumenclature: null
            })
            // добавить в JSON количество + 1
            else tempInvoice.purchases[tempInvoice.purchases.findIndex(value => value.nomenclature.id === nom.id)].count++; // добавить в JSON количество + 1

            sessionStorage.setItem("newInvoice", JSON.stringify(tempInvoice));
            return tempInvoice;
        }
    };
});*/

app.factory('stepsService', function ($log, $sessionStorage) {
    return {
        getStepsJSON: function () {
            return JSON.parse(sessionStorage.getItem("stepsJSON"))
        }
    };
});














