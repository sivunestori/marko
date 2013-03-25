marko
=====

Lightweight Sinatra app template for monk. 

Features
========

- Kube CSS framework http://imperavi.com/kube/
- Slim view templates http://slim-lang.com/
- Modular style application
- Cucumber BDD http://cukes.info/
- Sequel http://sequel.rubyforge.org/
- Webrat https://github.com/brynary/webrat
- Sinatra partials https://github.com/yb66/Sinatra-Partial

Licence
=======

It is licensed under the WTFPL license.
https://en.wikipedia.org/wiki/WTFPL

Installation
============
```sh
monk add marko https://github.com/sivunestori/marko.git
monk init -s marko your_app
cd your_app && bundle
bundle exec thin start -p 3000
```
Then open up http://localhost:3000/ in your browser.
