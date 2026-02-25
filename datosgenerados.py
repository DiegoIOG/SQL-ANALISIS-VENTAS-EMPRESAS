import pandas as pd
import numpy as np
from faker import Faker
import random
from datetime import datetime, timedelta

fake = Faker()
np.random.seed(42)
random.seed(42)


n_clientes = 50000
n_empresas = 500
n_productos = 1000
n_ventas = 1_000_000


empresas = pd.DataFrame({
    "empresa_id": range(1, n_empresas + 1),
    "nombre_empresa": [fake.company() for _ in range(n_empresas)],
    "industria": np.random.choice(
        ["Tecnología", "Retail", "Manufactura", "Finanzas", "Salud"], 
        n_empresas
    ),
    "pais": np.random.choice(
        ["México", "USA", "Colombia", "España", "Argentina"],
        n_empresas
    )
})

empresas.to_csv("empresas.csv", index=False)


clientes = pd.DataFrame({
    "cliente_id": range(1, n_clientes + 1),
    "nombre": [fake.first_name() for _ in range(n_clientes)],
    "apellido": [fake.last_name() for _ in range(n_clientes)],
    "email": [fake.email() for _ in range(n_clientes)],
    "empresa_id": np.random.randint(1, n_empresas + 1, n_clientes)
})

clientes.to_csv("clientes.csv", index=False)


productos = pd.DataFrame({
    "producto_id": range(1, n_productos + 1),
    "nombre_producto": [fake.word().capitalize() for _ in range(n_productos)],
    "categoria": np.random.choice(
        ["Software", "Hardware", "Servicio", "Suscripción"], 
        n_productos
    ),
    "precio_base": np.round(np.random.uniform(50, 5000, n_productos), 2)
})

productos.to_csv("productos.csv", index=False)


ventas = pd.DataFrame({
    "venta_id": range(1, n_ventas + 1),
    "cliente_id": np.random.randint(1, n_clientes + 1, n_ventas),
    "producto_id": np.random.randint(1, n_productos + 1, n_ventas),
    "cantidad": np.random.randint(1, 20, n_ventas),
    "fecha": [
        datetime(2020,1,1) + timedelta(days=random.randint(0, 1825))
        for _ in range(n_ventas)
    ],
    "region": np.random.choice(
        ["Norte", "Sur", "Este", "Oeste"], 
        n_ventas
    )
})

ventas["precio_unitario"] = np.round(
    np.random.uniform(50, 5000, n_ventas), 2
)

ventas["total"] = ventas["cantidad"] * ventas["precio_unitario"]

ventas.to_csv("ventas.csv", index=False)

print("✅ Datos empresariales generados correctamente.")