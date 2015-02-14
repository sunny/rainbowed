rainbowed
=========

Password-strength detector by searching the Web for a password's md5 hash.

Why?
----

The md5 hashes for common words and passwords appear in rainbow-dictionnaries all over the internet.
If your password's MD5 hash appears in a Google search, you can tell it's a bad one.


Install
-------

You need a Google Api Key. You also need to create a Google Custom Search
Engine that searches for the whole internet.
Check out [google_custom_search_api](https://github.com/wiseleyb/google_custom_search_api#configure)'s
documentation on how to do that.

```sh
$ gem install google_custom_search_api
```

Command line usage
------------------

```sh
$ export GOOGLE_API_KEY="…"      # your Google API Key
$ export GOOGLE_SEARCH_CX="…"    # your Google Custom Search Engine identifier
$ ruby -Ilib bin/rainbowed YOUR_PASSWORD
```
