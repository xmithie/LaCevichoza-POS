
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

---

## 📎 Licencia

Proyecto académico con fines didácticos. Prohibida su reproducción sin autorización del equipo desarrollador.

---
