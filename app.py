from flask import Flask, render_template, request, redirect, url_for
import pymysql
import os

app = Flask(__name__)

# Configuración de la conexión a la base de datos
db = pymysql.connect(
    host="127.0.0.1",  # Dirección del servidor MySQL
    user="root",       # Usuario de MySQL (por defecto es root en XAMPP)
    password="",       # Contraseña de MySQL (por defecto está vacía en XAMPP)
    database="estudiantes_regi"  # Nombre de la base de datos
)

# Configuración para subir archivos
app.config['UPLOAD_FOLDER'] = os.path.join(os.getcwd(), 'uploads')
if not os.path.exists(app.config['UPLOAD_FOLDER']):
    os.makedirs(app.config['UPLOAD_FOLDER'])

# Ruta para la página de inicio
@app.route('/')
def index():
    return render_template('index.html')

# Ruta para la página de registro de estudiantes
@app.route('/registro_estudiantes', methods=['GET', 'POST'])
def registro_estudiantes():
    if request.method == 'POST':
        # Obtener datos del formulario
        primer_nombre = request.form['primer_nombre']
        segundo_nombre = request.form.get('segundo_nombre', '')
        primer_apellido = request.form['primer_apellido']
        segundo_apellido = request.form.get('segundo_apellido', '')
        correo = request.form['correo']
        fecha_inscripcion = request.form['fecha_inscripcion']
        carrera = int(request.form['carrera'])  # Convertir a entero
        foto = request.files['foto']
        documento = request.files['documento_estudiante']  # Cambiado para manejar el archivo PDF

        # Guardar la foto en la carpeta 'uploads'
        if foto:
            foto_path = os.path.join(app.config['UPLOAD_FOLDER'], foto.filename)
            foto.save(foto_path)

        # Guardar el documento en la carpeta 'uploads'
        if documento:
            documento_path = os.path.join(app.config['UPLOAD_FOLDER'], documento.filename)
            documento.save(documento_path)

        # Insertar datos en la base de datos
        cursor = db.cursor()
        sql = """
            INSERT INTO estudiante (nombre1, nombre2, apellido1, apellido2, correo, id_carrera, fecha_inscripcion, foto_estudiante, documento_estudiante)
            VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)
        """
        cursor.execute(sql, (primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, correo, carrera, fecha_inscripcion, foto.filename, documento.filename))
        db.commit()

        return redirect('/registro_estudiantes')

    # Obtener las carreras desde la base de datos
    cursor = db.cursor()
    cursor.execute("SELECT id_carrera, nombre_carrera FROM carrera")
    carreras = cursor.fetchall()  # Lista de tuplas (id_carrera, nombre_carrera)

    return render_template('registro_estudiantes.html', carreras=carreras)

# Ruta para la página de administración de estudiantes
@app.route('/adm_estudiantes')
def adm_estudiantes():
     # Obtener los datos de los estudiantes desde la base de datos
    cursor = db.cursor()
    sql = """
        SELECT e.id_estudiante, e.nombre1, e.nombre2, e.apellido1, e.apellido2, e.correo, c.nombre_carrera, e.foto_estudiante
        FROM estudiante e
        JOIN carrera c ON e.id_carrera = c.id_carrera
    """
    cursor.execute(sql)
    estudiantes = cursor.fetchall()  # Lista de tuplas con los datos de los estudiantes

    # Pasar los datos al archivo HTML
    return render_template('adm_estudiantes.html', estudiantes=estudiantes)
    
    
    

# Ruta para la página de detalles de estudiantes
@app.route('/detalles_estudiantes/<int:id_estudiante>')
def detalles_estudiantes(id_estudiante):
    # Obtener los detalles del estudiante desde la base de datos
    cursor = db.cursor()
    sql = "SELECT * FROM estudiante WHERE id_estudiante = %s"
    cursor.execute(sql, (id_estudiante,))
    estudiante = cursor.fetchone()  # Obtener una sola fila
    return render_template('detalles_estudiantes.html',  estudiante=estudiante)

# Ruta para editar estudiante
@app.route('/editar_estudiante/<int:id_estudiante>', methods=['GET', 'POST'])
def editar_estudiante(id_estudiante):
    cursor = db.cursor()
    if request.method == 'POST':
        # Actualizar datos del estudiante
        nombre1 = request.form['nombre1']
        nombre2 = request.form.get('nombre2', '')
        apellido1 = request.form['apellido1']
        apellido2 = request.form.get('apellido2', '')
        correo = request.form['correo']
        carrera = int(request.form['carrera'])
        sql = """
            UPDATE estudiante
            SET nombre1 = %s, nombre2 = %s, apellido1 = %s, apellido2 = %s, correo = %s, id_carrera = %s
            WHERE id_estudiante = %s
        """
        cursor.execute(sql, (nombre1, nombre2, apellido1, apellido2, correo, carrera, id_estudiante))
        db.commit()
        return redirect(url_for('adm_estudiantes'))
    else:
        # Obtener datos del estudiante para editar
        sql = "SELECT * FROM estudiante WHERE id_estudiante = %s"
        cursor.execute(sql, (id_estudiante,))
        estudiante = cursor.fetchone()
        return render_template('editar_estudiante.html', estudiante=estudiante)

# Ruta para eliminar estudiante
@app.route('/eliminar_estudiante/<int:id_estudiante>')
def eliminar_estudiante(id_estudiante):
    cursor = db.cursor()
    sql = "DELETE FROM estudiante WHERE id_estudiante = %s"
    cursor.execute(sql, (id_estudiante,))
    db.commit()
    return redirect(url_for('adm_estudiantes'))
if __name__ == '__main__':
    app.run(debug=True)