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
        "category": 2
    }

app.controller('nomenclatureControllerApiV1', function ($location, $log, $scope, $http, $routeParams, invoiceFactory, $localStorage) {
    // проверяем вошедшего пользователя (см loginController)
    // не забыть инжектнуть в контроллер параметр $localStorage
    if ($localStorage.currentUser) {
        $http.defaults.headers.common.Authorization = 'Bearer ' + $localStorage.currentUser.token;
    }

    $scope.nomenclatureJSON = nomenclatureJSON;
    $scope.invoiceFactory = invoiceFactory;
    $scope.sortColumn = "nomenclature";
    $scope.reversSortColumn = false;

    $scope.showAllNomenclature = function () {
        let localPath = contextPath + "/api/v1/nomenclature";

        $scope.buttonBackShow = "";
        $scope.buttonForwardShow = "";

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

                //$log.info("showAllNomenclature.response: ", response);
            });
    };
    $scope.showAllNomenclature();

    /**
     * добавить товар в корзину
     * @param nomenclature
     */
    $scope.addToInvoice = function (nomenclature) {

        let indexX = invoiceFactory.invoiceJSON.purchases.findIndex((x) =>
            x.nomenclature === nomenclature);

        // добавить в JSON запись о новом товаре
        if (indexX < 0) invoiceFactory.invoiceJSON.purchases.push({
            nomenclature,
            "count": 1,
            "approver": null,
            "resolvingDate": null,
            "comment": null,
            "buyingPrice": nomenclature.price
        });
        // добавить в JSON колличесвто + 1
        else invoiceFactory.invoiceJSON.purchases[indexX].count++;
    };

    /**
     * сортировка товаров
     * @param column
     */
    $scope.sortData = function (column) {
        $scope.reversSortColumn = ($scope.sortColumn == column) ? !$scope.reversSortColumn : false;
        $scope.sortColumn = column;
    }
    // используй это когда при сортировке нужно изменить CSS для элемента
    $scope.getSortClass = function (column) {
        if ($scope.sortColumn == column) {
            return $scope.reversSortColumn ? 'arrow-down' : 'arrow-up';
        }
        return '';
    }

    /**
     * Добавить новый товар
     * @param nomenclatureJSON
     */
    $scope.addNomenclature = function (nomenclature) {
        //$log.info("addNomenclature.nomenclature", nomenclature);
        $http.put(contextPath + "/api/v1/nomenclature/add", nomenclature)
            .then(function (response) {
                //$log.info("addNomenclature.response", response);
                $location.path('/nomenclature');
            });
    };

    /**
     * Редактировать товар
     * @param nomenclatureJSON
     */
    $scope.editNomenclature = function (nomenclature) {
        nomenclatureJSON = nomenclature;
        $location.path('/nomenclature/add');
    }

    /**
     * Удалить товар из базы
     * @param nomenclature
     */
    $scope.deleteNomenclature = function (nomenclature) {
        //$log.info("deleteNomenclature.nomenclature: ", nomenclature);
        $http.post(contextPath + "/api/v1/nomenclature/delete", nomenclature)
            .then(function (response) {
                //$log.info("deleteNomenclature.response: ", response);
                $location.path('/nomenclature');
            });
    }

});

