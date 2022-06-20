// берём Express
var express = require('express');

// создаём Express-приложение
var app = express();

// создаём маршрут для главной страницы
// http://localhost:8080/
app.get('/index', function(req, res) {
    res.sendfile('index.html');
});
app.get('/hi', function(req, res) {
    res.sendfile('hi.html');
});
app.get('/fine', function(req, res) {
    res.sendfile('fine.html');
});
app.get('/you', function(req, res) {
    res.sendfile('you.html');
});
app.get('/too', function(req, res) {
    res.sendfile('too.html');
});
// запускаем сервер на порту 8080
app.listen(8080);
// отправляем сообщение
console.log('Сервер стартовал!');