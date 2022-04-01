const webpack = require('webpack');
const { env, webpackConfig, merge } = require('shakapacker')
const { existsSync } = require('fs')
const { resolve } = require('path')

const envSpecificConfig = () => {
  const path = resolve(__dirname, `${env.nodeEnv}.js`)
  if (existsSync(path)) {
    console.log(`Loading ENV specific webpack configuration file ${path}`)
    return require(path)
  } else {
    // Probably an error if the file for the NODE_ENV does not exist
    throw new Error(`Got Error with NODE_ENV = ${env.nodeEnv}`);
  }
}

const customConfig = {
  resolve: {
    extensions: ['.css']
  }
}

module.exports = {
  plugins: [
    new webpack.ProvidePlugin({ $: 'jquery/src/jquery',
                                jQuery: 'jquery/src/jquery',
                                'window.jQuery': 'jquery/src/jquery',
                                'window.$': 'jquery/src/jquery' })
  ],
}

module.exports = merge(envSpecificConfig, webpackConfig, customConfig)
