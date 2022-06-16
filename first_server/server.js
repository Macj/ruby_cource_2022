// берём Express
var express = require('express');

// создаём Express-приложение
var app = express();

// создаём маршрут для главной страницы
// http://localhost:8080/
app.get('/index', function(req, res) {
    res.sendfile('index.html');
});
app.get('/', function(req, res) {
    res.sendfile('hi.html');
});

// запускаем сервер на порту 8080
app.listen(3000);
// отправляем сообщение
console.log('Сервер стартовал!');