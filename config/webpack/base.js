const webpack = require('webpack');
const { webpackConfig, merge } = require('@rails/webpacker')

module.exports = {
  plugins: [
    new webpack.ProvidePlugin({ $: 'jquery/src/jquery',
                                jQuery: 'jquery/src/jquery',
                                'window.jQuery': 'jquery/src/jquery',
                                'window.$': 'jquery/src/jquery' })
  ],
}

const customConfig = {
  resolve: {
    extensions: ['.css']
  }
}

module.exports = merge(webpackConfig, customConfig)
