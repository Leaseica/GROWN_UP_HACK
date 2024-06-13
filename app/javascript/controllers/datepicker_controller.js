import { Controller } from "@hotwired/stimulus"

import flatpickr from "flatpickr";
// export default class extends Controller {

//   connect() {
//     flatpickr(this.element)
//   }
// }

export default class extends Controller {
  static targets = ["birthday"]

  connect() {
    flatpickr(this.birthdayTarget, {
      altInput: true,
      altFormat: "d/m/Y",
      dateFormat: "Y-m-d",

    // flatpickr(this.calendarTarget, {
    //   minDate: "today",
    //   dateFormat: "d/m/Y",
    //   altFormat: "d/m/Y",
    //   mode: "range",
    //   inline: true,
    //   onChange: (selectedDates) => {
    //     this.startTarget.value = selectedDates[0].toLocaleDateString();
    //     this.endTarget.value = selectedDates[1].toLocaleDateString();
    //   }
    })

  }

}
