document.addEventListener('DOMContentLoaded', function () {
    const toggleButton = document.getElementById('toggle-filtros');
        const filtros = document.getElementById('filtros');

        toggleButton.addEventListener('click', function () {
            filtros.classList.toggle('hidden');
        });
});

document.addEventListener('DOMContentLoaded', function () {
    const fechaInput = document.getElementById('fecha_inscripcion');
    if (fechaInput) {
        const today = new Date().toISOString().split('T')[0];
        fechaInput.setAttribute('max', today);
    }
});