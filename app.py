from flask import Flask, render_template, request, redirect, url_for, send_from_directory
import pymysql
import os

app = Flask(__name__)

#----------------------------------------------------------------------------
# Configuración de la conexión a la base de datos
db = pymysql.connect(
    host="127.0.0.1",  # Dirección del servidor MySQL
    user="root",       # Usuario de MySQL (por defecto es root en XAMPP)
    password="",       # Contraseña de MySQL (por defecto está vacía en XAMPP)
    database="estudiantes_regi"  # Nombre de la base de datos
)



#----------------------------------------------------------------------------
# Configuración para subir archivos
app.config['UPLOAD_FOLDER'] = os.path.join(os.getcwd(), 'uploads')
if not os.path.exists(app.config['UPLOAD_FOLDER']):
    os.makedirs(app.config['UPLOAD_FOLDER'])



#----------------------------------------------------------------------------
# Ruta para servir archivos desde la carpeta 'uploads'
@app.route('/uploads/<path:filename>')
def uploads(filename):
    return send_from_directory(app.config['UPLOAD_FOLDER'], filename)



#----------------------------------------------------------------------------
# Ruta para la página de inicio
@app.route('/')
def index():
    return render_template('index.html')



#----------------------------------------------------------------------------
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
        carrera_str = request.form['carrera']  # Obtener la carrera como string
        if carrera_str:
            carrera = int(carrera_str)  # Convertir a entero solo si hay un valor
        else:
            return "Error: Por favor, selecciona una carrera", 400
        
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



#----------------------------------------------------------------------------
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
    
    # Construir la URL completa para las imágenes
    estudiantes_con_imagen = []
    for estudiante in estudiantes:
        estudiante = list(estudiante)
        estudiante[7] = url_for('uploads', filename=estudiante[7])  # Ruta completa de la imagen
        estudiantes_con_imagen.append(estudiante)
    # Pasar los datos al archivo HTML
    return render_template('adm_estudiantes.html', estudiantes=estudiantes_con_imagen)



#----------------------------------------------------------------------------
@app.route('/buscar_estudiantes', methods=['POST'])
def buscar_estudiantes():
    search_term = request.form['consulta']  # Obtener el término de búsqueda del formulario
    cursor = db.cursor()
    sql = """
        SELECT id_estudiante, nombre1, nombre2, apellido1, apellido2, correo, id_carrera, foto_estudiante
        FROM estudiante
        WHERE nombre1 LIKE %s OR nombre2 LIKE %s OR apellido1 LIKE %s OR apellido2 LIKE %s OR correo LIKE %s
    """
    val = (f"%{search_term}%", f"%{search_term}%", f"%{search_term}%", f"%{search_term}%", f"%{search_term}%")
    cursor.execute(sql, val)
    estudiantes = cursor.fetchall()  # Obtener los resultados de la consulta

    # Pasar los resultados al archivo HTML
    return render_template('adm_estudiantes.html', estudiantes=estudiantes, search_term=search_term)
    


#----------------------------------------------------------------------------
# Ruta para editar estudiante
@app.route('/editar_estudiante/<int:id_estudiante>', methods=['GET', 'POST'])
def editar_estudiante(id_estudiante):
    cursor = db.cursor()
    if request.method == 'POST':
        # Obtener datos del formulario
        primer_nombre = request.form['primer_nombre']
        segundo_nombre = request.form.get('segundo_nombre', '')
        primer_apellido = request.form['primer_apellido']
        segundo_apellido = request.form.get('segundo_apellido', '')
        correo = request.form['correo']
        
        # Manejar archivos (opcional)
        foto = request.files.get('foto')
        documento = request.files.get('documento_estudiante')
        
        # Actualizar datos en la base de datos
        sql = """
            UPDATE estudiante
            SET nombre1 = %s, nombre2 = %s, apellido1 = %s, apellido2 = %s, correo = %s
            WHERE id_estudiante = %s
        """
        cursor.execute(sql, (primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, correo, id_estudiante))
        
        # Actualizar foto si se subió
        if foto and foto.filename:
            foto_path = os.path.join(app.config['UPLOAD_FOLDER'], foto.filename)
            foto.save(foto_path)
            cursor.execute("UPDATE estudiante SET foto_estudiante = %s WHERE id_estudiante = %s", (foto.filename, id_estudiante))
        
        # Actualizar documento si se subió
        if documento and documento.filename:
            documento_path = os.path.join(app.config['UPLOAD_FOLDER'], documento.filename)
            documento.save(documento_path)
            cursor.execute("UPDATE estudiante SET documento_estudiante = %s WHERE id_estudiante = %s", (documento.filename, id_estudiante))
        
        db.commit()
        return redirect(url_for('adm_estudiantes'))
    else:
        # Obtener datos del estudiante para editar
        sql = "SELECT * FROM estudiante WHERE id_estudiante = %s"
        cursor.execute(sql, (id_estudiante,))
        estudiante = cursor.fetchone()
        
        # Obtener las carreras para mostrar en el formulario
        cursor.execute("SELECT id_carrera, nombre_carrera FROM carrera")
        carreras = cursor.fetchall()
        
        return render_template('editar_estudiante.html', estudiante=estudiante, carreras=carreras)



#----------------------------------------------------------------------------
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



#----------------------------------------------------------------------------
# Para mostrar materias correspondientes al estudiante:
@app.route('/detalles_estudiantes/<int:id_estudiante>')
def detalles_estudiantes(id_estudiante):
    # Obtener los detalles del estudiante desde la base de datos
    cursor = db.cursor()
    sql_estudiante = """
        SELECT e.nombre1, e.nombre2, e.apellido1, e.apellido2, e.correo, e.fecha_inscripcion, 
               c.nombre_carrera, f.nombre_facultad, e.foto_estudiante
        FROM estudiante e
        JOIN carrera c ON e.id_carrera = c.id_carrera
        JOIN facultad f ON c.id_facultad = f.id_facultad
        WHERE e.id_estudiante = %s
    """
    cursor.execute(sql_estudiante, (id_estudiante,))
    estudiante = cursor.fetchone()  # Obtener una sola fila

    if not estudiante:
        return "Estudiante no encontrado", 404

    # Obtener las materias del estudiante
    sql_materias = """
        SELECT m.nombre_materia, s.numero_semestre
        FROM inscripcion_semestre i
        JOIN materias m ON i.id_semestre = m.id_semestre AND i.id_estudiante = %s
        JOIN semestre s ON m.id_semestre = s.id_semestre
        ORDER BY s.numero_semestre
    """
    cursor.execute(sql_materias, (id_estudiante,))
    materias = cursor.fetchall()  # Lista de materias

    # Construir la URL completa para la foto del estudiante
    foto_url = url_for('uploads', filename=estudiante[8]) if estudiante[8] else None

    # Pasar los datos al archivo HTML
    return render_template('detalles_estudiantes.html', estudiante=estudiante, foto_url=foto_url, materias=materias)



#----------------------------------------------------------------------------
# Ruta para la página de detalles de estudiantes
@app.route('/detalles_estudiantes/<int:id_estudiante>')
def detalles_estudiantes(id_estudiante):
    # Obtener los detalles del estudiante desde la base de datos
    cursor = db.cursor()
    sql = "SELECT * FROM estudiante WHERE id_estudiante = %s"
    cursor.execute(sql, (id_estudiante,))
    estudiante = cursor.fetchone()  # Obtener una sola fila
    return render_template('detalles_estudiantes.html',  estudiante=estudiante)

