Globalize HTML files.
=====================

Globalize html files using hadlebars templates and resources, stored in .json files

## Installation

+ install [Grunt](http://gruntjs.com/)
+ inspall plugin
    ```shell
        npm install grunt-baio-globalize-html --save-dev
    ```
+ configure (see example bellow)

## Grunt Options

```js
{
    'globalize-html' : {
        build : {
            srcDir : 'source directory',
            resDir : 'resources directory',
            destDir : 'destination directory'
        }
    }
}
```

+ source directory - directory with globalized html files
+ resource directory - directory with resource files (in json format)
+ dest directory - directory where globalized files placed

## Example

### Project Structure

```
    +
    |
    +---+views
        |
        +---+src
        |   |
        |   +---index.html
        |
        +---+res
            |
            +---en-EN.json
```

### index.html (handlebars template)

```html
    <body>
        <h1>{{MAIN_TITLE}}</h1>
    </body>
```

### en-EN.json (string resources)

```js
    {
        "MAIN_TITLE" : "Hello world"
    }
```

### Grunt config

```js

  grunt.initConfig({
      'globalize-html': {
        build: {
          resDir : "views/res",
          srcDir : "views/src",
          destDir : "views"
          }
        }
      });

  grunt.loadNpmTasks('grunt-baio-globalize-html');

  grunt.registerTask('default', ['globalize-html']);
```

### Output

Globalized files will be placed in directory `views/en-EN`
Full path to the output directory composed from `destDir` path and name of the resource file (in case of the example `en-EN`)

#### Globalized file

```html
    <body>
        <h1>Hello world</h1>
    </body>
```

