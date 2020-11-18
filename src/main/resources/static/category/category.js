/// <reference path = "category.js"/>

app.controller('categoryCtrl', function ($scope, $http, $sessionStorage) {
    // проверяем вошедшего пользователя (см loginController)
    // не забыть инжектнуть в контроллер параметр $sessionStorage
    if ($sessionStorage.currentUser) {
        $http.defaults.headers.common.Authorization = 'Bearer ' + $sessionStorage.currentUser.token;
    }

    let Category = function () {

        $http.get(contextPath + "/api/v1/category")
            .then(function (response) {
                $scope.categoryList = response.data;
            });
    };
    Category();
});












