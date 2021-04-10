process.env.NODE_ENV = process.env.NODE_ENV || 'development'

const webpackConfig = require('./base')

const { merge } = require('webpack-merge')
const DashboardPlugin = require("webpack-dashboard/plugin")

module.exports = merge(webpackConfig, {
  plugins: [new DashboardPlugin()],
})
