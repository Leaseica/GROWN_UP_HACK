// app/javascript/controllers/edit_status_controller.js
import { Controller } from "@hotwired/stimulus"


export default class extends Controller {
  static targets = ["infos", "form", "card"]

  displayForm() {
    this.infosTarget.classList.add("d-none")
    this.formTarget.classList.remove("d-none")
  }

  update(event) {
    event.preventDefault()
    const url = this.formTarget.action
    fetch(url, {
      method: "PATCH",
      headers: { "Accept": "text/plain" },
      body: new FormData(this.formTarget)
    })
      .then(response => response.text())
      .then((data) => {
        this.cardTarget.outerHTML = data
      })
  }
}

// import { Controller } from "@hotwired/stimulus"

// export default class extends Controller {
//   static targets = [ "status", "form", "card" ]

//   connect() {
//     console.log(this.statusTarget);
//     console.log(this.formTarget);
//     console.log(this.cardTarget);
//     console.log("Edit Status Controller connected");
//   }

//   displayForm() {
//     this.statusTarget.classList.add('d-none');
//     this.formTarget.classList.remove('d-none');
//   }

//   update(event) {
//     event.preventDefault();
//     const url = this.formTarget.action
//     const formData = new FormData(this.formTarget);
//     fetch(url, {
//       method: 'PATCH',
//       headers: { 'Accept': 'text/html' },
//       body: formData
//     })
//     .then(response => response.json())
//     .then(data => {
//       if (data.success) {
//         // Assuming 'data.column' is the new status column ('todo', 'in-progress', or 'done')
//         const newColumn = document.querySelector(`.kanban-column.${data.column} .kanban-tasks`);
//         newColumn.innerHTML += data.reminderHTML; // Assuming 'data.reminderHTML' is the updated reminder HTML
//         this.cardTarget.remove(); // Remove the original reminder card
//       } else {
//         console.error("Failed to update reminder status");
//       }
//     })
//     .catch(error => console.error("Error:", error));
//   }

// }
