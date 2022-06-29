# Ieye

## Запуск сервиса:
```
iex -S mix phx.server
```

## GraphiQL
```
http://localhost:4000/api/graphiql
```

* query:  
  - places - список мест
  - place(id: `[place_id]`) - выбор определенного места
  - users -список пользователей
  - user(id: `[user_id]`) - выбор определенного пользователя

* mutation: 
  - checkInUser(id: `[user_id]`, place:`[place_id]`) - имитация подачи данных с маячка
  - createUser(username: `[username]`) - добавление нового пользователя
  - createPlace(placename: `[placename]`) - добавлениенового места
  - 
### Example:

* Request:
```
mutation{
  checkInUser(id: "3", place:"2"){
    id
    username
    places{
      id
      placename
    }
  }
}
```
* Response:
```
{
  "data": {
    "checkInUser": {
      "id": "3",
      "places": [
        {
          "id": "1",
          "placename": "Место №1"
        },
        {
          "id": "2",
          "placename": "Место №2"
        },
        {
          "id": "3",
          "placename": "Место №3"
        }
      ],
      "username": "Пользователь №3"
    }
  }
}
```