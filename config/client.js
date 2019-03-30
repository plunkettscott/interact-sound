const { resolve } = require('path')

module.exports = {
  target: 'node',
  mode: "production",
  entry: './src/client/index.ts',
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
    filename: 'client.js',
    path: resolve('./dist')
  },
  node: {
    fs: 'empty'
  }
}
