import { Controller } from "@hotwired/stimulus"
// Used for the button "Voir plus" in the kanban

export default class extends Controller {
  static targets = ["togglableElement"]

  connect() {
    console.log("Hello from toggle_controller.js")
  }

  fire() {
    this.togglableElementTarget.classList.toggle("d-none");
  }
}
