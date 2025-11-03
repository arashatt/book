#import "/book.typ": book-page
#show: book-page.with(title: "axum-middleware")


This is my first attempt to write axum middleware. The struggle is to have a middleware that authenticate users.
Another provision is to have a billing system attactched to the api, so that we can build an ecommerce API.

= First

Go ahead to #link("https://docs.rs/axum/latest/axum/middleware/index.html")[axum middleware docs].

= Ordering
The ordering of the layers is from bottom to top. meaning that the last layer in the bottom, wraps all other one.

```rust
use axum::{routing::get, Router};

async fn handler() {}

let app = Router::new()
    .route("/", get(handler))
    .layer(layer_one)
    .layer(layer_two)
    .layer(layer_three);
```

That becomes:
```

        requests
           |
           v
+----- layer_three -----+
| +---- layer_two ----+ |
| | +-- layer_one --+ | |
| | |               | | |
| | |    handler    | | |
| | |               | | |
| | +-- layer_one --+ | |
| +---- layer_two ----+ |
+----- layer_three -----+
           |
           v
        responses
```

First layer gets request, does it things and pass it to layer two.

== Service Builder
To build modular middlewares, we use ServiceBuilder. that is `tower::ServiceBuilder`.
```rust
use axum::{
    routing::get,
    Extension,
    Router,
};
use tower_http::{trace::TraceLayer};
use tower::ServiceBuilder;

async fn handler() {}

#[derive(Clone)]
struct State {}

let app = Router::new()
    .route("/", get(handler))
    .layer(
        ServiceBuilder::new()
            .layer(TraceLayer::new_for_http())
            .layer(Extension(State {}))
    );

```


