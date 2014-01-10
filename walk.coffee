fs = require('fs')

walk = (dir) ->

  results = [];

  list = fs.readdirSync(dir)

  for file in list

    file = dir + '/' + file

    stat = fs.statSync file

    if stat and stat.isDirectory()

      res = walk(file)

      results = results.concat(res)

    else

      results.push(file);

  results

module.exports = walk;