# Core fundamentals

- Handling User access
- Handling User input
- Handling Attacker
- Administer the application

## Handling user access

- Authentication
- Session management
- Access Control

### Authentication

This impplies a couple of things:
- user needs to show who he is
- no authentication -> all users have the lowest 

The autentication will be translated into a login page:
- guessing users and password will be the game
- bypass login function by exploiting logic 

### Session management

Application needs a way to identify uniquely the user sending the requests from all the other requests. All webApps use tokens to track the sessions.
The token itself is usually a data structure to track the state of the user.
- Cookies
- URL query string
- hidden form fields
- sessions expire after a while

Weaknesses
- how is the token generated
- how are tokens handled (can they be stolen?)

### Access Control

How to limit access:
- Roles and privileges

Exploitation:
- flawed idea that users will behave a certain way
- laborious checks for each functionality need to be performed (can be automated)

## Handling user input
