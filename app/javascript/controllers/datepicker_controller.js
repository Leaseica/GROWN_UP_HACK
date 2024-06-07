import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"; // You need to import this to use new flatpickr()


export default class extends Controller {
  static targets = ["birthday"]
  connect() {
    flatpickr(this.birthdayTarget, {
      dateFormat: "d/m/Y",
      altFormat: "d/m/Y",
      altInput: true,

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
