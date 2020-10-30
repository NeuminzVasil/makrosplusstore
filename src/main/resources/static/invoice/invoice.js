/// <reference path = "config.js"/>

let invoiceJSON =
    {
        "id": null,
        "ordernumber": null,
        "comment": null,
        "department": null,
        "customer": null,
        "senttoprice": null,
        "senttoapprove": null,
        "senttopurchase": null,
        "datacreate": null,
        "totalprice": null,
        "invoicenumber": null,
        "resolveddate": null,
        "purchases": null
    }

app.controller('invoiceCtrl', function ($window, $location, $route, $log, $scope, $http, $localStorage, invoiceFactory) {


    // проверяем вошедшего пользователя (см loginController)
    // не забыть инжектнуть в контроллер параметр $localStorage
    if ($localStorage.currentUser) {
        $http.defaults.headers.common.Authorization = 'Bearer ' + $localStorage.currentUser.token;
    }

    $scope.invoiceFactory = invoiceFactory;
    $scope.invoiceJSON = invoiceJSON;

    /**
     * запросить из базы все СФ
     */
    let showAllInvoices = function () {
        $http.get(contextPath + "/api/v1/invoice")
            .then(function (response) {
                $scope.InvoiceList = response.data;
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
    $scope.deleteInvoice = function (invoice) {

        //$log.info("deleteInvoice.invoice", invoice);
        $http.post(contextPath + "/api/v1/invoice/delete", invoice)
            .then(function (response) {
                //$log.info("deleteInvoice.response: ", response);
                $route.reload();
                // $location.path('/invoice');

            });
    }

    /**
     * добавить invoice
     * @param invoiceJSON
     */
    $scope.addInvoice = function (invoice) {
        invoiceFactory.invoiceJSON.ordernumber = invoice.ordernumber;
        invoiceFactory.invoiceJSON.department = invoice.department;
        invoiceFactory.invoiceJSON.comment = invoice.comment;
        invoiceFactory.invoiceJSON.invoicenumber = invoice.invoicenumber;
        invoiceFactory.invoiceJSON.totalprice = invoice.totalprice;
        invoiceFactory.invoiceJSON.senttoprice = invoice.senttoprice;
        invoiceFactory.invoiceJSON.senttoapprov = invoice.senttoapprove;
        invoiceFactory.invoiceJSON.senttopurchase = invoice.senttopurchase;
        invoiceFactory.invoiceJSON.customer.id = invoice.customer;

        $http.put(contextPath + "/api/v1/invoice/add", invoiceFactory.invoiceJSON)
            .then(function (response) {
                //$log.info("addInvoice.response: ", response);
                $location.path('/invoice');
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
                        // //$log.info("prepareToEditInvoice.invoiceJSON: ", invoiceJSON);
                        $location.path('/invoice/edit');
                    });*/
        $scope.invoiceJSON = invoice;
        $log.info($scope.invoiceJSON);
    }

    /**
     * редактировать invoice
     * @param invoiceJSON
     */
    $scope.editInvoice = function (invoice) {
        // //$log.info("editInvoice.invoice: ", invoice);
        $http.put(contextPath + "/api/v1/invoice/edit", invoice)
            .then(function (response) {
                //$log.info("editInvoice.response: ", response);
                $location.path('/invoice');
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
                //$log.info("deletePurchaseFromInvoice.response: ", response);
                if (response.status === 200) invoiceJSON.purchases.splice(index, 1);
                $scope.prepareToEditInvoice(invoiceJSON);
                // $route.reload();
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










