# Login Function

This project using MVC patern and [GetX](https://pub.dev/packages/get#getview) package to manage state and routes

## What does this Login function currently do?

When the user presses the Login button, this app will do 2 things
1. Confirm that userName and password contain at least 6 characters.
2. Connect to the api "http://login.vnopenlab.com/oauth2/token" to get the Access Token (user credential mode)

If 2 conditions above is satisfied, the app is navigated to the Home screen

