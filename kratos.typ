#import "/book.typ": book-page
#show: book-page.with(title: "Hello, typst")

To be able to use kratos in our API, we have to have an understanding about the inner workings of it. Also we should be familiar with the workflows of kratos to properly use it as authentication management in our apps.

= Official Examples

refer to #link("https://www.ory.com/docs/getting-started/overview")[link]
generally three environment variables are required to configure our api, That are:
#figure(
  [
+ `KRATOS_PUBLIC_URL`
+ `KRATOS_BROWSER_URL`
+ `KRATOS_ADMIN_URL`
],
caption: [address of: 1. kratos service 2. our website.
 ])

#figure(
  [
  + `ORY_SDK_URL` optional
  + `COOKIE_SECRET`
  + `CSRF_COOKIE_NAME`
  + `CSRF_COOKIE_SECRET` optional
],
caption: [additional env configs for OAuth2 ])

Below is the Guide from different API/WEB frameworks
= #link("https://github.com/ory/kratos-selfservice-ui-node")[Express]
from official Documentations of express #link("https://expressjs.com/en/guide/using-middleware.html")[middleware]s can:
- Execute any code.
- Make changes to the request and the response objects.
- End the request-response cycle.
- Call the next middleware function in the stack.

#quote(attribution: [express docs])[Bind application-level middleware to an instance of the app object by using the app.use() and app.METHOD() functions, where METHOD is the HTTP method of the request that the middleware function handles (such as GET, PUT, or POST) in lowercase.]

as explained above, the expressjs app uses #link("https://github.com/ory/kratos-selfservice-ui-node/blob/d29d1071fc19fcf856a0c7b40d296748c0136904/src/index.ts#L69")[kratos middleware] by `app.use()` method. Then in the middleware code we use #link("https://github.com/ory/kratos-selfservice-ui-node/blob/d29d1071fc19fcf856a0c7b40d296748c0136904/src/pkg/middleware.ts#L5")[Session]. We Use #link("https://github.com/ory/kratos-selfservice-ui-node/blob/d29d1071fc19fcf856a0c7b40d296748c0136904/src/pkg/middleware.ts#L8")[axios] to interact with kratos API.