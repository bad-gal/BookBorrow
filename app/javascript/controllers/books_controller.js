import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="books"
export default class extends Controller {
  static get targets () {
    return ["authorList", "template"]
  }
  connect() {}

  add() {
    var content = this.templateTarget.innerHTML.replace(/NEW_RECORD/g, new Date().getTime())
    this.authorListTarget.insertAdjacentHTML('beforebegin', content)
  }

  update() {
    var content = this.templateTarget.innerHTML.replace(/NEW_RECORD/g, new Date().getTime())
    this.authorListTarget.insertAdjacentHTML('beforebegin', content)
  }
}
