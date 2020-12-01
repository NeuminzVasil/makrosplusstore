/// <reference path = "config.js"/>

app.filter('isEmpty', function () {
    return function (date) {
        if (date == null) return "не задано";
        else return date;
    }
});

app.filter('isLink', function () {
    return function (date) {
        if (date == null) return "";
        else return date;
    }
});

app.filter('isNotResolved', function () {
    return function (date) {
        if (date == null) return true;
        else return false;
    }
});

app.filter('unachieved', function () {
    return function (date) {
        if (date == null) return "выполняется";
        else return date;
    }
});

