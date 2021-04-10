process.env.NODE_ENV = process.env.NODE_ENV || 'development'

const { merge } = require('webpack-merge')
const webpackConfig = require('./base')
const DashboardPlugin = require("webpack-dashboard/plugin")

module.exports = {
  plugins: [new DashboardPlugin({ port: 3035 })]
}

module.exports = merge(webpackConfig)
