const { resolve } = require('path')

module.exports = {
  mode: "production",
  entry: './src/app/index.ts',
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
    filename: 'app.js',
    path: resolve('./dist/app')
  },
  node: {
    fs: 'empty'
  }
}
