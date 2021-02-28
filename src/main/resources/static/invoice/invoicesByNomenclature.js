/// <reference path = "config.js"/>

app.controller('invoiceByNomenclatureCtrl', function ($window,
                                                      $location,
                                                      $route,
                                                      $log,
                                                      $scope,
                                                      $rootScope,
                                                      $http,
                                                      $sessionStorage,
                                                      invoiceService) {


    // проверяем вошедшего пользователя (см loginController)
    // не забыть инжектнуть в контроллер параметр $sessionStorage
    if ($sessionStorage.currentUser) {
        $http.defaults.headers.common.Authorization = 'Bearer ' + $sessionStorage.currentUser.token;
    }

    /**
     * получить СФ для выбранного товара из базы
     */
    let showInvoicesByNomenclature = function () {

        $scope.nX = JSON.parse(sessionStorage.getItem("currentNomenclature"));

        $http.get(contextPath + "/api/v1/invoice/getByNomenclature/"  + $scope.nX.id)
            .then(function (response) {
                $log.debug(response.data);
                $scope.InvoiceByNomList = response.data;
            }, function error(response) {
                $log.debug(response.data.status);
                $log.debug(response.data.message);
            });
    };
    /**
     * автоматически запустить метод при старте странички Invoice
     */
    showInvoicesByNomenclature();

    /**
     * Перейти в окно детального отображения invoice
     * @param invoiceId
     */
    $scope.expandShortInvoiceToDetailed = function (invoiceId) {
        invoiceService.putInvoiceByIdToSessionStorage(invoiceId);
        $rootScope.currentInvoice = invoiceService.getCurrentInvoiceJSON(); //fixme не уверен что это должно быть здесь. понять где должно быть внечение в скоп хтмл при открытии инвойс детейлс
        $window.location.href = '#!/invoiceDetails';// или $location.path('/invoice/edit');
    }

    /**
     * Фильтр для отображения
     * @param data - данные для провеки
     * @returns {string} - то что вернется в HTML
     */
    $scope.isWarning = function (data) {
        if (data === null || (!data)) return "bg-warning text-dark";
        else return "bg-success text-white";
    };

});










