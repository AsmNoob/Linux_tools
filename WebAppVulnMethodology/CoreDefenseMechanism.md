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

All user input is untrusted
Anywhere on the applications
Bypass input validation

### Varieties of inputs

Some inputs can perform strict checks but by design some can't (posts, comments, etc)
This input then has to be stored in a db
This input might be written to a disk
This input might be displayedto other users

There is also data send from the server for the application which can be tampered with 

### Approaches to input handling

#### Reject known bad 

This means black listing.

This usually can be easily bypassed with trivial adjustments
blacklists on characters can usually be bypassed with non-std chars

- very often vuln to null byte attacks. They stop filters processing them but not stopping them from being executed.

#### Accept known good

this is whitelisting

This is the most effective method when possible. But even this can be suggest to exploit since some input can't avoid certain characters.

#### Sanitization

Sometimes we have to accept not safe input but sanitize it
Best option if data goes through multiple modules **Boundary validation**.

#### Safe data handling

Sometimes it's better to ensure the process through which the data goes is safe instead of validating the input.

#### Semantic checks

Sometimes the input submitted is valid but seeks to obtain non-wanted behavior.
This joins Access control validation.

### Boundary validation

Do not limit checks between server and the Internet.
Add validation at each module.
Between Internet and server
Between server and DB
Between server and Services
Etc

### Multistep Validation and Canonicalization

If multiple actions are performed on input then they could get bypassed if understood by the attacker.

Canonicalization(converting or decoding data into normal characters) is something to be aware of. Using double URL encoding then stripping, stripping then decoding and mixed with checks in between can be exploited and need to be tested.

%2527 -> %27 (double encoding)
%%2727 -> %27 (strip)
....\/ -> ../ (order)

Finding the steps is a big part of the game.

Some technologies perform best fitting:

« -> < 
ÿ -> y

This allows to smuggle characters/words.

Solution: recursively for each step perform sanitization.(we enter a loop)
Case by case is usually the better. Sometimes rejection is simply easier.

## Handling Attackers

When designing, have a mix of defensive and offensive options to frustrate the attacker.

- Handling errors
- Maintaining audit logs
- Alerting administrators
- Reacting to attacks

### Handling Errors

Errors will happen but are normally handled during test. But not everything can be tested -> handle errors gracefully. Never return any system error or debug msg to users.

### Maintaining audit logs

This is mainly to investigate intrusions.
Key events should be logged:
- authentication
- key transactions
- Blocked access attempts
- Any malicious activity

Have a system that only accepts update so logs do not get eraised.

### Alerting Administrators

The goal of the logs are to allow more reactive security from admins.

## Managing the application

Because apps needs to be administered this also creates a critical attack scope.- weak authentication
- not effective access control 
- admin functionality display data from users -> session compromise with priv
- admin functionality is often less tested for security

# Web application technologies

## Http

Page 45 for headers

### Http Authentication

- basic -> encoded base64 credentials
- NTLM -> challenge-response (windows NTLM proto)
- Digest -> challenge-response (md5 checksum of cred)

## Web Functionality

### Server-Side functionality
