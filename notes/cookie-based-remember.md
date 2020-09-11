# Cookie based "Remember Me" in PHP
## Its super easy! Its all about storing a cookie with more time like an year or so.
1. Implement a login page with remember_me check box.
2. Encrypt and store the username in a cookie
3. Check if cookie exist and redict user!

code_samples

```php
# login page
if(isset($_POST["remember"])) ck_set();

# cookie set function
function ck_set(){ setcookie("bosstime",$_SESSION['uid'],time()+31556926); }

# Before any page loads
if(isset($_COOKIE['bosstime'])) $_SESSION['uid'] = $_COOKIE['bosstime'];
# uid stands for username in my code
```

Clearning cookie by reversing the time wont work for that specific instance its still accessible from ``` $_COOKIE['bosstime'] ```. So delete it by using unset function like this.

```php
setcookie("bosstime","",time()-31556926);
unset($_COOKIE['timeboss']);
```

## DB based way of doing it!
1. Store a cookie with some random value on the DB and local too.
2. Cross check with next login.
3. EASY!

code_samples

```php
setcookie('remembering', bin2hex(random_bytes(50)), time() + 31556926);
exequery('update users set log=? where username=?', "ss", $_COOKIE['remembering'], $_SESSION['uid']);
```

Checking cookie

```php
$requests = exequery('select log from users where username = ?', 's', $_COOKIE['bosstime']);
$row = mysqli_fetch_array($requests);
if ($row[0] == $_COOKIE['remembering']) $_SESSION['uid'] = $_COOKIE['bosstime'];
```