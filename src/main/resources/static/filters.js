/// <reference path = "config.js"/>

app.filter('isEmpty', function () {
    return function (date) {
        if (date == null) return "не задано";
        else return date;
    }
});

app.filter('unachieved', function () {
    return function (date) {
        if (date == null) return "не задано";
        else return date;
    }
});







