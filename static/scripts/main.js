
document.addEventListener('DOMContentLoaded', function () {
    const toggleButton = document.getElementById('toggle-filtros');
        const filtros = document.getElementById('filtros');

        toggleButton.addEventListener('click', function () {
            filtros.classList.toggle('hidden');
        });
});