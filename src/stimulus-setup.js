import { Application } from "@hotwired/stimulus"
import { definitionsFromContext } from "@hotwired/stimulus-webpack-helpers"

// Initialize Stimulus application
const application = Application.start()

// Configure Stimulus controllers from a context
const context = require.context("./controllers", true, /\.js$/)
application.load(definitionsFromContext(context))

export { application }
