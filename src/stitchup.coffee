argv   = process.argv.slice(2)
stitch = require('stitch')
fs     = require('fs')
assert = require('assert')

argv = require('optimist')
    .usage('Usage: stitchup -s SOURCES [-o OUTFILE] [-m MODE]')
    .wrap(80)
    .option('outfile', {
        alias : 'o',
        desc : 'Write the stitched bundle to this file',
        default : __dirname + '/application.js',
    })
    .option('sources', {
        alias : 's',
        desc : 'paths to compile, eg ./lib',
        
    })
    .option('mode', {
        alias : 'm',
        desc : 'use -m DEVELOPMENT to compile uncompressed js',
        default : 'PRODUCTION'
    })
    .demand('sources')
    .argv

mode = argv.mode    
outfile = argv.outfile
sources = argv.sources

package = stitch.createPackage
  paths: [sources]


package.compile (err, source) ->
  assert.ok(source, 'Invalid source file given.')
  
  if mode isnt "DEVELOPMENT"
    jsp = require("uglify-js").parser;
    pro = require("uglify-js").uglify;
    ast = jsp.parse(source); # parse code and get the initial AST
    ast = pro.ast_mangle(ast); # get a new AST with mangled names
    ast = pro.ast_squeeze(ast); # get an AST with compression optimizations
    final_code = pro.gen_code(ast); # compressed code here
    source = final_code

  fs.writeFile outfile, source, (err) ->
    if (err)
      throw err
    
    console.log 'Compiled ' + outfile + '.'
