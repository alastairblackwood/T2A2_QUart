const { environment } = require('@rails/webpacker')

const webpack = require('webpack')

environment.plugins.append('Provide',
    new webpack.ProvidePlugin({
        $: 'jQuery',
        jQuery: 'jQuery',
        Popper: ['popper.js', 'default'] // Do not include for Rails 6.1.x
    })
)

module.exports = environment
