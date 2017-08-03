# **Welcome to ServiceDesignKIT**

Welcome to ServiceDesignKIT!

ServiceDesignKIT was developed by Erwin Leung as a research project in coorporation with the research group "Information Systems & Service Design" from the Institute of Information Systems and Marketing (IISM) of Karlsruhe Institute of Technology (KIT).

The goal of the project is to help design professionals and design novices in the selection process of design techniques.

The app was built on **Ruby on Rails** in combination with **ReactJS** and **Material-UI** and with no or little prior knowledge to those. 

If your keen to gain new skills in those mentioned programming-languages, frameworks, get started by following the install section. You can submit issues, make branches or submit pull requests...let's learn together by improving this project!

## Useful Links

* [Application](https://servicedesignkit.herokuapp.com/)

* [Freecodecamp](https://www.freecodecamp.org/)

* [Ruby on Rails Tutorial](https://www.railstutorial.org/book)

* [React](https://facebook.github.io/react/tutorial/tutorial.html)

* [React on Rails](https://github.com/shakacode/react_on_rails)

* [Material-UI](http://www.material-ui.com/#/)

# Lets Get Started!

**1. Install Homebrew**

Homebrew allows us to install and compile software packages easily from source.

Run the following command in the Terminal. When it asks you to install Xcode CommandLine Tools, say yes

```ruby -e “$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)”```

**2. Instal Ruby**

```
brew install rbenv ruby-build
```

Add rbenv to bash so that it loads every time you open a Terminal

```
echo ‘if which rbenv > /dev/null; then eval “$(rbenv init -)”; fi’ >> ~/.bash_profile
source ~/.bash_profile
```

Install Ruby 2.3.0 which is required by the app:

```
rbenv install 2.3.0
rbenv global 2.3.0
ruby -v
```

**3. Install Rails**

Installing Rails is really simple:

```
gem install rails -v 4.2.4
rbenv rehash
rails -v
```


**4. Install PostgreSQL**

```
brew install postgresql
```

Make sure to follow those instructions of the build notes.

If your installing PostgreSQL for the first time create a database:

```
initdb /usr/local/var/postgres -E utf8
```

Lunchy is a helpful gem that will allow you to easily start and stop Postgres.

```
gem install lunchy
```

Change the version number of PostgreSQL to the version that you installed:

```
mkdir -p ~/Library/LaunchAgents
cp /usr/local/Cellar/postgresql/0.0.0/homebrew.mxcl.postgresql.plist ~/Library/LaunchAgents/
```

To Stop PostgreSQL run:
```
lunchy stop postgres
```

We want it to start PostgreSQL, so instead run:
```
lunchy start postgres
```

**4.Install React on Rails**

**For more detailed instructions**, see the [React on Rails Basic Tutorial](docs/tutorial.md).

1. Add the following to your Gemfile and `bundle install`. We recommend fixing the version of React on Rails, as you will need to keep the exact version in sync with the version in your `client/package.json` file.

  ```ruby
  gem "react_on_rails", "8.0.0"
  ```

2. Commit this to git (you cannot run the generator unless you do this or pass the option `--ignore-warnings`).

3. See help for the generator:

  ```bash
  rails generate react_on_rails:install --help
  ```

4. Run the generator with a simple "Hello World" example (more options below):

  ```bash
  rails generate react_on_rails:install
  ```

5. Bundle and NPM install. Make sure you are on a recent version of node. Please use at least Node v5. Bundle is for adding execJs. You can remove that if you are sure you will not server render.

  ```bash
  bundle && yarn
  ```

6. Ensure that you have `foreman` installed: `gem install foreman`.

7. Start your Rails server:

  ```bash
  foreman start -f Procfile.dev
  ```

8. Visit [localhost:3000/hello_world](http://localhost:3000/hello_world). Note, `foreman` defaults to PORT 5000 unless you set the value of PORT in your environment. For example, you can `export PORT=3000` to use the Rails default port of 3000. For the hello_world example this is already set.

**5.Install Material-UI**

1. Run

 ```bash
  npm install material-ui
  ```

And go to [Material-UI] (https://github.com/callemall/material-ui)for further information on how to import the components. 



# License


ServiceDesignKIT is released unter MIT License | Copyright (c) 2017 Erwin Leung

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.