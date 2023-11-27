CREATE TABLE IF NOT EXISTS client (
    id SERIAL PRIMARY KEY,
    nui CHAR(10) UNIQUE NOT NULL,
    full_name VARCHAR(100) NOT NULL,
    address VARCHAR(100) NOT NULL
);
    CREATE TABLE IF NOT EXISTS invoice(
        id SERIAL PRIMARY KEY,
        client_id SERIAL,
        total DECIMAL(10, 2),
        create_at TIMESTAMP,
        FOREIGN KEY(client_id) REFERENCES  client(id)
    );

    CREATE TABLE IF NOT EXISTS product(
        id SERIAL   PRIMARY KEY,
        description varchar(255) NOT NULL,
        brand varchar(255) not null,
        price DECIMAL(10, 2),
        stock INT
    );

    CREATE TABLE IF NOT EXISTS detail(
        id SERIAL PRIMARY KEY,
        quantity INT NOT NULL,
        price DECIMAL(10, 2),
        invoice_id SERIAL,
        product_id SERIAL,
        FOREIGN KEY(invoice_id) REFERENCES invoice(id),
        FOREIGN KEY(product_id) REFERENCES product(id)
    );