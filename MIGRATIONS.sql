CREATE DATABASE celerates_webdevuiux_sept_2024;
USE celerates_webdevuiux_sept_2024;

-- Categories Table
CREATE TABLE categories (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    slug VARCHAR(255) NOT NULL UNIQUE,
    name VARCHAR(255) NOT NULL,
    created_at DATETIME DEFAULT NOW()
);

-- Products Table
CREATE TABLE products (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    slug VARCHAR(255) NOT NULL UNIQUE,
    name VARCHAR(255) NOT NULL,
    category_id BIGINT,
    price DECIMAL(10, 2) NOT NULL,
    stock INT DEFAULT 0,
    description LONGTEXT,
    created_at DATETIME DEFAULT NOW(),
    FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE SET NULL
);

-- Images Table
CREATE TABLE images (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    product_id BIGINT,
    image_url VARCHAR(255),
    image_path VARCHAR(255),
    created_at DATETIME DEFAULT NOW(),
    FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE
);

-- Insert into Categories
INSERT INTO categories (slug, name) 
VALUES 
    ('makanan-minuman', 'Makanan & Minuman'),
    ('perawatan-kecantikan', 'Perawatan & Kecantikan'),
    ('buku-alat-tulis', 'Buku & Alat Tulis');

-- Insert into Products
INSERT INTO products (slug, name, category_id, price, stock, description)
VALUES
    ('nabati-richeese-122gr-x3', 'NABATI Richeese 122gr bundle 3', 1, 26000, 500, 
    '<p class="description-text">Nabati Wafer Richeese: Wafer Renyah, Krim Keju Berlimpah.
    Kombinasi sempurna antara renyahnya wafer dan krim keju Richeese signature flavor Nabati yang berlimpah. 
    Dibuat dengan bahan-bahan berkualitas tinggi, Nabati Richeese Wafer diperkaya dengan vitamin A, B1, B2, B6, dan B12. 
    Setiap gigitan membuat kamu lebih bersemangat!</p>'),
    
    ('Nextar-Star-Double-Richoco-84g', 'Nextar Star Double Richoco 84g', 1, 9000, 2000, 
    '<p class="description-text">Mencari sumber semangat untuk setiap aktivitasmu? Nextar Star Double Richoco adalah jawabannya! 
    Dengan star-shape kukis yang unik, terletak kelezatan dalam setiap gigitan. Double cream-nya yang lezat dan melimpah, 
    Nextar Double Richoco adalah kombinasi yang sempurna antara kukis tekstur renyah dan rasa double cream Richoco yang lezat. 
    Cokelatnya bikin semangatmu naik terus!</p>'),
    
    ('PANTENE-GOLD-SERIES-SHAMPOO-125-ML', 'PANTENE GOLD SERIES SHAMPOO 125 ML', 2, 20000, 100, 
    '<p class="description-text">Pantene Pro-V Gold Series Smooth & Sleek Sampo merupakan shampo yang mengandung Vitamin B3, Pro-V, 
    Anti-Oxidant dapat membuat rambut lembut sepanjang hari dan membantu menjaga kekuatan rambut sehingga rambut fleksibel dan
    tidak mudah patah. Gunakan Pantene Kondisioner untuk rambut yang lembut dan mudah diatur.</p>'),
    
    ('Semua-Ada-Prosesnya-Rendy-Arianto', 'Semua Ada Prosesnya - Rendy Arianto', 3, 87000, 50, 
    '<p class="description-text">Disadari atau tidak, hampir semua orang pernah membandingkan dirinya dengan orang lain.
    Kebiasaan ini sering disebut dengan social comparison atau perbandingan sosial. Terkadang, ini bisa menginspirasi 
    dan menyadarkan segala kekurangan yang dimiliki, sehingga memicu diri untuk memperbaikinya dan menjadi lebih baik. 
    Tetapi, membandingkan diri dengan orang lain tidak lagi menjadi hal yang baik ketika orang lain dijadikan standar 
    kualitas hidup. Bahkan, terlalu banyak membandingkan justru bisa menyebabkan hilangnya identitas diri kita, 
    memicu perasaan iri, menurunkan rasa percaya diri, dan menghambat potensi diri.</p>');
SELECT * FROM categories;
SELECT slug, name FROM categories;
SELECT * FROM products;
SELECT 
    p.slug AS product_slug,
    p.name AS product_name,
    p.category_id,
    c.name AS category_name,
    p.price,
    p.stock,
    p.description
FROM 
    products p
LEFT JOIN 
    categories c
ON 
    p.category_id = c.id;

UPDATE products SET price = 10000 WHERE slug = 'Nextar-Star-Double-Richoco-84g';
SELECT * FROM products WHERE slug = 'Nextar-Star-Double-Richoco-84g';
UPDATE products SET price = 11000 WHERE id = 2;
SELECT * FROM products WHERE slug = 'Nextar-Star-Double-Richoco-84g';

DELETE FROM products WHERE id = 4;
SELECT * FROM products;

DELETE FROM products WHERE slug = 'PANTENE-GOLD-SERIES-SHAMPOO-125-ML';
SELECT * FROM products;

DELETE FROM products;
SELECT * FROM products;

SELECT p.slug AS "PRODUCT SLUG", p.name AS "PRODUCT NAME", p.category_id, c.name AS "CATEGORY NAME", p.price AS "PRICE", p.stock AS "STOCK", p.description AS "DESCRIPTION"
FROM
 products p
LEFT JOIN
 categories c
 ON p.category_id = c.id;