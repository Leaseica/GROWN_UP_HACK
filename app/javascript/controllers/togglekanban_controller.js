import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="togglekanban"
export default class extends Controller {
  static targets = ["cards"]

  connect() {
    this.hideExcessCards();
  }

  fire(event) {
    event.preventDefault();
    let button = event.target;
    let container = this.cardsTargets.find(target => target.contains(button));

    if (container.style.maxHeight) {
      container.style.maxHeight = null;
      button.textContent = 'Voir plus';
    } else {
      container.style.maxHeight = '500px';
      button.textContent = 'Voir moins';
    }
  }

  hideExcessCards() {
    this.cardsTargets.forEach((container) => {
      container.style.maxHeight = '500px';
    });
  }
}
