#import "/book.typ": book-page
#show: book-page.with(title: "testcontainers")


In this blog post, want to learn new way of testing applications with
#link("https://rust.testcontainers.org/")[testcontainers].
The problem we want to solve is this: In every software test that you dependd on external services, you have to keet the environment outside of the code.
Let me give you a concrete example.
Suppose you are writing an application that interacts with database.
I use sqlx for instance. I have to create a database and configure it properly outside my Development environment. The code I am writing might need to be connected to a database that is empty from the beginning. So everytime I run the code, I have to manually truncate the database. This is a problem, and we try to solve it with testcontainers. So the premise is this: manage services that require a service outside your code with testcontainers. It might be redis, database, or I assume you can stimulate tiny bots to stress test your application.


= sqlx first example
This is the simplest example of having a databse to connect with.

This is my data model:
```
#[derive(FromRow, Debug, Serialize, Deserialize)]
pub struct User {
    #[sqlx(Default)]
    pub id: Option<i32>,
    pub username: String,
    pub email: String,
    pub password: String,
    pub created_at: Option<DateTime<Local>>, // https://docs.rs/sqlx/latest/sqlx/mysql/types/index.html
}

```

And with thic code I can get the details of my website users:
```
    pub async fn get_user_by_username(
        username: &str,
        pool: &MySqlPool,
    ) -> Result<User, sqlx::Error> {
        sqlx::query_as::<_, User>("SELECT * FROM user where username=?")
            .bind(username)
            .fetch_one(pool)
            .await
    }

```
