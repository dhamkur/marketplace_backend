import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["source"];

  initialize() {
    let alerts = document.querySelectorAll(".alert");

    alerts.forEach((alert) => {
      setTimeout(() => {
        alert.classList.remove("show");
        alert.remove();
      }, 3000);
    });
  }
}
