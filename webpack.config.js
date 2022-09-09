const path = require('path');
// const BrowserSyncPlugin = require('browser-sync-webpack-plugin')

module.exports = {
  target: "web",
  entry: './frontend/mytable.jsx',
  output: {
    path: path.resolve(__dirname, 'app', 'assets', 'javascripts'),
    filename: 'bundle.js',
    sourceMapFilename: 'bundle.js.map',
  },

  
  
  module: {
    
    // loaders: 'babel-loader',
    rules: [
      {
        test: [/\.js?$/, /\.jsx?$/, /\.(jpg|png|svg)$/], 
        exclude: /(node_modules)/,
        use: {
          loader: 'babel-loader',
          options: {
            presets: ['@babel/env', '@babel/react']
          }
        }
      },
      {
        test: /\.css$/i,
        use: ["style-loader", "css-loader", "sass-loader"],
      },
    ]
  },
  devtool: 'source-map',
  // devServer: {
  //   contentBase: 'public',
  //   watchContentBase: true,
  //   hot: true,
  // },
  resolve: {
    extensions: ['', '.js', '.jsx', '*', '.png', '.css'],
  },

  devServer: {
    before(app, server) {
      server._watch(`src/*/**.html`);
    },
    contentBase: path.join(__dirname, 'src'),
    watchContentBase: true,
    hot: true,
  }
};


