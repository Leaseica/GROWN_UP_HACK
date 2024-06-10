// import { Controller } from "@hotwired/stimulus"

// export default class extends Controller {
//   static targets = ["step0", "step1", "step2", "menuStep", "menustep1", "menustep2", "icon"];

//   current_step = 0

//   connect() {
//     console.log("hello")
//   }



//   next() {
//     this.goToStep(this.current_step + 1)

//   }

//   previous() {
//     this.goToStep(this.current_step - 1)

//   }

//   goToStep_0() { this.goToStep(0) }
//   goToStep_1() { this.goToStep(1) }
//   goToStep_2() { this.goToStep(2) }

//   goToStep(new_step) {
//     const stepTargets = [
//       this.step0Target,
//       this.step1Target,
//       this.step2Target,
//     ]
//     const menustepTargets = [
//       this.menustep0Target,
//       this.menustep1Target,
//       this.menustep2Target,
//     ]

//     if(new_step >= 0 && new_step < stepTargets.length) {
//       if(new_step != this.current_step) {

//         stepTargets[this.current_step].classList.toggle("d-none");
//         menustepTargets[this.current_step].classList.toggle("current");

//         menustepTargets[this.current_step+1].classList.add("active");
//         this.done();


//         stepTargets[new_step].classList.toggle("d-none");
//         menustepTargets[new_step].classList.toggle("current");
//         this.current_step = new_step
//       }
//     }
//   }


//   done() {

//     this.menuStepTarget.classList.add("disabledtest");
//     // this.iconTargets[this.current_step].classList.add("d-none");
//     this.iconTargets[this.current_step].classList.add("icon circle-check");

//   }

//   toggleForm(event) {
//     this.formTarget.classList.toggle("d-none");
//   }


// }
// import { Controller } from "@hotwired/stimulus";

// export default class extends Controller {
//   static targets = ["step", "iconItem", "badge"];

//   connect() {
//     this.showCurrentStep();
//   }

//   goToStep_0() {
//     this.showStep(0);
//   }

//   goToStep_1() {
//     this.showStep(1);
//   }

//   goToStep_2() {
//     this.showStep(2);
//   }

//   showStep(index) {
//     this.stepTargets.forEach((element, idx) => {
//       element.classList.toggle("d-none", idx !== index);
//       this.updateIcon(this.current_step, true); // Inputs valid
//     });
//     this.iconItemTargets.forEach((element, idx) => {
//       element.classList.toggle("active", idx === index);
//     });
//     this.updateIcon(this.current_step, true); // Inputs valid

//   }

//   showCurrentStep() {
//     const currentStep = this.stepTargets.findIndex(element => !element.classList.contains("d-none"));
//     if(currentStep >= 0) {
//       this.showStep(currentStep);
//     } else {
//       this.showStep(0); // Default to showing the first step if none are active
//     }
//   }

//   updateIcon(stepIndex) {

//       '<i class="fa-solid fa-check" style="color: #4CAF50;"></i>'  // valid icon
//       // '<i class="fa-solid fa-circle-xmark" style="color: #b51a00;"></i>'; // invalid icon

//     this.badgeTargets[stepIndex].innerHTML = iconHTML;
//   }
// }
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["step", "iconItem", "icon"];

  connect() {
    this.showCurrentStep();
  }

  goToStep_0() {
    this.showStep(0);
  }

  goToStep_1() {
    this.showStep(1);
    this.markAsCompleted(0);  // Mark the previous step as completed
  }

  goToStep_2() {
    this.showStep(2);
    this.markAsCompleted(1);  // Mark the previous step as completed
  }

  markAsCompleted(index) {
    const icon = this.iconTargets[index];
    icon.innerHTML = ''; // Change to check icon
    icon.classList.remove('badge-purple');
    // icon.innerHTML = '<i class="fa-solid fa-circle-check"></i>'; // Change to check icon
    icon.classList.add("completed");
    // icon.insertAdjacentHTML = '<i class="fa-solid fa-circle-check"></i>';

  }

  showStep(index) {
    this.stepTargets.forEach((element, idx) => {
      element.classList.toggle("d-none", idx !== index);
    });
    this.iconItemTargets.forEach((element, idx) => {
      element.classList.toggle("active", idx === index);
    });
  }

  showCurrentStep() {
    const currentStep = this.stepTargets.findIndex(element => !element.classList.contains("d-none"));
    if(currentStep >= 0) {
      this.showStep(currentStep);
    } else {
      this.showStep(0); // Default to showing the first step if none are active
    }
  }
}
