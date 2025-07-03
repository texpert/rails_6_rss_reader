/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/packs and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

import 'regenerator-runtime/runtime'
import "@hotwired/turbo-rails";

import '../src/js/bootstrap_custom.js'
import '../src/js/pagy.js.erb'
import fileUpload from '../src/js/fileUpload.js'

// if you are using turbo, listen on turbo:load instead
// listen on 'turbolinks:load' instead of 'DOMContentLoaded' if using Turbolinks
document.addEventListener(
  'turbo:load', () => { document.querySelectorAll('.upload-file').forEach(fileInput => { fileUpload(fileInput) }) }
)
