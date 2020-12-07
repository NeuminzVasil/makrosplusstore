/// <reference path = "config.js"/>

app.controller('historyCtrl', function ($window, $location, $route, $log, $scope, $http, $sessionStorage) {

    $scope.stepJSON = {};
    $scope.historyJSON = {};
    $scope.stepCommentJSON = {};
    $scope.currentHistory = null;

    let getCurrentInvoice = function () {
        $log.debug(JSON.parse(sessionStorage.getItem("currentInvoice")))
        return JSON.parse(sessionStorage.getItem("currentInvoice"));
    }

    $scope.getCurrentHistory = function (history) {
        $scope.currentHistory = history;
    }

    /**
     * найти все типы Step
     *
     * @return Step
     * @PathVariable Long id - id Step
     */
    $scope.stepFindAll = function () {

        $http.get(contextPath + '/api/v1/step')
            .then(function (response) {
                sessionStorage.setItem("stepJSON", JSON.stringify(response.data));
                // return JSON.parse(sessionStorage.getItem("userInfo"));
                $scope.stepJSON = response.data;

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

        return $scope.stepJSON;
    };

    /**
     * сохранить Step в BD
     *
     * @param step Step
     * @return - ссылка на сохраненный Step
     */
    $scope.stepSave = function (sJ) {
        $log.debug("stepSave:");
        $log.debug(sJ);

        /*        $http.get(contextPath + '/api/v1/step/save', sJ)
                    .then(function (response) {
                        // $scope.stepJSON = response.data;
                        $log.debug(response.data);
                    }, function error(response) { // todo разобраться как перехватывать статус не 200 например 302 не ошибка
                $scope.errorMessage2 = response.data.message;
                $scope.errorCode2 = response.data.status;
                $scope.errorTime2 = response.data.timestamp;

                $('#errorModal').modal('show')
                    });

                return $scope.stepJSON;*/
    }

    /**
     * изменить Step по ID
     * @param step Step
     * @return - ссылка на сохраненный Step
     */
    $scope.stepEdit = function () {

    }

    /**
     * удалить Step
     * @param step Step
     */
    $scope.stepDelete = function () {

    }

    /**
     * найти history по ID
     */
    $scope.historyGet = function (id) {
        $log.debug("historyGet: " + contextPath + '/api/v1/history/get/' + id);

        $http.get(contextPath + '/api/v1/history/get/' + id)
            .then(function (response) {
                sessionStorage.setItem("historyJSON", JSON.stringify(response.data));
                // return JSON.parse(sessionStorage.getItem("userInfo"));
                $scope.historyJSON = response.data;
            }, function error(response) { // todo разобраться как перехватывать статус не 200 например 302 не ошибка
                $log.debug("historyGet.error: " + response);
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

        return $scope.historyJSON;
    }

    /**
     * сохранить History в BD
     * @param history - History
     * @return - ссылка на сохраненный History
     */
    $scope.historySave = function (invoice, step) {

        $scope.historyJSON.customer = {"id": JSON.parse(sessionStorage.getItem("userDetails")).id};
        $scope.historyJSON.invoice = invoice
        $scope.historyJSON.step = step

        $log.log($scope.historyJSON)

        $http.put(contextPath + '/api/v1/history/save', $scope.historyJSON)
            .then(function (response) {

                $scope.getInvoiceDetails($scope.invoiceJSON.id);

            }, function error(response) {

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
     * изменить History по ID
     * @param history - History
     * @return - ссылка на сохраненный History
     */
    $scope.historyEdit = function () {

    }

    /**
     * удалить History
     * @param history - History
     */
    $scope.historyDelete = function () {

    }

    /**
     * найти stepComment по ID
     *
     * @return Stepcomment
     * @PathVariable Long id - id Stepcomment
     */
    $scope.stepCommentGet = function (id) {
        $log.debug("stepCommentGet: " + contextPath + '/api/v1/stepcomment/get/' + id);

        $http.get(contextPath + '/api/v1/stepcomment/get/' + id)
            .then(function (response) {
                sessionStorage.setItem("stepCommentJSON", JSON.stringify(response.data));
                // return JSON.parse(sessionStorage.getItem("userInfo"));
                $scope.stepCommentJSON = response.data;
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

        return $scope.stepCommentJSON;
    }

    /**
     * добавить stepComment
     * @param stepComment
     */
    $scope.stepCommentSave = function (history, newMessage) {

        $scope.stepCommentJSON.customer = {"id": JSON.parse(sessionStorage.getItem("userDetails")).id};
        $scope.stepCommentJSON.history = history;
        $scope.stepCommentJSON.comment = newMessage;

        $log.debug($scope.stepCommentJSON);

        $http.put(contextPath + '/api/v1/stepcomment/save', $scope.stepCommentJSON)
            .then(function (response) {
                $scope.getInvoiceDetails($scope.invoiceJSON.id);
            }, function error(response) {
                $scope.errorMessage2 = response.data.message;
                $scope.errorCode2 = response.data.status;
                $scope.errorTime2 = response.data.timestamp;
                $scope.getInvoiceDetails()
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
     * изменить StepComment по ID
     * @param stepComment StepComment
     * @return - ссылка на сохраненный StepComment
     */
    $scope.stepCommentEdit = function () {

    }

    /**
     * удалить StepComment
     * @param stepComment StepComment
     */
    $scope.stepCommentDelete = function () {

    }

    /**
     * при загрузке окна добавления History
     */
    $scope.historyInit = function () {
        $scope.stepFindAll();
    }



});










