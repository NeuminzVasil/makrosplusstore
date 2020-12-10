/// <reference path = "config.js"/>

app.controller('invoiceCtrl', function ($window,
                                        $location,
                                        $route,
                                        $log,
                                        $scope,
                                        $rootScope,
                                        $http,
                                        $sessionStorage,
                                        invoiceService,
                                        stepsService) {


    // проверяем вошедшего пользователя (см loginController)
    // не забыть инжектнуть в контроллер параметр $sessionStorage
    if ($sessionStorage.currentUser) {
        $http.defaults.headers.common.Authorization = 'Bearer ' + $sessionStorage.currentUser.token;
    }

    /**
     * получить все СФ из базы
     */
    let showAllInvoices = function () {

        $http.get(contextPath + "/api/v1/invoice/dto")
            .then(function (response) {
                $scope.InvoiceList = response.data;
                $scope.steps = stepsService.getStepsJSON();
                // обновляем данные в html чтобы отобразились все новые шаги истории.
                $rootScope.currentInvoice = invoiceService.getCurrentInvoiceJSON(); //fixme не уверен что это должно быть сздесь. понять где должно быть внечение в скоп хтмл при открытии инвойс детейлс
            }, function error(response) { // todo разобраться как перехватывать статус не 200 например 302 не ошибка
                $scope.errorMessage2 = response.data.message;
                $scope.errorCode2 = response.data.status;
                $scope.errorTime2 = response.data.timestamp;

                $('#errorModal').modal('show')
            })
            .catch(function (response) {
                $scope.errorMessage2 = response.data.message;
                $scope.errorCode2 = response.data.status;
                $scope.errorTime2 = response.data.timestamp;

                $('#errorModal').modal('show')
            });
    };
    /**
     * автоматически запустить метод получения всех СФ при старте странички Invoice
     */
    showAllInvoices();

    /**
     * удалить Invoice по ID
     * @param invoice ID
     */
    $scope.deleteInvoiceFromDB = function (invoice) {

        $log.debug("deleteInvoice.invoice", invoice.id);
        $http.post(contextPath + "/api/v1/invoice/delete", invoice)
            .then(function (response) {
                //$log.debug("deleteInvoice.response: ", response);
                $route.reload();
                // $location.path('/invoice');

            }, function error(response) { // todo разобраться как перехватывать статус не 200 например 302 не ошибка
                $scope.errorMessage2 = response.data.message;
                $scope.errorCode2 = response.data.status;
                $scope.errorTime2 = response.data.timestamp;

                $('#errorModal').modal('show')
            })
            .catch(function (response) {
                $scope.errorMessage2 = response.data.message;
                $scope.errorCode2 = response.data.status;
                $scope.errorTime2 = response.data.timestamp;

                $('#errorModal').modal('show')
            });
        $window.location.href = '#!/invoice';
    }

    /**
     * добавить новый invoice
     * @param invoiceJSON
     */
    $scope.addNewInvoiceToDB = function (invoice) {
        $http.put(contextPath + "/api/v1/invoice/add", invoice)
            .then(function (response) {
                $log.debug("addInvoice.response: ", response);
                $location.path('/invoice');
            });
    };

    /**
     * добавить новый history
     * @param invoiceJSON
     */
    $scope.addHistory = function (history) {

        $http.put(contextPath + "/api/v1/history/save", historyJSON)
            .then(function (response) {
                //$log.debug("addInvoice.response: ", response);
                // $location.path('/invoice');
            }, function error(response) { // todo разобраться как перехватывать статус не 200 например 302 не ошибка
                $scope.errorMessage2 = response.data.message;
                $scope.errorCode2 = response.data.status;
                $scope.errorTime2 = response.data.timestamp;

                $('#errorModal').modal('show')
            })
            .catch(function (response) {
                $scope.errorMessage2 = response.data.message;
                $scope.errorCode2 = response.data.status;
                $scope.errorTime2 = response.data.timestamp;

                $('#errorModal').modal('show')
            });

    };

    /**
     * подготовить редактирование invoice
     * @param invoiceJSON
     */
    $scope.prepareToEditInvoice = function (invoice) {

        /*        $http.get(contextPath + "/api/v1/invoice/" + invoice.id)
                    .then(function (response) {
                        invoiceJSON = response.data;
                        // //$log.debug("prepareToEditInvoice.invoiceJSON: ", invoiceJSON);
                        $location.path('/invoice/edit');
                    });*/
        $scope.invoiceJSON = invoice;
        $log.debug($scope.invoiceJSON);
    }

    /**
     * редактировать invoice
     * @param invoiceJSON
     */
    $scope.editInvoice = function (invoice) {
        // //$log.debug("editInvoice.invoice: ", invoice);
        $http.put(contextPath + "/api/v1/invoice/edit", invoice)
            .then(function (response) {
                //$log.debug("editInvoice.response: ", response);
                $location.path('/invoice');
            }, function error(response) { // todo разобраться как перехватывать статус не 200 например 302 не ошибка
                $scope.errorMessage2 = response.data.message;
                $scope.errorCode2 = response.data.status;
                $scope.errorTime2 = response.data.timestamp;

                $('#errorModal').modal('show')
            })
            .catch(function (response) {
                $scope.errorMessage2 = response.data.message;
                $scope.errorCode2 = response.data.status;
                $scope.errorTime2 = response.data.timestamp;

                $('#errorModal').modal('show')
            });
    };

    /**
     * удалить элемент из заказа
     * @param index
     */
    // todo реализовать удаление элемента из заказа
    $scope.deletePurchaseFromInvoice = function (index) {

        $http.put(contextPath + "/api/v1/invoice/edit/deletePurchase/" + invoiceJSON.purchases[index].id)
            .then(function (response) {
                //$log.debug("deletePurchaseFromInvoice.response: ", response);
                if (response.status === 200) invoiceJSON.purchases.splice(index, 1);
                $scope.prepareToEditInvoice(invoiceJSON);
                // $route.reload();
            }, function error(response) { // todo разобраться как перехватывать статус не 200 например 302 не ошибка
                $scope.errorMessage2 = response.data.message;
                $scope.errorCode2 = response.data.status;
                $scope.errorTime2 = response.data.timestamp;

                $('#errorModal').modal('show')
            })
            .catch(function (response) {
                $scope.errorMessage2 = response.data.message;
                $scope.errorCode2 = response.data.status;
                $scope.errorTime2 = response.data.timestamp;

                $('#errorModal').modal('show')
            });
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

    $scope.isUnachived = function (data) {
        if (data === null || (!data)) return "bg-warning text-dark";
        else return "bg-success text-white";
    };

    /**
     * Фильтр для отображения
     * @param data - данные для провеки
     * @returns {string} - то что вернется в HTML
     */
    $scope.isPriced = function (data) {
        if (data === null || (!data)) return "цена не предоставлена";
        else return "цена предоставлена";
    };

    /**
     * Фильтр для отображения
     * @param data - данные для провеки
     * @returns {string} - то что вернется в HTML
     */
    $scope.isTrueClass = function (data) {
        if (data === null || (!data)) return "bg-warning text-dark";
        else return "bg-success text-white";
    };

    /**
     * Фильтр для отображения
     * @param data - данные для провеки
     * @returns {string} - то что вернется в HTML
     */
    $scope.isApproved = function (data) {
        if (data === null || (!data)) return "на согласовании";
        else return "согласован";
    };

    /**
     * Фильтр для отображения
     * @param data - данные для провеки
     * @returns {string} - то что вернется в HTML
     */
    $scope.isPurchased = function (data) {
        if (data === null || (!data)) return "ожидает закупки";
        else return "закупается";
    };

    /**
     * Перейти в оно детального отображения invoice
     * @param invoiceId
     */
    $scope.expandShortInvoiceToDetailed = function (invoiceId) {
        invoiceService.putInvoiceByIdToSessionStorage(invoiceId);
        $rootScope.currentInvoice = invoiceService.getCurrentInvoiceJSON(); //fixme не уверен что это должно быть сздесь. понять где должно быть внечение в скоп хтмл при открытии инвойс детейлс
        $window.location.href = '#!/invoiceDetails';// или $location.path('/invoice/edit');
    }

});

/**
 * Сервис нужен для передачи данных между контроллерами скоупами invoice.js и history.js
 * задачи сервиса работа с invoice, по-этому размещен здесь.
 */
app.factory('invoiceService', function ($log,
                                        $sessionStorage,
                                        $http,
                                        $rootScope) {
    /**
     * инициализация пустого invoiceJSON в sessionStorage
     */
    function initCurrentInvoice() {
        sessionStorage.setItem("currentInvoice", JSON.stringify({
            "datacreate": null,
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
    }

    /**
     * получить CurrentInvoiceJSON из $sessionStorage чтобы не нагружать базу
     * @returns {any}
     */
    function getCurrentInvoiceJSON() {
        return JSON.parse(sessionStorage.getItem("currentInvoice"))
    }

    /**
     * получить детализированный invoice из базы по его ID
     * при положительном ответе от BD записываем детальный JSON в $sessionStorage.currentInvoice и возвращаем его из функции
     * при ошибки .. что делать не ясно , как вернуть ошибку пока возвращаю NULL
     * @param id invoice
     */
    function putInvoiceByIdToSessionStorage(invoiceId) {
        initCurrentInvoice();
        $http.get(contextPath + "/api/v1/invoice/" + invoiceId)
            .then(function (response) {
                $log.info("putInvoiceByIdToSessionStorage.get");
                sessionStorage.setItem("currentInvoice", JSON.stringify(response.data));
                // обновляем данные в html чтобы отобразились все новые шаги истории.
                $rootScope.currentInvoice = getCurrentInvoiceJSON();
            }, function error(response) {
                $log.info("putInvoiceByIdToSessionStorage.catch");
                $log.info(response);
                $rootScope.errorMessage11 = response;
                $('#invoiceErrorModal').modal('show');
            })
            .catch(function (response) {
                $log.info("putInvoiceByIdToSessionStorage.catch");
                $log.info(response);
                $rootScope.errorMessage11 = response;
                $('#invoiceErrorModal').modal('show');
            });
    }

    return {
        newInvoice: {id:111111},
        initCurrentInvoice: initCurrentInvoice,
        getCurrentInvoiceJSON: getCurrentInvoiceJSON,
        putInvoiceByIdToSessionStorage: putInvoiceByIdToSessionStorage,
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
});










