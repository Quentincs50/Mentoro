CREATE TABLE dim_employe (
    employe_id      SERIAL PRIMARY KEY,
    age             INT,
    genre           VARCHAR(10),
    departement     VARCHAR(50),
    job_role        VARCHAR(50),
    job_level       INT,
    education       INT,
    education_field VARCHAR(50),
    marital_status  VARCHAR(20)
);

CREATE TABLE dim_client (
    client_id       SERIAL PRIMARY KEY,
    customer_id     VARCHAR(20) UNIQUE,
    customer_name   VARCHAR(100),
    segment         VARCHAR(50),
    city            VARCHAR(50),
    state           VARCHAR(50),
    region          VARCHAR(50),
    country         VARCHAR(50)
);

CREATE TABLE dim_produit (
    produit_id      SERIAL PRIMARY KEY,
    product_id      VARCHAR(50) UNIQUE,
    product_name    VARCHAR(255),
    category        VARCHAR(50),
    sub_category    VARCHAR(50)
);

CREATE TABLE dim_date (
    date_id         SERIAL PRIMARY KEY,
    date_complete   DATE UNIQUE,
    jour            INT,
    mois            INT,
    trimestre       INT,
    annee           INT
);

CREATE TABLE dim_stock (
    stock_id            SERIAL PRIMARY KEY,
    sku                 VARCHAR(50) UNIQUE,
    product_type        VARCHAR(50),
    price               NUMERIC(10,2),
    supplier_name       VARCHAR(100),
    location            VARCHAR(100),
    transportation_mode VARCHAR(50)
);


CREATE TABLE fact_ventes (
    vente_id        SERIAL PRIMARY KEY,
    date_id         INT REFERENCES dim_date(date_id),
    client_id       INT REFERENCES dim_client(client_id),
    produit_id      INT REFERENCES dim_produit(produit_id),
    employe_id      INT REFERENCES dim_employe(employe_id),
    stock_id        INT REFERENCES dim_stock(stock_id),
    -- chiffres
    sales           NUMERIC(10,2),
    quantity        INT,
    discount        NUMERIC(5,2),
    profit          NUMERIC(10,2),
    -- RH
    monthly_income  INT,
    attrition       BOOLEAN,
    overtime        BOOLEAN,
    -- stock
    stock_level     INT,
    order_quantity  INT,
    lead_time       INT,
    defect_rate     NUMERIC(5,4)
);