module.exports = function(api) {
    var validEnv = ['development', 'test', 'production']
    var currentEnv = api.env()
    var isDevelopmentEnv = api.env('development')
    var isProductionEnv = api.env('production')
    var isTestEnv = api.env('test')

    if (!validEnv.includes(currentEnv)) {
        throw new Error(
            'Please specify a valid `NODE_ENV` or ' +
            '`BABEL_ENV` environment variables. Valid values are "development", ' +
            '"test", and "production". Instead, received: ' +
            JSON.stringify(currentEnv) +
            '.'
        )
    }

    return {
        presets: [
            isTestEnv && [
                '@babel/preset-env',
                {
                    targets: {
                        node: 'current'
                    }
                }
            ],
            (isProductionEnv || isDevelopmentEnv) && [
                '@babel/preset-env',
                {
                    forceAllTransforms: true,
                    modules: false,
                    exclude: ['transform-typeof-symbol']
                }
            ]
        ].filter(Boolean),
        plugins: [
            // Replaces useBuiltIns: 'entry' for development and production environments
            (isProductionEnv || isDevelopmentEnv) && [
                'babel-plugin-polyfill-corejs3',
                {
                    method: 'entry-global'
                }
            ],
            '@babel/plugin-transform-destructuring',
            ['@babel/plugin-transform-regenerator', { async: false }]
        ].filter(Boolean)
    }
}
