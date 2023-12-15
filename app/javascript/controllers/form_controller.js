import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["source"];

  search() {
    clearTimeout(this.timeout);
    this.timeout = setTimeout(() => {
      this.sourceTarget.requestSubmit();
    }, 200);
  }

  reset() {
    this.element.reset();
  }
}
