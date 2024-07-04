import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
    static targets = ["grade_select"];

    updateGrades(event) {
        const categoryId = event.target.value;

        fetch('/grade_categories/${categoryId}/grades', {
            headers: {
                Accept: "text/vnd.turbo-stream.html",
            },
        })
            .then((response) => response.text())
            .then((html) => Turbo.renderStreamMessage(html));
        }
}