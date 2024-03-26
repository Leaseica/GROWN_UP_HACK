import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["step0", "step1", "step2", "menustep0", "menustep1", "menustep2"];

  current_step = 0

  connect() {
    console.log("hello")
  }

  next() {
    this.goToStep(this.current_step + 1)
  }

  previous() {
    this.goToStep(this.current_step - 1)
  }

  goToStep_0() { this.goToStep(0) }
  goToStep_1() { this.goToStep(1) }
  goToStep_2() { this.goToStep(2) }

  goToStep(new_step) {
    const stepTargets = [
      this.step0Target,
      this.step1Target,
      this.step2Target,
    ]
    const menustepTargets = [
      this.menustep0Target,
      this.menustep1Target,
      this.menustep2Target,
    ]
    if(new_step >= 0 && new_step < stepTargets.length) {
      if(new_step != this.current_step) {

        stepTargets[this.current_step].classList.toggle("d-none");
        menustepTargets[this.current_step].classList.toggle("current");

        stepTargets[new_step].classList.toggle("d-none");
        menustepTargets[new_step].classList.toggle("current");
        this.current_step = new_step
      }
    }
  }


  toggleForm(event) {
    this.formTarget.classList.toggle("d-none");
  }
}
