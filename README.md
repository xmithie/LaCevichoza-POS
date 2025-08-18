
# LaCevichoza-POS 🍲💻

Sistema de Punto de Venta (POS) desarrollado como parte del proyecto final de la asignatura de Bases de Datos. El sistema está orientado a la gestión de ventas, productos, clientes, inventario y pagos en un negocio gastronómico simulado.

---

## 📌 Objetivo del Proyecto

El propósito del proyecto es aplicar los conocimientos adquiridos en SQL y PL/pgSQL mediante la construcción de una base de datos estructurada y funcional, utilizando:

- Procedimientos almacenados
- Funciones
- Cursores
- Triggers
- Vistas
- Módulos organizados en paquetes (`SCHEMAS`)

Todo el código se gestiona de forma colaborativa en GitHub y se documenta cuidadosamente como parte del proceso evaluativo.

---

## 🧱 Estructura del Proyecto

```
📁 sql/
 ├── procedimientos_almacenados_funciones.sql
 ├── cursores_lacevichoza.sql
 ├── triggers_lacevichoza.sql
 ├── vistas_lacevichoza.sql
 └── lacevichoza_db.sql
📁 docs/
 ├── Diccionario_de_Datos__Completo.csv
 └── estructura_repo.md
📁 app/
 └── db_connection.py
📄 avance proyecto.sql
📄 README.md
```

---

## ⚙️ Funcionalidades Implementadas

El sistema implementa operaciones clave a través de procedimientos, funciones y estructuras auxiliares:

### 📦 Paquetes por módulo:
| Paquete (Schema)        | Entidad Principal  | Funciones / Procedimientos principales                      |
|--------------------------|--------------------|-------------------------------------------------------------|
| `paquete_categoria`      | Categoría           | CRUD de categorías, obtener nombre                         |
| `paquete_producto`       | Producto            | CRUD, obtener stock/precio, listar productos, stock mínimo |
| `paquete_cliente`        | Cliente             | CRUD, contar clientes, obtener teléfono                    |
| `paquete_usuario`        | Usuario / Rol       | CRUD de usuarios, validar existencia, obtener nombre de rol|
| `paquete_venta`          | Venta               | CRUD, total ventas por cliente, ventas por usuario         |
| `paquete_detalleventa`   | Detalle de venta    | CRUD, cantidad vendida por producto                        |
| `paquete_pago`           | Pago                | Registrar pagos, total pagado por venta                    |
| `paquete_inventario`     | Inventario          | Total productos, verificación de stock mínimo              |
| `paquete_rol`            | Rol                 | Obtener nombre del rol                                     |
| `paquete_otros`          | Producto (auxiliar) | Obtener descripción del producto                           |

---

## 🧠 Componentes Avanzados

### 🔁 Cursores

Ubicados en `cursores_lacevichoza.sql`, permiten recorrer registros y generar listados en consola:

- Clientes
- Ventas por cliente
- Pagos realizados
- Productos sin ventas
- Resumen diario

### 🛠 Triggers

Definidos en `triggers_lacevichoza.sql`, gestionan automatismos como:

- Descuento automático de stock al vender
- Alertas por bajo inventario
- Validación de stock antes de vender

### 📊 Vistas

En `vistas_lacevichoza.sql` se incluyen vistas analíticas como:

- Productos más vendidos
- Ventas por usuario o por día
- Clientes frecuentes
- Inventario actual

---

## 🧾 Documentación

### 📌 Diccionario de Datos

Ubicado en `docs/Diccionario_de_Datos__Completo.csv`, detalla las tablas, columnas, tipos de dato y origen funcional.

### 📌 Estructura del Repositorio

`docs/estructura_repo.md` contiene una descripción detallada de todos los archivos del proyecto.

---

## 🔧 Requisitos Técnicos

- PostgreSQL 13+  
- Editor compatible (Visual Studio Code, DBeaver, SQL Developer)
- Extensión SQLTools o conexión externa para ejecutar scripts

---

## 👥 Colaboración

Este proyecto es desarrollado de forma grupal. Los aportes individuales quedan registrados en GitHub como parte del proceso de evaluación y coevaluación del curso.

---

## 📚 Evaluación Académica

Este entregable corresponde al **Segundo Avance del Proyecto Final**, cumpliendo con los siguientes criterios:

- ✔️ Conexión a base de datos mediante procedimientos y funciones (sin consultas directas)
- ✔️ Estructuras programadas: 25+ procedimientos, 10+ vistas, 15+ funciones, 5+ triggers, 15+ cursores
- ✔️ Entrega documentada y versionada en GitHub
- ✔️ Diccionario de datos completo
- ✔️ Buenas prácticas de modularización y uso de `SCHEMA`

# LaCevichoza POS

Sistema de punto de venta para *La Cevichoza*, construido con **Python**, **PostgreSQL** y **Docker**.

---

## 🚀 Requisitos previos

Antes de comenzar, asegúrate de tener instalados:

- [Git](https://git-scm.com/downloads)
- [Docker Desktop](https://www.docker.com/products/docker-desktop)
- [Python 3.11+](https://www.python.org/downloads/)

---

## 📥 Clonar el repositorio

```bash
git clone https://github.com/usuario/LaCevichoza-POS.git
cd LaCevichoza-POS
```

---

## 🐘 Levantar la base de datos con Docker

1. Inicia los contenedores:

   ```bash
   docker compose up -d
   ```

   Esto levantará:
   - PostgreSQL en `localhost:5432`
   - Adminer en `localhost:8080` (opcional, cliente web para la BD)

2. Restaura la base de datos (ya incluimos los scripts en `docker-entrypoint-initdb.d/`, por lo que se cargan automáticamente al iniciar el contenedor).

3. Verifica que las tablas existen:

   ```bash
   docker exec -it lacevichoza_pg psql -U postgres -d lacevichoza -c "\dt"
   ```

---

## 🐍 Configuración de entorno Python

1. Crea y activa un entorno virtual:

   ```bash
   python -m venv venv
   source venv/bin/activate    # Linux/Mac
   venv\Scripts\activate       # Windows
   ```

2. Instala dependencias:

   ```bash
   pip install -r requirements.txt
   ```

---

## 🔗 Variables de conexión

La aplicación se conecta a PostgreSQL usando estos parámetros (ya configurados en `app/db_connection.py`):

```ini
host=localhost
port=5432
dbname=lacevichoza
user=postgres
password=postgres
```

> ⚠️ Si cambiaste usuario o contraseña en tu Docker, actualiza estos valores.

---

## ▶️ Ejecutar la aplicación

Una vez que la BD esté arriba y las dependencias instaladas:

```bash
python app/app.py
```

Accede en tu navegador a:

```
http://localhost:5000
```

---

## 🛠 Herramientas adicionales

- **Adminer**: [http://localhost:8080](http://localhost:8080)  
  Usuario: `postgres`  
  Password: `postgres`  
  Base de datos: `lacevichoza`

---

✅ Con esto deberías tener el sistema funcionando en tu máquina local.



---

## 📎 Licencia

Proyecto académico con fines didácticos. Prohibida su reproducción sin autorización del equipo desarrollador.

---
