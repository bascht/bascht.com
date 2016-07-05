+++
date = "2016-07-05T12:42:58+02:00"
lang = "en"
title = "Access MongoDB Shell from docker"
+++

Sometimes it's the little things in life. For example trying to
connect to a MongoDB instance over and over again, without getting
attached to a proper shell.

```bash
$ docker run --rm --net=host mongo mongo mydb
MongoDB shell version: 3.2.7
connecting to: mydb
bye
```

So, before you end up like me – debugging things on the server side:
Check your docker parameters. You might be missing a `-ti` argument to
receive an interactive shell.

``` bash
$ docker run --rm -ti --net=host mongo mongo mydb
MongoDB shell version: 3.2.7
connecting to: mydb
type "help" for help
Welcome to the MongoDB shell.
For interactive help, type "help".
For more comprehensive documentation, see
        http://docs.mongodb.org/
Questions? Try the support group
        http://groups.google.com/group/mongodb-user
mydb:PRIMARY>
```

Well. Bummer.
