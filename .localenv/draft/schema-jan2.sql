BEGIN;

CREATE SCHEMA IF NOT EXISTS demo2;

CREATE TABLE demo2.users (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid (),
    customid TEXT,
    email VARCHAR(255) UNIQUE NOT NULL,
    password TEXT,
    region VARCHAR(255),
    geodata geography (POINT, 4326),
    latitude DOUBLE PRECISION,
    longitude DOUBLE PRECISION,
    role VARCHAR(255) DEFAULT 'farmer',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE demo2.products (
    id BIGSERIAL PRIMARY KEY,
    customid TEXT,
    user_id UUID NOT NULL,
    product_name VARCHAR(255),
    product_desc TEXT,
    product_price DECIMAL(9, 0),
    product_stock INTEGER,
    product_status BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_product_user FOREIGN KEY (user_id) REFERENCES demo2.users (id)
);

COMMIT;