// Import and register all your controllers from the importmap under controllers/**/*
import { application } from "controllers/application"

// Register all controllers in this directory (Stimulus setup)
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
eagerLoadControllersFrom("controllers", application)
