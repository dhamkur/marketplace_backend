import NestedForm from "stimulus-rails-nested-form";

export default class extends NestedForm {
  connect() {
    super.connect();
    console.log("Connected to stimulus nested form");
  }
}
