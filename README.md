rainbowed
=========

Password-strength detector by searching the Web for a password's md5 hash.

Why?
----

The md5 hashes for common words and passwords appear in rainbow-dictionnaries
all over the internet.
If your password's MD5 hash appears in a Google search, you can tell it's
a bad one.


Command line usage
------------------

```sh
$ ruby -Ilib bin/rainbowed your_password
```

Example
-------

```sh
$ ruby -Ilib bin/rainbowed mypassword1
Searching for 0d28e4080dc8f64fc9603639bb7aa1b9…
Found! Do not use this as a password. Ever.

$ ruby -Ilib bin/rainbowed p4ssw0rd
Searching for 2a9d119df47ff993b662a8ef36f9ea20…
Found! Do not use this as a password. Ever.

$ ruby -Ilib bin/rainbowed mustang99
Searching for f0244ee97c7e4cfeae67c04e0b09fa26…
Found! Do not use this as a password. Ever.

$ ruby -Ilib bin/rainbowed 'asdfasdf123!'
Searching for 36b19d757e52917f32bc39afd5d1dcad…
Found! Do not use this as a password. Ever.

$ ruby -Ilib bin/rainbowed JumpToTheSkyAndStartToFly
Searching for 6f82cade2402165ffb1634714743cfe5…
Not found. This password looks ok.
```


Install
-------

You need to pick between using Bing or Google to search the Web.

### Bing

Create an account with the
[Bing Search API](https://datamarket.azure.com/dataset/bing/search).

Then copy your [account key](https://datamarket.azure.com/account/keys) into
a `.env` file:

    BING_API_KEY=EihJlbarSpam9/fooQipB…60UfD5h8GQaAsVGorwmS/Q32

### Google

You will need a Google API Key and you will also need to create a
Google Custom Search Engine configured to searches on the whole internet.
Check out [google_custom_search_api](https://github.com/wiseleyb/google_custom_search_api#configure)'s
documentation on how to do that.

Once you have your API key and your search engine identifier,
paste them to a `.env` file:

    GOOGLE_API_KEY=AIzaSyAcvLleVT…gm6lgtrSI6-fyUH6nblB4Gk
    GOOGLE_SEARCH_CX=007591921337611290981:w899u…2w89yg
