import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="books"
export default class extends Controller {
  static targets = ["authorList", "template"];

  connect() {}

  add() {
    var content = this.templateTarget.innerHTML.replace(/NEW_RECORD/g, new Date().getTime())
    console.log(content)
    this.authorListTarget.insertAdjacentHTML('beforebegin', content)
  }
}
