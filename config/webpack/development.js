process.env.NODE_ENV = process.env.NODE_ENV || 'development'

const { merge } = require('webpack-merge')
const webpackConfig = require('./base')
const DashboardPlugin = require("webpack-dashboard/plugin")

module.exports = {
  plugins: [new DashboardPlugin(3001)]
}

module.exports = merge(webpackConfig)
