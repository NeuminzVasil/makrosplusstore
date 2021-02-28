/// <reference path = "config.js"/>

let nomenclatureJSON =
    {
        "id": null,
        "nomenclature": null,
        "comment": null,
        "price": null,
        "manufacturer": null,
        "code": "00000000000",
        "submitDate": new Date(),
        "expiredDate": null,
        "category": null
    }

app.controller('nomenclatureCtrl', function ($location,
                                             $log,
                                             $scope,
                                             $http,
                                             $routeParams,
                                             $sessionStorage,
                                             invoiceService) {
    // проверяем вошедшего пользователя (см loginController)
    // не забыть инжектнуть в контроллер параметр $sessionStorage
    if ($sessionStorage.currentUser) {
        $http.defaults.headers.common.Authorization = 'Bearer ' + $sessionStorage.currentUser.token;
    }

    $scope.nomenclatureJSON = nomenclatureJSON;
    $scope.sortColumn = "nomenclature";
    $scope.reversSortColumn = false;
    $scope.buttonBackShow = "";
    $scope.buttonForwardShow = "";

    $scope.showAllNomenclatures = function () {

        let localPath = contextPath + "/api/v1/nomenclature";

        // получить текущее состояние корзины (newInvoiceJson)
        $scope.newInvoiceJSON = invoiceService.getNewInvoiceJSON();

        if ($routeParams.pageNumber == null || $routeParams.pageNumber <= 1) {
            localPath = localPath + "?pageNumber=" + 1;
        } else {
            localPath = localPath + "?pageNumber=" + $routeParams.pageNumber;
        }

        if ($scope.minPrice != null) localPath = localPath + "&minPrice=" + $scope.minPrice
        if ($scope.maxPrice != null) localPath = localPath + "&maxPrice=" + $scope.maxPrice
        if ($scope.nomenclature != null) localPath = localPath + "&nomenclature=" + $scope.nomenclature
        if ($scope.categoryID != null) localPath = localPath + "&categoryId=" + $scope.categoryID


        $http.get(localPath)
            .then(function (response) {

                if (response.data.number === 0) $scope.buttonBackShow = "disabled";
                if (response.data.last) $scope.buttonForwardShow = "disabled";

                $scope.TotalElements = response.data.totalElements;
                $scope.TotalPages = response.data.totalPages;
                $scope.PageNumber = response.data.number + 1;
                $scope.nomenclatureList = response.data.content;

            });
    };
    /**
     * Запустить при обновлении странички
     */
    $scope.showAllNomenclatures();

    $scope.clearNewInvoice = function () {
        invoiceService.initNewInvoice();
        $scope.newInvoiceJSON = invoiceService.getNewInvoiceJSON();
    }

    /**
     * добавить товар в корзину
     * @param nomenclature
     */
    $scope.addToInvoice = function (nomenclature) {

        invoiceService.putNomenclatureToNewInvoiceJSON(nomenclature);

        // $log.debug(invoiceService.getNewInvoiceJSON());
        $log.debug(invoiceService.newInvoice);

        $scope.newInvoiceJSON = invoiceService.getNewInvoiceJSON();

    };

    // используй это когда при сортировке нужно изменить CSS для элемента
    $scope.getSortClass = function (column) {
        if ($scope.sortColumn == column) {
            return $scope.reversSortColumn ? 'arrow-down' : 'arrow-up';
        }
        return '';
    }

    /**
     * Добавить новый \ обновить существующий товар
     * @param nomenclatureJSON
     */
    $scope.addEditNomenclature = function (nomenclature) {

        $log.debug("addEditNomenclature(): ", nomenclature);

        $http.put(contextPath + "/api/v1/nomenclature/add", nomenclature)
            .then(function (response) {
                $log.debug("addEditNomenclature.response: ", response);
                $location.path('/nomenclature/catalog');
            }, function error(response) {
                $log.debug("addEditNomenclature.error: ", response);
                $log.debug(response.data.status + ": " + response.data.error);
                $log.debug(response.data.message);
                $log.debug(response.config.data);
            });

    };

    /**
     * на форму редактирования товара
     * @param nomenclatureJSON
     */
    $scope.editFormNomenclature = function (nomenclature) {
        nomenclatureJSON = nomenclature;
        $location.path('/nomenclature/edit');
    }

    /**
     * на форму каталога товаров
     */
    $scope.catalogFormNomenclature = function () {
        window.history.back() // вернуться на предыдущую страницу
    }

    /**
     * Загрузить новый прайс лист
     * @param newPriceList
     */
    $scope.loadNewPriceList = function (newPriceList) {
        $location.path('/nomenclature/load');
    }

    /**
     * на форму поиска заказов по номеру товара
     * @param nomenclature
     */
    $scope.toInvoiceByNomenclature = function (nomenclature) {
        $log.debug("toInvoiceByNomenclature: ", nomenclature);
        sessionStorage.setItem("currentNomenclature", JSON.stringify(nomenclature));
        $location.path('/invoice/invoicesByNomenclature', nomenclature);
    }

    /**
     * Удаление товара из БД
     * @param nomenclature
     */
    $scope.deleteNomenclature = function (nomenclature) {
        $log.info("deleteNomenclature");
        $http.post(contextPath + "/api/v1/nomenclature/delete", nomenclature)
            .then(function (response) {
                $log.info("deleteNomenclature: " + response.status);
                window.history.back() // вернуться на предыдущую страницу
            }, function (response) {
                $log.info(response.status);
                $log.info(response.data.error);
                $log.info(response.data.message);
                $log.info(response.data.path);
                $log.info(response.config);
            });
    }

});



