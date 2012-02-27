argv   = process.argv.slice(2)
stitch = require('stitch')
fs     = require('fs')
assert = require('assert')

argv = require('optimist')
  .usage('Usage: stitchme [-o OUTFILE] SOURCES')
  .wrap(80)
  .option('outfile',
    alias:   'o'
    desc:    'Write the stitched bundle to this file'
    default: 'app.js'
  )
  .demand(1)
  .argv

mode    = argv.mode
outfile = argv.outfile
sources = argv._

package = stitch.createPackage
  paths: sources

package.compile (err, source) ->
  assert.ok(source, 'Invalid source file given.')

  fs.writeFile outfile, source, (err) ->
    throw err if err
    console.log 'Compiled ' + outfile + '.'
