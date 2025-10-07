const { env, generateWebpackConfig, merge } = require('shakapacker')
const { existsSync } = require('fs')
const { resolve } = require('path')

const webpackConfig = generateWebpackConfig()

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
  module: {
    rules: [
      {
        test: /\.css$/i,
        use: ["style-loader", "css-loader"],
      },
    ],
  },
}

module.exports = merge(envSpecificConfig, webpackConfig, customConfig)
