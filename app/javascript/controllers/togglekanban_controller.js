import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["togglableElement"]

  connect() {
    console.log("Hello from toggle_controller.js")
  }

  fire() {
    this.togglableElementTarget.classList.toggle("d-none");
    // const targetId = event.currentTarget.getAttribute('data-toggle-target');
    // const targetElement = document.getElementById(targetId);
    // targetElement.classList.toggle('d-none');
  }
}


// // Connects to data-controller="togglekanban"
// export default class extends Controller {
//   static targets = ["more"]

//   connect() {
//     this.hideExcessmore();
//   }

//   fire(event) {
//     event.preventDefault();
//     let button = event.target;
//     let container = this.moreTargets.find(target => target.contains(button));

//     if (container.style.maxHeight) {
//       container.style.maxHeight = null;
//       button.textContent = 'Voir plus';
//     } else {
//       container.style.maxHeight = '500px';
//       button.textContent = 'Voir moins';
//     }
//   }

//   hideExcessCards() {
//     this.moreTargets.forEach((container) => {
//       container.style.maxHeight = '500px';
//     });
//   }
// }
