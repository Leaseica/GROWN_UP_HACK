


import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["togglableElement"];

  connect() {
    console.log("Hello from toggle_controller.js");

    // Récupérez tous les toggles du même groupe
    const group = this.element.closest('.toggle-group');
    const buttons = group.querySelectorAll('[data-action="click->toggle#fire"]');

    // Attachez un gestionnaire d'événements à chaque bouton
    buttons.forEach(button => {
      button.addEventListener('click', () => {
        // Fermez tous les autres toggles du groupe
        buttons.forEach(otherButton => {
          if (otherButton !== button) {
            const toggleTarget = otherButton.nextElementSibling;
            if (toggleTarget.classList.contains('d-none')) {
              return;
            }
            toggleTarget.classList.add('d-none');
          }
        });
      });
    });
  }

  fire() {
    this.togglableElementTarget.classList.toggle("d-none");
  }
}
