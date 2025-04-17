from flask import Flask, render_template, request, redirect, url_for
import pymysql
import os

app = Flask(__name__)

# Configuración de la conexión a la base de datos
db = pymysql.connect(
    host="127.0.0.1",
    user="root",
    password="",
    database="estudiantes_regi"
)

# Configuración para subir archivos
app.config['UPLOAD_FOLDER'] = os.path.join(os.getcwd(), 'uploads')
if not os.path.exists(app.config['UPLOAD_FOLDER']):
    os.makedirs(app.config['UPLOAD_FOLDER'])

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/registro_estudiantes', methods=['GET', 'POST'])
def registro_estudiantes():
    if request.method == 'POST':
        # Lógica para manejar el formulario
        pass
    # Obtener las carreras desde la base de datos
    cursor = db.cursor()
    cursor.execute("SELECT id_carrera, nombre_carrera FROM carrera")
    carreras = cursor.fetchall()
    return render_template('registro_estudiantes.html', carreras=carreras)

@app.route('/adm_estudiantes')
def adm_estudiantes():
    return render_template('adm_estudiantes.html')

@app.route('/detalles_estudiantes')
def detalles_estudiantes():
    return render_template('detalles_estudiantes.html')

if __name__ == '__main__':
    app.run(debug=True)