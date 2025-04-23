# Tools and versions

- Ruby Version - 3.2.2
- Rails Version - 6.1.7
- Database: Postgres 17
- External Api - [Open weather](https://openweathermap.org/api/one-call-3#weather_overview_how)

# Code Setup
```
git clone https://github.com/hupad/forecaster.git
rails db:create
rails dev:cache

**Start the server**
rails s
```

# Architecture

<img width="1450" alt="Screenshot 2025-04-23 at 5 13 48 AM" src="https://github.com/user-attachments/assets/c62ccb21-b7ee-4844-b1de-7cb6d8eaaf08" />


# Screenshots

**When there is no cache**

<img width="1709" alt="Screenshot 2025-04-23 at 5 16 13 AM" src="https://github.com/user-attachments/assets/6b048b49-e8c6-4af3-97a7-86ad24bdbcd0" />


**When data is coming back from cache**

<img width="1703" alt="Screenshot 2025-04-23 at 5 15 02 AM" src="https://github.com/user-attachments/assets/aefa5711-c2a1-479e-9d83-d552d0f56080" />
