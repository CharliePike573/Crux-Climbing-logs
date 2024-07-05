import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
    static targets = ["grade_select"];

    change(event) {
        const categoryId = event.target.value;

        if (categoryId) {
            fetch(`/grade_categories/${categoryId}/grades`, {
                headers: {
                    Accept: "text/vnd.turbo-stream.html",
                },
            })
                .then((response) => response.text())
                .then((html) => Turbo.renderStreamMessage(html));
            
        } else {
            const gradesFrame = document.getElementById("grades");
            gradesFrame.innerHTML = `<select name="cliimb[grade_id]" id="climb_grade_id"><option value="" label=" "></option><select>`;
        
        }   
    }
}
