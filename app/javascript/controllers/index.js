import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus = application

export { application }

// Register all controllers in this directory (Stimulus setup)
import { definitionsFromContext } from "@hotwired/stimulus-webpack-helpers"
const context = require.context(".", true, /\.js$/)
application.load(definitionsFromContext(context))
