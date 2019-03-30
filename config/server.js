const { resolve } = require('path')

module.exports = {
  target: 'node',
  mode: "production",
  entry: './src/server/index.ts',
  module: {
    rules: [{
      test: /\.tsx?$/,
      use: 'ts-loader',
      exclude: /node_modules/
    }]
  },
  resolve: {
    extensions: ['.tsx', '.ts', '.js']
  },
  output: {
    filename: 'server.js',
    path: resolve('./dist')
  },
  node: {
    fs: 'empty'
  }
}
