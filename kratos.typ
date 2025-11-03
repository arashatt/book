#import "/book.typ": book-page
#show: book-page.with(title: "Hello, typst")

Kratos is an opensource solution to handle user authentication: Register, Login being the obvious examples. To be able to use Kratos in our API, we should be familiar with the workflows of Kratos to properly use it as authentication management in our apps. There are some official examples that integrate Kratos in applications.

= General Info
Generally three environment variables are required to configure our api, That are:
#figure(
  [
+ `KRATOS_PUBLIC_URL`
+ `KRATOS_BROWSER_URL`
+ `KRATOS_ADMIN_URL`
],
caption: [address of: 1. Kratos service 2. our website.
 ])

#figure(
  [
  + `ORY_SDK_URL` optional
  + `COOKIE_SECRET`
  + `CSRF_COOKIE_NAME`
  + `CSRF_COOKIE_SECRET` optional
],
caption: [additional env configs for OAuth2 ])

= Official Examples

Please refer to #link("https://www.ory.com/docs/getting-started/overview")[link] to see these examples.

= #link("https://github.com/ory/kratos-selfservice-ui-node")[Express]
from official Documentations of express #link("https://expressjs.com/en/guide/using-middleware.html")[middleware]s can:
- Execute any code.
- Make changes to the request and the response objects.
- End the request-response cycle.
- Call the next middleware function in the stack.

#quote(attribution: [express docs])[Bind application-level middleware to an instance of the app object by using the app.use() and app.METHOD() functions, where METHOD is the HTTP method of the request that the middleware function handles (such as GET, PUT, or POST) in lowercase.] the requirement for a middleware is to have (req, res, next). 

as explained above, the expressjs app uses #link("https://github.com/ory/kratos-selfservice-ui-node/blob/d29d1071fc19fcf856a0c7b40d296748c0136904/src/index.ts#L69")[Kratos middleware] by `app.use()` method. Then in the middleware code we use #link("https://github.com/ory/kratos-selfservice-ui-node/blob/d29d1071fc19fcf856a0c7b40d296748c0136904/src/pkg/middleware.ts#L5")[Session]. We use #link("https://github.com/ory/kratos-selfservice-ui-node/blob/d29d1071fc19fcf856a0c7b40d296748c0136904/src/pkg/middleware.ts#L8")[axios] to interact with Kratos API.







= Final Notes
One questions that remains is how to store sessions when our application isn't being run in browser like CLI tools that require their users to authenticate.