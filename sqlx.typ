#import "/book.typ": book-page
#show: book-page.with(title: "Hello, typst")
#import "@preview/frame-it:1.2.0": *
#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.1": *
#import "@preview/showybox:2.0.4": showybox

#show: codly-init.with()

#let (example, feature, variant, syntax) = frames(
  feature: ("Feature",),
  // For each frame kind, you have to provide its supplement title to be displayed
  variant: ("Variant",),
  // You can provide a color or leave it out and it will be generated
  example: ("Example", gray),
  // You can add as many as you want
  syntax: ("Syntax",),
)
// This is necessary. Don't forget this!
#show: frame-style(styles.boxy)
/*****************************
 * 
 * START OF DOCUMENT
 * 
 *****************************/
 #let sqlx = "SQLx"
#set page(
  header: align(
    center,
    text(24pt)[#sqlx]
  ),
)
We will explore #sqlx in three chapteres:
+ Connection and configuration of #sqlx
+ Making queries to database with #sqlx
+ migration and maintenance of code



/* #showybox(
  sep: (dash: "dashed"),

  frame: (
    border-color: red.darken(60%),
    title-color: yellow.lighten(20%),
    body-color: yellow.lighten(70%)
  ),
  title-style: (
    color: black,
    weight: "regular",
    align: center
  ),
  shadow: (
    offset: 3pt,
  ),
  title: [e],
  [open: connection established],
  [message: data received],
  [error: websocket error],
  [close: connection closed]
)
 */
== Connection
`PgPoolOptions`
```rust
PgPoolOptions::new()
.max_connections(3)
.connect().await?;  // sqlx::Error
```

== migration and maintenance
== #sqlx command
parameterized vs. simple commands.

parameterized \u{2192} query plan is cached.


```rust
sqlx::query_as("SELECT $1") // here goes sql command
.bind(150_i64)
.fetch_one(&Pool).await?; // 
```

we can have:
```rust
conn.execute("BEGIN").await?
``` 
which is an unprepared query whereas:
```rust
conn.execute(sqlx::query("DELETE FROM TABLE")).await?;

```
is prepared, cached query. 
 #example[Note][ we used sql connection variable to call execute function.]
 We always prefare to use query interface whenever possible. 
 ```rust
sqlx::query("DELETE FROM table").execute(&mut conn).await?;
sqlx::query("DELETE FROM table").execute(&pool).await?;
```
the macro used to define rust structs  is `sqlx::FromRow`. like the example below:

```rust
#[derive(sqlx::FromRow)]
struct User { name: String, id: i64 }

let mut stream = sqlx::query_as::<_, User>("SELECT * FROM users WHERE email = ? OR name = ?")
    .bind(user_email)
    .bind(user_name)
    .fetch(&mut conn);
```
