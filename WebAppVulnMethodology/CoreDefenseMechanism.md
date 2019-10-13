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

p 53-55 for specific applications for each languange

- Java
- ASP.NET
- PHP
- Ruby on Rails
- SQL
- XML
- Web services -> SOAP

### Client-side functionality

- HTML
- Hyperlinks
- Forms
- CSS
- Javascript
- VBScript
- Ajax
- JSON

### State and Sessions

## Encoding Schemes

### URL encoding

Way to transport characters over http
always encode space % ? & = ; + #

### Unicode encoding

encodes characters: %u\*\*\*\* hexa characters

### HTML encoding

encodes problematic characters

&quot;
&apos;
...

encodes any character

&#\*\*; ascii code

&#x\*\*; hex form

### Base64 encoding

Used to send any binary data only printable ascii characters. (used for email attachements or credentials)

### Hex encoding

Direct binary data encoded with hex.

### Remoting and Serialization frameworks
- Flex/AMF
- Silverlight and WCF
- Java serialized objects

# Mapping the application

## Enumerating
Starting points and simply
- manual browsing
- sitemap
- robots.txt

### Web Spidering
Burpsuite, WebScarab, Zed Attack Proxy, CAT

limitatioms:
- unusual navigation mechanisms
- buried links in flash or Java
- form limitations
- Because spiders stop when looping, problem if same paged is used to fetch content
- random parameters in the URL which result in infinite loop
- ability to handle authentication, can break
	- request for logout inadvertly
	- invalid input terminating session
	- per page tokens

CAREFUL: spiders can provoke a lot of damage
- if they discover and use sensitive funct (delete, shutdown, ...)

### User-directed Spidering

More sophisticated but provides more control: manual traffic tracked by proxy -> creating a map.

Advantages: 
- uses app functions naturally
- data validation is user controlled
- user can login again if anything ends in session termination
- any dangerous functionality will be parsed but can be chosen to be followed by the user.

Other tools:
HTTP and HTML analysis -> IEWatch (improves crawler capabilities)

#### Hacking process

1. Setup browser proxy
2. Browse the application
3. Review map and manually check pages discovered by spider
4. Use automated spider with everything already found but identify what is dangerous and exclude it.

### Discovering Hidden Content
List of possible hidden content:
- backup copies of live files (extension usually changed)
- backup archives
- new functionality in production not yet linked to the main app
- default app functionality hidden
- old version of files
- configuration and include files
- source files
- comments
- log files

### Bruteforce techniques

After the spidering, we can use the found map to bruteforce additional content
spider found : x.com/eis/auth/ -> bruteforce /x.com/eis/auth/XX with Intruder.

This will return response codes and length -> info to see if it is worth investigating.

#### Hacking Process
1. Make some manual request
2. Use the sitemap generated as a basis for hidden content
3. Bruteforce common files
4. Capture the responses from the server
5. Start again as new content gets discovered.

### Inference from published content

Finding patterns in the naming schemes to discover more hidden content
Examples: 
- eis/pub/media/110 -> we can try numbers
- eis/auth/ForgotPassword -> we can try to change function name &&Password in Intruder

#### Hacking Process
1. review user directed spider + basic bruteforce exercice
2. Look for naming schemes
3. Look for names/numbers/dates
4. Review all client-side code for hidden content (comments, forms, java applets and ActiveX cf chap15)
5. Add to the enum list any of the extensions of the files found (txt, bak, src, inc, old, java, cs, ...)
6. Look for temporary files (.DS\_Store, file.php~1 -> php file edited, .tmp)
7. Further automated exercices with directories, files, ...
8. Bruteforce on naming schemes by creating lists to bruteforce those schemes.
9. And now perform everything recursively 

Can be almost all be automated using Burp suite pro

Dirbuster is also really nice for content discovery.

### Use Public information

Search Engines and Web archives are amazing.

#### Hacking process
1. Use Search engines and archives to obtain data
2. Advanced search techniques 
- site:url -> Everything indexed is returned
- site:url term -> Adding terms refines results
- link:url -> all other pages with links to that page 
- related:url -> returns similar pages, a lot of irrelevat stuff but sometimes pages talk about it
3. searches in all the sections of goole (images, news, etc)
4. Go to the last page of search and run "Repeat search with omitted results"
5. View the cached version of interesting pages, including non present content
6. Perform the same queries on other domains from the same org. The goal is to identify old content that might still be accessible.

Another source:
1. Compile all names and emails
2. Use the same search techniques as above and try to find activity on forums from them.

### Leverage the Web Server

Take advantage of default content shipping with applications.
Use Wikto to find this information -> be careful of false negatives.
This is why Buro is usually a better tool for this.

#### Hacking step
When using Nikto
1. non-standard location -> --root /folder (or --Cgidirs for cgi-bin)
2. if custom file 404 which isn't 404 error code this can be identified with --404
3. No intelligent verification

### Application Pages Versus Functional Paths

Modern app structures don't follow all the same tree structure as what we are used.
Instead they use Rest like URL or single pages that serve all the content based on the parameters given.

#### Hacking process
1. Identify any app where you request content through parameters
2. Modify the automated techniques to work against the parameters
3. Try to map application content based on functional paths

### Discovering Hidden Paths

The app might behave differently if you find parameters such as debug=true (bypass access control etc)

1. Use a common list of debug parameters: debug, test, hide, source, etc with common values: true, false, 1, 0, yes, on,...
Make large requests to the app testing all combinations. 
Burp intruder + multiple payloads AND cluster bomb attack.
2. Monitor all responses for any anomaly
3. Target specific pages prone to debug work (login, search, uploads, downloads)

## Analyzing the application

Mapping is only one part
Also important is understanding Behavior, Functionality, Technologies ==> surface of attack.

Key areas to investigate:
- core functionality of the app
- peripheral app behavior (off-site links, error msg, admin and logging, redirects, ...)
- core security mechanisms (session state, access control, authentication and logic(registration, pass change and recovery).
- locations with user supplied processing
- client-side technologies (forms, java applets, javascript, cookies, ...)
- server side technologies (static vs dynamic pages, request types, SSL use, web server, db interaction, e-mail system, other back-end components)



