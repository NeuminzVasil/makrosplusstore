/// <reference path = "config.js"/>

app.controller('historyCtrl', function ($window, $location, $route, $log, $scope, $http, $sessionStorage) {

    $scope.stepJSON = {};
    $scope.historyJSON = {};
    $scope.stepCommentJSON = {};

    let getCurrentInvoice = function () {
        $log.info(JSON.parse(sessionStorage.getItem("currentInvoice")))
        return JSON.parse(sessionStorage.getItem("currentInvoice"));
    }

    /**
     * найти все типы Step
     *
     * @return Step
     * @PathVariable Long id - id Step
     */
    $scope.stepFindAll = function () {

        $log.info("stepFindAll: " + contextPath + '/api/v1/step');

        $http.get(contextPath + '/api/v1/step')
            .then(function (response) {
                sessionStorage.setItem("stepJSON", JSON.stringify(response.data));
                // return JSON.parse(sessionStorage.getItem("userInfo"));
                $scope.stepJSON = response.data;

            }, function error(response) { // todo разобраться как перехватывать статус не 200 например 302 не ошибка
                $log.info("stepFindAll.error: " + response);
                alert(response);
            })
            .catch(function (response) {
                $log.info("stepFindAll.catch: " + response);
                alert(response);
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
        $log.info("stepSave:");
        $log.info(sJ);

        /*        $http.get(contextPath + '/api/v1/step/save', sJ)
                    .then(function (response) {
                        // $scope.stepJSON = response.data;
                        $log.info(response.data);
                    }, function error(response) { // todo разобраться как перехватывать статус не 200 например 302 не ошибка
                        alert(response);
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
        $log.info("historyGet: " + contextPath + '/api/v1/history/get/' + id);

        $http.get(contextPath + '/api/v1/history/get/' + id)
            .then(function (response) {
                sessionStorage.setItem("historyJSON", JSON.stringify(response.data));
                // return JSON.parse(sessionStorage.getItem("userInfo"));
                $scope.historyJSON = response.data;
            }, function error(response) { // todo разобраться как перехватывать статус не 200 например 302 не ошибка
                $log.info("historyGet.error: " + response);
                alert(response);
            })
            .catch(function (response) {
                $log.info("historyGet.catch: " + response);
                alert(response);
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
                alert(response.status);
            }, function error(response) {
                $log.info("historySave.error: " + response.data);
                alert(response);
            })
            .catch(function (response) {
                $log.info("historySave.catch: " + response.data);
                alert(response);
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
        $log.info("stepCommentGet: " + contextPath + '/api/v1/stepcomment/get/' + id);

        $http.get(contextPath + '/api/v1/stepcomment/get/' + id)
            .then(function (response) {
                sessionStorage.setItem("stepCommentJSON", JSON.stringify(response.data));
                // return JSON.parse(sessionStorage.getItem("userInfo"));
                $scope.stepCommentJSON = response.data;
            }, function error(response) { // todo разобраться как перехватывать статус не 200 например 302 не ошибка
                $log.info("stepCommentGet.error: " + response);
                alert(response);
            })
            .catch(function (response) {
                $log.info("stepCommentGet.catch: " + response);
                alert(response);
            });

        return $scope.stepCommentJSON;
    }

    /**
     * добавить stepComment
     * @param stepComment
     */
    $scope.stepCommentSave = function (historyID, newMessage) {

        $scope.stepCommentJSON.customer = {"id": JSON.parse(sessionStorage.getItem("userDetails")).id};
        $scope.stepCommentJSON.history = {"id": historyID};
        $scope.stepCommentJSON.comment = newMessage;

        $http.put(contextPath + '/api/v1/stepcomment/save', $scope.stepCommentJSON)
            .then(function (response) {
                $log.info("stepCommentSave.error: " + response);
                $log.info("stepCommentSave.error.status: " + response.status);
                alert(response.status);
            }, function error(response) {
                $log.info("stepCommentSave.error: " + response);
                alert(response);
            })
            .catch(function (response) {
                $log.info("stepCommentSave.catch: " + response);
                alert(response);
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










