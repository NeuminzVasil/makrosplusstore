/// <reference path = "config.js"/>

app.controller('historyCtrl', function ($window,
                                        $location,
                                        $route,
                                        $log,
                                        $scope,
                                        $rootScope,
                                        $http,
                                        $sessionStorage,
                                        invoiceService) {

    $scope.stepsJSON = {};
    $scope.historyJSON = {};
    $scope.stepCommentJSON = {};
    $rootScope.currentHistory = null;

    /**
     * получить текущую историю и записать ее в скоуп для отображения ее в модальном окне добавления комментария
      * @param history кликнутая история
     */
    $scope.getCurrentHistory = function (history) {
        $rootScope.currentHistory = history;
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
                sessionStorage.setItem("stepsJSON", JSON.stringify(response.data));
                $scope.stepsJSON = response.data;
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

        return $scope.stepsJSON;
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
                        // $scope.stepsJSON = response.data;
                        $log.debug(response.data);
                    }, function error(response) { // todo разобраться как перехватывать статус не 200 например 302 не ошибка
                $scope.errorMessage2 = response.data.message;
                $scope.errorCode2 = response.data.status;
                $scope.errorTime2 = response.data.timestamp;

                $('#errorModal').modal('show')
                    });

                return $scope.stepsJSON;*/
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
                // sessionStorage.setItem("historyJSON", JSON.stringify(response.data));
                $scope.historyJSON = response.data;
            }, function error(response) { // todo разобраться как перехватывать статус не 200 например 302 не ошибка
                $log.debug("historyGet.error");
                $log.debug(response);
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
     * сохранить History в BD
     * @param step который кликнули и который нужно добавить в базу
     */
    $scope.historySave = function (step) {

        $scope.historyJSON.customer = {"id": JSON.parse(sessionStorage.getItem("userDetails")).id};
        $scope.historyJSON.invoice = invoiceService.getCurrentInvoiceJSON();
        $scope.historyJSON.step = step;

        $http.put(contextPath + '/api/v1/history/save', $scope.historyJSON)
            .then(function (response) {
                $log.info("historySave.put");
                //после внесения нового шага истории в БД обновляем currentInvoice в sessionStorage
                invoiceService.putInvoiceByIdToSessionStorage($scope.historyJSON.invoice.id);
            }, function error(response) {
                $log.debug("historySave.error");
                $log.debug(response)

                $scope.historySaveerrorMessage = response;
                $scope.historySaveerrorStatus = response.data.status;
                $scope.historySaveerrorTime = response.data.timestamp;

                $('#errorModal').modal('show')

            })
            .catch(function (response) {
                $log.error("historySave.catch");
                $log.error(response)

                $scope.historySaveerrorMessage = response.data.message;
                $scope.historySaveerrorStatus = response.data.status;

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

        $http.put(contextPath + '/api/v1/stepcomment/save', $scope.stepCommentJSON)
            .then(function (response) {
                $rootScope.currentInvoice = invoiceService.putInvoiceByIdToSessionStorage(invoiceService.getCurrentInvoiceJSON().id); //fixme не уверен что это должно быть сздесь. понять где должно быть внечение в скоп хтмл при открытии инвойс детейлс
            }, function error(response) {
                $log.info("response.status: " + response.status);
                $log.info("response.data.message: "+ response.data.message);
                $log.info("response.data.timestamp: "+ response.data.timestamp);
                $scope.errorCode3 = response.status;
                $scope.errorMessage3 = response.data.message;
                $scope.errorTime3 = response.data.timestamp;
                $('#errorModal').modal('show')
            })
            .catch(function (response) {
                $log.info("response.status: " + response.status);
                $log.info("response.data.message: "+ response.data.message);
                $log.info("response.data.timestamp: "+ response.data.timestamp);
                $scope.errorCode3 = response.status;
                $scope.errorMessage3 = response.data.message;
                $scope.errorTime3 = response.data.timestamp;
                $('#errorModal').modal('show')
            });

        $scope.stepCommentJSON = {};
        $scope.commentText = null;
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










