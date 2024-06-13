import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["step", "menuStep", "icon"];

  initialize() {
    // Initialize the current step based on visibility at the start.
    this.currentStep = this.stepTargets.findIndex((step) => !step.classList.contains("d-none"));
    if (this.currentStep === -1) {
      this.currentStep = 0; // Default to the first step if none are visible.
    }
  }

  connect() {
    this.displayStep(this.currentStep); // Ensure the correct step is displayed when connected.
  }

  next() {
    if (this.currentStep < this.stepTargets.length - 1) {
      this.currentStep++;
      this.displayStep(this.currentStep);
    }
  }

  previous() {
    if (this.currentStep > 0) {
      this.currentStep--;
      this.displayStep(this.currentStep);
    }
  }

  menuStepClick(event) {
    const index = this.menuStepTargets.indexOf(event.currentTarget);
    if (index !== -1 && index !== this.currentStep) {
      this.currentStep = index;
      this.displayStep(this.currentStep);
    }
  }

  displayStep(index) {
    // Update the display for each step
    // Initialize the menu steps
    this.menuStepTargets.forEach((menuStep, idx) => {
      if (idx < this.currentStep) {
        menuStep.classList.add("done");
        menuStep.classList.remove("active");
        menuStep.classList.remove("notstarted");
        this.iconTargets[idx].classList.add("completed");
        this.iconTargets[idx].classList.remove("active");
        this.iconTargets[idx].classList.remove("notstarted");
        this.iconTargets[idx].innerHTML = ''; // Add check icon
        this.stepTargets[idx].classList.add("d-none");
      } else if (idx === this.currentStep) {
        menuStep.classList.add("active");
        menuStep.classList.remove("done");
        menuStep.classList.remove("notstarted");
        this.iconTargets[idx].classList.add("active");
        this.iconTargets[idx].innerHTML = `${idx + 1}`;
      }

      if (idx > this.currentStep) {
        menuStep.classList.remove("done");
        menuStep.classList.remove("active");
        this.iconTargets[idx].classList.remove("completed");
        this.iconTargets[idx].classList.add("notstarted")
        this.iconTargets[idx].innerHTML = `${idx + 1}`;
        this.stepTargets[idx].classList.add("d-none");
      }
    });
    this.stepTargets.forEach((step, idx) => {
      if (idx === index) {
        step.classList.remove("d-none");
        this.menuStepTargets[idx].classList.add("active");
        this.iconTargets[idx].classList.remove("notstarted");
        this.iconTargets[idx].classList.remove("completed");
        this.iconTargets[idx].classList.add("active");
        this.iconTargets[idx].innerHTML = `${idx + 1}`;
      }
    });
  }
}
