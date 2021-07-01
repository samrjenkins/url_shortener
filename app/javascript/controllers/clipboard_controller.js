
import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "clip", "trigger" ]

  copy() {
    this._copyToClipboard()
    this._changeTriggerText(this.toggleText)
    setTimeout(this._changeTriggerText.bind(this), 3000, this.textCache)
  }

  _copyToClipboard() {
    const range = document.createRange();
    range.selectNode(this.clipTarget);
    window.getSelection().removeAllRanges();
    window.getSelection().addRange(range);
    document.execCommand("copy");
    window.getSelection().removeAllRanges();
  }

  _changeTriggerText(newText) {
    this.textCache = this.triggerTarget.textContent
    this.triggerTarget.textContent = newText
  }

  get toggleText() {
    return this.triggerTarget.dataset.toggleText
  }
}
