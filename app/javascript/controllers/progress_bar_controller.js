import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="progress-bar"
export default class extends Controller {
  static targets=["bar", "input1", "input2", "input3", "input4", "input5", "input6", "input7", "input8", "input9", "input10", "input11", "input12", "input13", "input14", "input15"]
  connect() {
    console.log(this.barTarget)
    console.log(this.input1Target.value)
  }

  first_input() {
    console.log(this.input1Target.value)
    if (this.input1Target.value != "") {
      this.barTarget.style = "width: 7.15%"
    } else{
      this.barTarget.style = "width: 0%"
    }
  }
  second_input() {
    console.log(this.input2Target.value)
    if (this.input2Target.value != "") {
      this.barTarget.style = "width: 14.3%"
    } else{
      this.barTarget.style = "width: 7.15%"
    }
  }
  third_input() {
    console.log(this.input3Target.value)
    if (this.input3Target.value != "") {
      this.barTarget.style = "width: 21.45%"
    } else{
      this.barTarget.style = "width: 14.3%"
    }
  }
  fourth_input() {
    console.log(this.input4Target.value)
    if (this.input4Target.value != "") {
      this.barTarget.style = "width: 28.6%"
    } else{
      this.barTarget.style = "width: 21.45%"
    }
  }
  fifth_input() {
    console.log(this.input5Target.value)
    if (this.input5Target.value != "") {
      this.barTarget.style = "width: 35.75%"
    } else{
      this.barTarget.style = "width: 28.6%"
    }
  }
  sixth_input() {
    console.log(this.input6Target.value)
    if (this.input6Target.value != "") {
      this.barTarget.style = "width: 42.9%"
    } else{
      this.barTarget.style = "width: 35.75%"
    }
  }
  seventh_input() {
    console.log(this.input7Target.value)
    if (this.input7Target.value != "") {
      this.barTarget.style = "width: 50.05%"
    } else{
      this.barTarget.style = "width: 42.9%"
    }
  }
  eighth_input() {
    console.log(this.input8Target.value)
    if (this.input8Target.value != "") {
      this.barTarget.style = "width: 57.2%"
    } else{
      this.barTarget.style = "width: 50.05%"
    }
  }
  ninth_input() {
    console.log(this.input9Target.value)
    if (this.input9Target.value != "") {
      this.barTarget.style = "width: 64.35%"
    } else{
      this.barTarget.style = "width: 57.2%"
    }
  }
  tenth_input() {
    console.log(this.input10Target.value)
    if (this.input10Target.value != "") {
      this.barTarget.style = "width: 71.5%"
    } else{
      this.barTarget.style = "width: 64.35%"
    }
  }
  eleventh_input() {
    console.log(this.input11Target.value)
    if (this.input11Target.value != "") {
      this.barTarget.style = "width: 78.65%"
    } else{
      this.barTarget.style = "width: 71.5%"
    }
  }
  twelfth_input() {
    console.log(this.input12Target.value)
    if (this.input12Target.value != "") {
      this.barTarget.style = "width: 85.8%"
    } else{
      this.barTarget.style = "width: 78.65%"
    }
  }
  thirteenth_input() {
    console.log(this.input13Target.value)
    if (this.input13Target.value != "") {
      this.barTarget.style = "width: 92.95%"
    } else{
      this.barTarget.style = "width: 85.8%"
    }
  }
  fourteenth_input() {
    console.log(this.input14Target.value)
    if (this.input14Target.value != "") {
      this.barTarget.style = "width: 93%"
    } else{
      this.barTarget.style = "width: 92.95%"
    }
  }
  fifteenth_input() {
    console.log(this.input15Target.value)
    if (this.input15Target.value != "") {
      this.barTarget.style = "width: 100%"
    } else{
      this.barTarget.style = "width: 92.95%"
    }
  }
  second_step() {
    this.barTarget.style = "width: 92.95%"
  }
}
