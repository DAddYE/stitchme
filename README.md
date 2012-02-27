# Browser-side require() for CommonJS modules

Easily use Javascript & Coffeescript CommonJS modules in the browser using this handy commandline tool, even for non-NodeJS projects.

A directory of [CommonJS modules](http://wiki.commonjs.org/wiki/Modules/1.0) is minified into a single javascript file,
and each module can be exposed on demand in the browser via synchronous `require()`.

Stitchme wraps the amazing stitch library https://github.com/sstephenson/stitch.

Thanks heaps @sstephenson.
Thanks hepas @timoxley (original author).


## Installation
    $ npm install -g stitchme

## Usage

#### Stitch up CommonJS modules located in `app` to `public/bundle.js`

    $ stitchme -o public/bundle.js app

#### Compile in development (uncompressed) mode

    $ stitchme -o public/bundle.js -m DEVELOPMENT

### Load modules via synchronous require()

    # Stitch up modules in the ./app directory as ./public/bundle.js:
    $ stitchme -o ./public/bundle.js ./app

    # Load the bundle on your website:
    <script src="/bundle.js"></script>
    <script>
        $(function() {
            var app = require('controllers/app');
            app.init();
        })
    </script>

    # Use require() to reference modules from modules:
    module.exports = {
        init: function() {
            var myCar = require('models/cars');
            myCar.drive();
        }
    }

## About me

DAddYE, you can follow me on twitter [@daddye](http://twitter.com/daddye) or take a look at my site [daddye.it](http://www.daddye.it)

## Copyright

Copyright (C) 2011 Davide D'Agostino - [@daddye](http://twitter.com/daddye)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and
associated documentation files (the “Software”), to deal in the Software without restriction, including without
limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software,
and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM,
DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
