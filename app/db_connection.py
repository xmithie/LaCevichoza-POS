import psycopg2

hostname = 'localhost'
database = 'lacevichoza_db'
username = 'postgres'
pwd = 'Hummer$$17172323'
port_id = '5432'

try:
    conn = psycopg2.connect(
        host=hostname,
        dbname=database,
        user=username,
        password=pwd,
        port=port_id)

    print("Conexión exitosa a la base de datos.")

    conn.close()
except Exception as error:
    print(error)