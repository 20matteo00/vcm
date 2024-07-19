function showRegisterForm() {
    document.getElementById('login-form').style.display = 'none';
    document.getElementById('register-form').style.display = 'block';
}

function showLoginForm() {
    document.getElementById('login-form').style.display = 'block';
    document.getElementById('register-form').style.display = 'none';
}

// Carica lo stato del tema salvato in localStorage
document.addEventListener('DOMContentLoaded', function () {
    var tema = document.getElementById('tema');
    var navbar = document.getElementById('navbar');
    const primarycolor = "#212529";
    const secondarycolor = "#ffffff";

    // Recupera lo stato del tema da localStorage
    var savedTheme = localStorage.getItem('theme');
    let isAlternate = savedTheme === 'dark';

    // Imposta lo stato iniziale del checkbox
    tema.checked = isAlternate;

    function applyTheme(isAlternate) {
        if (isAlternate) {
            document.documentElement.style.setProperty('--primarycolor', secondarycolor);
            document.documentElement.style.setProperty('--secondarycolor', primarycolor);
            document.documentElement.style.setProperty('--bs-body-color', primarycolor);
            document.documentElement.style.setProperty('--bs-body-bg', secondarycolor);
            document.documentElement.style.setProperty('--bs-tertiary-bg', secondarycolor);
            navbar.classList.add('navbar-light');
            navbar.classList.add('bg-light');
            navbar.classList.remove('navbar-dark');
            navbar.classList.remove('bg-dark');
        } else {
            document.documentElement.style.setProperty('--primarycolor', primarycolor);
            document.documentElement.style.setProperty('--secondarycolor', secondarycolor);
            document.documentElement.style.setProperty('--bs-body-color', secondarycolor);
            document.documentElement.style.setProperty('--bs-body-bg', primarycolor);
            document.documentElement.style.setProperty('--bs-tertiary-bg', primarycolor);
            navbar.classList.add('navbar-dark');
            navbar.classList.add('bg-dark');
            navbar.classList.remove('navbar-light');
            navbar.classList.remove('bg-light');
        }
    }

    // Applica il tema iniziale
    applyTheme(isAlternate);

    // Cambia il tema quando si cambia lo stato del checkbox
    tema.addEventListener('change', function () {
        isAlternate = tema.checked;

        // Salva lo stato del tema in localStorage
        localStorage.setItem('theme', isAlternate ? 'dark' : 'light');

        // Applica il tema
        applyTheme(isAlternate);
    });
});
function limitCheckboxes(maxSelections) {
    var checkboxes = document.querySelectorAll('.player-checkbox');
    var checkedCount = 0;

    checkboxes.forEach(function (checkbox) {
        if (checkbox.checked) {
            checkedCount++;
        }
    });

    checkboxes.forEach(function (checkbox) {
        if (checkedCount >= maxSelections) {
            if (!checkbox.checked) {
                checkbox.disabled = true;
            }
        } else {
            checkbox.disabled = false;
        }
    });

    var submitButton = document.querySelector('button[name="select_players"]');
    submitButton.disabled = (checkedCount !== maxSelections);
}


document.addEventListener("DOMContentLoaded", function () {
    const table = document.getElementById("myTable");
    const headers = table.querySelectorAll("th");
    const tbody = table.querySelector("tbody");

    headers.forEach((header, index) => {
        header.addEventListener("click", function () {
            const rows = Array.from(tbody.querySelectorAll("tr"));
            const isAsc = header.getAttribute("data-order") === "asc";
            const direction = isAsc ? 1 : -1;

            const sortedRows = rows.sort((a, b) => {
                const aText = a.children[index].innerText;
                const bText = b.children[index].innerText;
                const aValue = isNaN(aText) ? aText.toLowerCase() : parseFloat(aText);
                const bValue = isNaN(bText) ? bText.toLowerCase() : parseFloat(bText);

                if (aValue < bValue) {
                    return -1 * direction;
                }
                if (aValue > bValue) {
                    return 1 * direction;
                }
                return 0;
            });

            // Toggle the data-order attribute
            header.setAttribute("data-order", isAsc ? "desc" : "asc");

            // Remove all rows from the table and append the sorted rows
            tbody.innerHTML = "";
            sortedRows.forEach(row => tbody.appendChild(row));
        });
    });
});

document.addEventListener("DOMContentLoaded", function () {
    // Seleziona tutti gli input
    document.querySelectorAll('input').forEach(input => {
        input.addEventListener('focus', () => {
            input.select();
        });
    });
});