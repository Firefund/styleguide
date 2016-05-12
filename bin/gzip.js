#!/usr/bin/env node

const zlib = require('zlib')
const gzip = zlib.createGzip()

// const Transform = require("stream").Transform

process.stdin.resume()
process.stdin.setEncoding('utf8')
// process.stdin.on("data", data => {
// 	process.stdout.write(data)
// })
// process.stdin.pipe(process.stdout)
process.stdin.pipe(gzip).pipe(process.stdout)