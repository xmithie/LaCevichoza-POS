import psycopg2
from psycopg2.pool import SimpleConnectionPool
from psycopg2.extras import RealDictCursor


hostname = 'localhost'
database = 'lacevichoza'
username = 'postgres'
pwd = 'postgres' #Recuerden cambiar la contraseña a su contraseña de PgAdmin4 para conectarse
port_id = '5432'

DB_CONFIG = {
    "host": hostname,
    "dbname": database,
    "user": username,
    "password": pwd,
    "port": port_id,
}

pool = SimpleConnectionPool(minconn=1, maxconn=10, **DB_CONFIG)

def get_conn():
    return pool.getconn()

def put_conn(conn):
    if conn:
        pool.putconn(conn)


def call_proc(proc_fqn: str, params: tuple = ()):
    conn = get_conn()
    try:
        with conn:
            with conn.cursor(cursor_factory=RealDictCursor) as cur:
                placeholders = ", ".join(["%s"] * len(params))
                sql = f"CALL {proc_fqn}({placeholders})" if params else f"CALL {proc_fqn}()"
                cur.execute(sql, params)
                try:
                    return cur.fetchall()
                except psycopg2.ProgrammingError:
                    return None
    finally:
        put_conn(conn)

def exec_function(fn_fqn: str, params: tuple = ()):
    conn = get_conn()
    try:
        with conn:
            with conn.cursor(cursor_factory=RealDictCursor) as cur:
                placeholders = ", ".join(["%s"] * len(params))
                sql = f"SELECT {fn_fqn}({placeholders})" if params else f"SELECT {fn_fqn}()"
                cur.execute(sql, params)
                return cur.fetchall()
    finally:
        put_conn(conn)

def fetch_view(view_name: str, params_sql: str = "", params: tuple = ()):
    conn = get_conn()
    try:
        with conn.cursor(cursor_factory=RealDictCursor) as cur:
            sql = f"SELECT * FROM {view_name} {params_sql}"
            cur.execute(sql, params)
            return cur.fetchall()
    finally:
        put_conn(conn)
def exec_sql(sql: str, params: tuple = (), fetch: bool = False):
    conn = get_conn()
    try:
        with conn:
            with conn.cursor(cursor_factory=RealDictCursor) as cur:
                cur.execute(sql, params)
                if fetch:
                    return cur.fetchall()
                return None
    finally:
        put_conn(conn)
def close_pool():
    pool.closeall()

if __name__ == '__main__':
    c = get_conn()
    print("Conexión exitosa a la base de datos.")
    put_conn(c)
    close_pool()
