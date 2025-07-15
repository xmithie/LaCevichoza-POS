# Estructura del Repositorio: LaCevichoza-POS

## (root)/
- `README.md`: Documento README con una introducción o guía del proyecto.

## .git/
- Necesarios para git, no se incluyen por ser de plataforma.

## app/
- `temporal`: Archivo placeholder, vacio.

## docs/
- `Diccionario_de_Datos__Completo.csv`: Este archivo contiene el diccionario de datos del sistema de punto de venta LaCevichoza-POS. Representa una recopilación detallada de las tablas, columnas y estructuras de datos utilizadas en la base de datos del sistema.
- `estructura_repo.md`: Este archivo sirve como un índice documentado de la estructura del repositorio del sistema LaCevichoza-POS. Tiene el objetivo de proporcionar una visión organizada de los archivos y carpetas que componen el proyecto, junto con una breve descripción funcional de cada uno.
- `temporal`: Archivo placeholder, vacio.

## sql/
- `cursores_lacevichoza.sql`: Agrupa varios procedimientos que utilizan cursores para recorrer resultados y emitir mensajes con RAISE NOTICE. Incluye: Listado de clientes, Ventas por cliente, Detalles de ventas, Pagos realizados, Productos sin ventas, Resumen diario de ventas, Aumento de precios. Son útiles para tareas administrativas, reportes manuales o debugging interno.
- `lacevichoza_db.sql`: Archivo binario o no legible para análisis automático.
- `procedimientos_almacenados_funciones.sql`: Contiene la definición completa de procedimientos almacenados y funciones PL/pgSQL organizadas por paquetes (paquete_cliente, paquete_producto, etc.).
Incluye operaciones CRUD y funciones auxiliares para todas las entidades principales del sistema como: Categorías, Productos, Clientes, Usuarios, Ventas, Detalle de ventas, Pagos, Inventario, Roles. Es el núcleo funcional de la base de datos.
- `temporal`: Archivo placeholder, vacio.
- `triggers_lacevichoza.sql`: Define tres triggers clave para la integridad y automatización del sistema: 
trg_actualizar_stock: Resta stock automáticamente al registrar una venta. trg_alerta_stock_minimo: Emite una alerta cuando el stock baja del mínimo. trg_evitar_venta_sin_stock: Impide registrar una venta si no hay stock suficiente. Estos mecanismos aseguran consistencia y validación automática en operaciones sensibles.
- `vistas_lacevichoza.sql`: Contiene vistas SQL predefinidas para reportes y análisis de datos. Algunas de las más destacadas: vista_productos_stock_bajo: productos bajo el nivel de stock mínimo. vista_ventas_detalladas: desglose completo por venta y producto. vista_productos_mas_vendidos, ventas_por_dia, clientes_frecuentes, inventario_actual, etc. Estas vistas sirven como base para informes en tiempo real o paneles administrativos.
- `lacevichoza_db`: Archivo de base de datos que representa el estado actual de la base de datos despues de ejecutar el avance.