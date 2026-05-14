CREATE TABLE gift_card_order (
    id VARCHAR(50),
    card_number VARCHAR(50),
    monto NUMERIC(10,2),
    estado VARCHAR(20),
    created_time TIMESTAMP,
    cliente VARCHAR(100)
);