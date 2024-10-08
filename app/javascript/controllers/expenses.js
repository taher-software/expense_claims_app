document.addEventListener("turbo:load", () => {
    const button = document.getElementById("add-request");
    const requestForm = document.querySelector('.new-form');
    const editForm = document.querySelector('.edit-form');

    // Event listener for the "Add Request" button
    if (button) {
        button.addEventListener("click", function () {
            requestForm.style.display = 'block';
        });
    }

    // Use event delegation for dynamically added or existing elements
    document.addEventListener("click", function (event) {
        // Handle cancel button click
        if (event.target.matches('.cancel-bt')) {
            requestForm.style.display = 'none';
            editForm.style.display = 'none';
        }

        // Handle edit button click
        if (event.target.matches('.edit-bt')) {
            editForm.style.display = 'block';
        }
    });
});
