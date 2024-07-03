import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="insert-button"
export default class extends Controller {
  static targets = ["content"];

  connect() {
    this.insertButton();
  }

  insertButton() {
    const placeholder = '<!-- BUTTON_PLACEHOLDER -->';
    const content = this.contentTarget.innerHTML;
    const articleId = this.element.dataset.articleId;

    if (content.includes(placeholder)) {
      const buttonHtml = `<a href="/articles/${articleId}/my_guides/new?locale=fr" class="btn btn-medium my-4">Commencer mes démarches</a>`;
      this.contentTarget.innerHTML = content.replace(placeholder, buttonHtml);
    }
  }
}
