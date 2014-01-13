fs = require "fs"
path = require "path"
handlebars = require "handlebars"
walk = require "../walk"

mkdir = (path) ->
  if !fs.existsSync(path)
    fs.mkdirSync(path)

globalize = (resDir, srcDir, destDir) ->

  resFiles = fs.readdirSync resDir

  srcFilesPaths =  walk srcDir

  for resFile in resFiles

    resBaseName = path.basename(resFile, '.json')

    resFilePath = path.join resDir, resFile

    resDataStr = fs.readFileSync resFilePath

    resData = JSON.parse(resDataStr)

    for srcFilePath in srcFilesPaths

      #console.log srcFilePath

      templateFile = fs.readFileSync srcFilePath, 'utf8'

      template = handlebars.compile templateFile

      html = template(resData)

      destDirPath = path.join destDir, resBaseName , path.relative(srcDir, path.dirname(srcFilePath))

      srcFileName =  path.basename srcFilePath

      destFilePath = path.join(destDirPath, srcFileName)

      #console.log destDirPath, destFilePath

      mkdir destDirPath

      fs.writeFileSync destFilePath,  html

module.exports = (grunt) ->

  grunt.registerMultiTask 'globalize-html', 'Plugin to globalize html files, using handlebars templates and resources stored in .json files', ->

    opts = grunt.config('globalize-html.build')

    globalize opts.resDir, opts.srcDir, opts.destDir

    grunt.log.writeln 'HTMLs were globalized'


