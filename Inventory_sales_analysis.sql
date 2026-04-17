CREATE DATABASE Textile_mis;
USE Textile_mis;

-- Suppliers table
CREATE TABLE suppliers (
	supplier_id INT AUTO_INCREMENT PRIMARY KEY,
    supplier_name VARCHAR(100) NOT NULL,
    contact_person VARCHAR(100),
    phone VARCHAR(20),
    city VARCHAR(50),
    created_at DATE 
);

-- Products table (yarn, fabric, dye chemicals etc.)
CREATE TABLE products (
	product_id INT AUTO_INCREMENT PRIMARY KEY,
	product_name VARCHAR(150) NOT NULL,
    category VARCHAR(50),
    unit VARCHAR(20),
    unit_price DECIMAL(10,2),
    reorder_level INT,
    supplier_id INT,
    FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)
);

-- Inventory table
CREATE TABLE inventory (
    inventory_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    stock_quantity INT NOT NULL DEFAULT 0,
    last_updated DATE,
    warehouse_location VARCHAR(50),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Sales table
CREATE TABLE sales (
    sale_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    sale_date DATE NOT NULL,
    quantity_sold INT NOT NULL,
    unit_price DECIMAL(10,2),
    total_amount DECIMAL(12,2),
    buyer_name VARCHAR(100),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

USE textile_mis;

INSERT INTO suppliers (supplier_name, contact_person, phone, city, created_at) VALUES
('Jamuna Yarn Mills',       'Rafiqul Islam',   '01711-234567', 'Dhaka',      '2023-01-10'),
('Bengal Dye Chemicals',    'Sumon Ahmed',     '01812-345678', 'Narayanganj','2023-02-15'),
('Padma Textile Supplies',  'Hasina Begum',    '01913-456789', 'Gazipur',    '2023-03-01'),
('Meghna Fabric House',     'Kamal Hossain',   '01615-567890', 'Chittagong', '2023-01-20'),
('Brahmaputra Accessories', 'Rania Sultana',   '01716-678901', 'Dhaka',      '2023-04-05');

INSERT INTO products (product_name, category, unit, unit_price, reorder_level, supplier_id) VALUES
('Cotton Yarn 20/1',         'Yarn',        'KG',    180.00,  500,  1),
('Polyester Yarn 30/1',      'Yarn',        'KG',    155.00,  400,  1),
('Viscose Yarn 40/1',        'Yarn',        'KG',    210.00,  300,  1),
('Grey Fabric 120 GSM',      'Fabric',      'Meter',  95.00,  1000, 4),
('Twill Fabric 200 GSM',     'Fabric',      'Meter', 135.00,  800,  4),
('Reactive Dye Red',         'Dye',         'KG',    320.00,  100,  2),
('Reactive Dye Blue',        'Dye',         'KG',    310.00,  100,  2),
('Vat Dye Black',            'Dye',         'KG',    420.00,   80,  2),
('Warp Sizing Chemical',     'Chemical',    'KG',    275.00,  150,  2),
('Bobbin (Plastic)',         'Accessories', 'Piece',   8.50, 2000,  5),
('Shuttle (Wooden)',         'Accessories', 'Piece',  45.00,  500,  5),
('Weaving Needle Set',       'Accessories', 'Set',   120.00,  200,  5);

-- ============================================
-- FULL YEAR SALES DATA (Jan 2024 - Dec 2024)
-- Seasonal patterns included:
-- Eid ul-Fitr peak   : March - April
-- Eid ul-Adha peak   : June
-- Summer slowdown    : July - August
-- Winter/New Year    : November - December
-- ============================================

INSERT INTO sales (product_id, sale_date, quantity_sold, unit_price, total_amount, buyer_name) VALUES

-- ============================================
-- JANUARY (Normal season, steady demand)
-- ============================================
(1, '2024-01-03', 200, 180.00,  36000.00, 'Rahim Garments'),
(4, '2024-01-05', 500,  95.00,  47500.00, 'Star Fashion Ltd'),
(2, '2024-01-08', 150, 155.00,  23250.00, 'Neon Textiles'),
(6, '2024-01-10',  30, 320.00,   9600.00, 'Delta Fabrics'),
(5, '2024-01-13', 300, 135.00,  40500.00, 'Rahim Garments'),
(1, '2024-01-15', 180, 180.00,  32400.00, 'Bengal Weavers'),
(4, '2024-01-17', 420,  95.00,  39900.00, 'Neon Textiles'),
(3, '2024-01-20',  80, 210.00,  16800.00, 'Star Fashion Ltd'),
(7, '2024-01-22',  35, 310.00,  10850.00, 'Delta Fabrics'),
(10,'2024-01-24', 600,   8.50,   5100.00, 'Rahim Garments'),
(2, '2024-01-27', 160, 155.00,  24800.00, 'Bengal Weavers'),
(5, '2024-01-29', 270, 135.00,  36450.00, 'Neon Textiles'),

-- ============================================
-- FEBRUARY (Pre-Eid buildup starts)
-- ============================================
(1, '2024-02-02', 240, 180.00,  43200.00, 'Star Fashion Ltd'),
(4, '2024-02-04', 600,  95.00,  57000.00, 'Rahim Garments'),
(2, '2024-02-06', 200, 155.00,  31000.00, 'Delta Fabrics'),
(5, '2024-02-08', 350, 135.00,  47250.00, 'Neon Textiles'),
(6, '2024-02-10',  40, 320.00,  12800.00, 'Bengal Weavers'),
(3, '2024-02-12', 100, 210.00,  21000.00, 'Star Fashion Ltd'),
(1, '2024-02-14', 260, 180.00,  46800.00, 'Rahim Garments'),
(4, '2024-02-16', 550,  95.00,  52250.00, 'Delta Fabrics'),
(7, '2024-02-18',  45, 310.00,  13950.00, 'Neon Textiles'),
(9, '2024-02-20',  60, 275.00,  16500.00, 'Bengal Weavers'),
(2, '2024-02-22', 220, 155.00,  34100.00, 'Star Fashion Ltd'),
(5, '2024-02-24', 380, 135.00,  51300.00, 'Rahim Garments'),
(10,'2024-02-26', 900,   8.50,   7650.00, 'Delta Fabrics'),
(1, '2024-02-28', 280, 180.00,  50400.00, 'Neon Textiles'),

-- ============================================
-- MARCH (Eid ul-Fitr peak — highest sales)
-- ============================================
(1, '2024-03-01', 400, 180.00,  72000.00, 'Star Fashion Ltd'),
(4, '2024-03-02', 900,  95.00,  85500.00, 'Rahim Garments'),
(5, '2024-03-03', 600, 135.00,  81000.00, 'Bengal Weavers'),
(2, '2024-03-04', 350, 155.00,  54250.00, 'Delta Fabrics'),
(6, '2024-03-05',  70, 320.00,  22400.00, 'Neon Textiles'),
(3, '2024-03-06', 150, 210.00,  31500.00, 'Star Fashion Ltd'),
(1, '2024-03-08', 420, 180.00,  75600.00, 'Rahim Garments'),
(4, '2024-03-10', 850,  95.00,  80750.00, 'Delta Fabrics'),
(7, '2024-03-11',  80, 310.00,  24800.00, 'Bengal Weavers'),
(5, '2024-03-12', 550, 135.00,  74250.00, 'Neon Textiles'),
(8, '2024-03-13',  40, 420.00,  16800.00, 'Star Fashion Ltd'),
(2, '2024-03-14', 380, 155.00,  58900.00, 'Rahim Garments'),
(1, '2024-03-15', 450, 180.00,  81000.00, 'Delta Fabrics'),
(4, '2024-03-16', 950,  95.00,  90250.00, 'Bengal Weavers'),
(6, '2024-03-17',  75, 320.00,  24000.00, 'Neon Textiles'),
(5, '2024-03-18', 620, 135.00,  83700.00, 'Star Fashion Ltd'),
(3, '2024-03-20', 180, 210.00,  37800.00, 'Rahim Garments'),
(11,'2024-03-21', 150,  45.00,   6750.00, 'Delta Fabrics'),
(1, '2024-03-22', 400, 180.00,  72000.00, 'Bengal Weavers'),
(4, '2024-03-24', 880,  95.00,  83600.00, 'Neon Textiles'),
(2, '2024-03-25', 360, 155.00,  55800.00, 'Star Fashion Ltd'),
(5, '2024-03-26', 580, 135.00,  78300.00, 'Rahim Garments'),
(9, '2024-03-27',  80, 275.00,  22000.00, 'Delta Fabrics'),
(1, '2024-03-28', 430, 180.00,  77400.00, 'Bengal Weavers'),
(4, '2024-03-29', 920,  95.00,  87400.00, 'Neon Textiles'),
(6, '2024-03-30',  65, 320.00,  20800.00, 'Star Fashion Ltd'),

-- ============================================
-- APRIL (Post-Eid, still elevated then drops)
-- ============================================
(1, '2024-04-01', 380, 180.00,  68400.00, 'Rahim Garments'),
(4, '2024-04-02', 800,  95.00,  76000.00, 'Delta Fabrics'),
(5, '2024-04-03', 500, 135.00,  67500.00, 'Bengal Weavers'),
(2, '2024-04-05', 300, 155.00,  46500.00, 'Neon Textiles'),
(3, '2024-04-07', 120, 210.00,  25200.00, 'Star Fashion Ltd'),
(1, '2024-04-09', 320, 180.00,  57600.00, 'Rahim Garments'),
(4, '2024-04-11', 680,  95.00,  64600.00, 'Delta Fabrics'),
(6, '2024-04-13',  50, 320.00,  16000.00, 'Bengal Weavers'),
(5, '2024-04-15', 400, 135.00,  54000.00, 'Neon Textiles'),
(2, '2024-04-17', 250, 155.00,  38750.00, 'Star Fashion Ltd'),
(7, '2024-04-19',  55, 310.00,  17050.00, 'Rahim Garments'),
(1, '2024-04-21', 280, 180.00,  50400.00, 'Delta Fabrics'),
(4, '2024-04-23', 600,  95.00,  57000.00, 'Bengal Weavers'),
(10,'2024-04-25',1000,   8.50,   8500.00, 'Neon Textiles'),
(5, '2024-04-27', 350, 135.00,  47250.00, 'Star Fashion Ltd'),
(3, '2024-04-29',  90, 210.00,  18900.00, 'Rahim Garments'),

-- ============================================
-- MAY (Normal, mild demand)
-- ============================================
(1, '2024-05-02', 220, 180.00,  39600.00, 'Delta Fabrics'),
(4, '2024-05-04', 480,  95.00,  45600.00, 'Bengal Weavers'),
(2, '2024-05-06', 190, 155.00,  29450.00, 'Neon Textiles'),
(5, '2024-05-08', 320, 135.00,  43200.00, 'Star Fashion Ltd'),
(6, '2024-05-10',  35, 320.00,  11200.00, 'Rahim Garments'),
(1, '2024-05-13', 200, 180.00,  36000.00, 'Delta Fabrics'),
(3, '2024-05-15',  80, 210.00,  16800.00, 'Bengal Weavers'),
(4, '2024-05-17', 500,  95.00,  47500.00, 'Neon Textiles'),
(7, '2024-05-19',  40, 310.00,  12400.00, 'Star Fashion Ltd'),
(2, '2024-05-21', 170, 155.00,  26350.00, 'Rahim Garments'),
(5, '2024-05-23', 290, 135.00,  39150.00, 'Delta Fabrics'),
(9, '2024-05-25',  55, 275.00,  15125.00, 'Bengal Weavers'),
(1, '2024-05-27', 210, 180.00,  37800.00, 'Neon Textiles'),
(12,'2024-05-29',  70, 120.00,   8400.00, 'Star Fashion Ltd'),

-- ============================================
-- JUNE (Eid ul-Adha peak — fabric surge)
-- ============================================
(4, '2024-06-01', 850,  95.00,  80750.00, 'Rahim Garments'),
(5, '2024-06-02', 580, 135.00,  78300.00, 'Delta Fabrics'),
(1, '2024-06-03', 370, 180.00,  66600.00, 'Bengal Weavers'),
(2, '2024-06-04', 320, 155.00,  49600.00, 'Neon Textiles'),
(6, '2024-06-05',  65, 320.00,  20800.00, 'Star Fashion Ltd'),
(4, '2024-06-07', 900,  95.00,  85500.00, 'Rahim Garments'),
(5, '2024-06-08', 620, 135.00,  83700.00, 'Delta Fabrics'),
(3, '2024-06-09', 160, 210.00,  33600.00, 'Bengal Weavers'),
(1, '2024-06-10', 400, 180.00,  72000.00, 'Neon Textiles'),
(7, '2024-06-11',  75, 310.00,  23250.00, 'Star Fashion Ltd'),
(4, '2024-06-12', 780,  95.00,  74100.00, 'Rahim Garments'),
(2, '2024-06-13', 350, 155.00,  54250.00, 'Delta Fabrics'),
(8, '2024-06-14',  45, 420.00,  18900.00, 'Bengal Weavers'),
(5, '2024-06-15', 600, 135.00,  81000.00, 'Neon Textiles'),
(1, '2024-06-17', 420, 180.00,  75600.00, 'Star Fashion Ltd'),
(4, '2024-06-19', 820,  95.00,  77900.00, 'Rahim Garments'),
(6, '2024-06-20',  70, 320.00,  22400.00, 'Delta Fabrics'),
(5, '2024-06-21', 560, 135.00,  75600.00, 'Bengal Weavers'),
(2, '2024-06-23', 300, 155.00,  46500.00, 'Neon Textiles'),
(11,'2024-06-25', 120,  45.00,   5400.00, 'Star Fashion Ltd'),

-- ============================================
-- JULY (Summer slowdown — lowest sales)
-- ============================================
(1, '2024-07-03', 120, 180.00,  21600.00, 'Rahim Garments'),
(4, '2024-07-06', 280,  95.00,  26600.00, 'Delta Fabrics'),
(2, '2024-07-09', 100, 155.00,  15500.00, 'Bengal Weavers'),
(5, '2024-07-12', 180, 135.00,  24300.00, 'Neon Textiles'),
(3, '2024-07-15',  50, 210.00,  10500.00, 'Star Fashion Ltd'),
(1, '2024-07-18', 130, 180.00,  23400.00, 'Rahim Garments'),
(4, '2024-07-21', 260,  95.00,  24700.00, 'Delta Fabrics'),
(6, '2024-07-24',  20, 320.00,   6400.00, 'Bengal Weavers'),
(2, '2024-07-27',  90, 155.00,  13950.00, 'Neon Textiles'),
(9, '2024-07-30',  30, 275.00,   8250.00, 'Star Fashion Ltd'),

-- ============================================
-- AUGUST (Summer slowdown continues)
-- ============================================
(1, '2024-08-02', 130, 180.00,  23400.00, 'Rahim Garments'),
(4, '2024-08-05', 290,  95.00,  27550.00, 'Delta Fabrics'),
(5, '2024-08-08', 190, 135.00,  25650.00, 'Bengal Weavers'),
(2, '2024-08-11', 110, 155.00,  17050.00, 'Neon Textiles'),
(3, '2024-08-14',  55, 210.00,  11550.00, 'Star Fashion Ltd'),
(7, '2024-08-17',  25, 310.00,   7750.00, 'Rahim Garments'),
(1, '2024-08-20', 140, 180.00,  25200.00, 'Delta Fabrics'),
(4, '2024-08-23', 310,  95.00,  29450.00, 'Bengal Weavers'),
(6, '2024-08-26',  22, 320.00,   7040.00, 'Neon Textiles'),
(10,'2024-08-29', 400,   8.50,   3400.00, 'Star Fashion Ltd'),

-- ============================================
-- SEPTEMBER (Recovery begins)
-- ============================================
(1, '2024-09-02', 200, 180.00,  36000.00, 'Rahim Garments'),
(4, '2024-09-05', 450,  95.00,  42750.00, 'Delta Fabrics'),
(2, '2024-09-08', 170, 155.00,  26350.00, 'Bengal Weavers'),
(5, '2024-09-10', 280, 135.00,  37800.00, 'Neon Textiles'),
(1, '2024-09-12', 220, 180.00,  39600.00, 'Star Fashion Ltd'),
(3, '2024-09-14',  75, 210.00,  15750.00, 'Rahim Garments'),
(4, '2024-09-17', 480,  95.00,  45600.00, 'Delta Fabrics'),
(6, '2024-09-19',  35, 320.00,  11200.00, 'Bengal Weavers'),
(2, '2024-09-21', 190, 155.00,  29450.00, 'Neon Textiles'),
(5, '2024-09-24', 310, 135.00,  41850.00, 'Star Fashion Ltd'),
(7, '2024-09-26',  45, 310.00,  13950.00, 'Rahim Garments'),
(1, '2024-09-28', 230, 180.00,  41400.00, 'Delta Fabrics'),

-- ============================================
-- OCTOBER (Pre-winter buildup)
-- ============================================
(1, '2024-10-01', 260, 180.00,  46800.00, 'Bengal Weavers'),
(4, '2024-10-03', 520,  95.00,  49400.00, 'Neon Textiles'),
(5, '2024-10-05', 340, 135.00,  45900.00, 'Star Fashion Ltd'),
(2, '2024-10-07', 210, 155.00,  32550.00, 'Rahim Garments'),
(3, '2024-10-09',  95, 210.00,  19950.00, 'Delta Fabrics'),
(1, '2024-10-11', 280, 180.00,  50400.00, 'Bengal Weavers'),
(4, '2024-10-14', 560,  95.00,  53200.00, 'Neon Textiles'),
(6, '2024-10-16',  45, 320.00,  14400.00, 'Star Fashion Ltd'),
(8, '2024-10-18',  35, 420.00,  14700.00, 'Rahim Garments'),
(2, '2024-10-20', 230, 155.00,  35650.00, 'Delta Fabrics'),
(5, '2024-10-22', 370, 135.00,  49950.00, 'Bengal Weavers'),
(1, '2024-10-24', 290, 180.00,  52200.00, 'Neon Textiles'),
(9, '2024-10-26',  65, 275.00,  17875.00, 'Star Fashion Ltd'),
(4, '2024-10-28', 580,  95.00,  55100.00, 'Rahim Garments'),

-- ============================================
-- NOVEMBER (Winter peak begins — blanket/heavy fabric surge)
-- ============================================
(5, '2024-11-01', 500, 135.00,  67500.00, 'Delta Fabrics'),
(4, '2024-11-02', 700,  95.00,  66500.00, 'Bengal Weavers'),
(1, '2024-11-04', 350, 180.00,  63000.00, 'Neon Textiles'),
(3, '2024-11-06', 140, 210.00,  29400.00, 'Star Fashion Ltd'),
(2, '2024-11-07', 280, 155.00,  43400.00, 'Rahim Garments'),
(5, '2024-11-08', 520, 135.00,  70200.00, 'Delta Fabrics'),
(4, '2024-11-09', 720,  95.00,  68400.00, 'Bengal Weavers'),
(6, '2024-11-10',  60, 320.00,  19200.00, 'Neon Textiles'),
(1, '2024-11-11', 370, 180.00,  66600.00, 'Star Fashion Ltd'),
(8, '2024-11-13',  50, 420.00,  21000.00, 'Rahim Garments'),
(5, '2024-11-14', 540, 135.00,  72900.00, 'Delta Fabrics'),
(2, '2024-11-15', 300, 155.00,  46500.00, 'Bengal Weavers'),
(4, '2024-11-17', 680,  95.00,  64600.00, 'Neon Textiles'),
(7, '2024-11-19',  70, 310.00,  21700.00, 'Star Fashion Ltd'),
(1, '2024-11-20', 390, 180.00,  70200.00, 'Rahim Garments'),
(5, '2024-11-22', 560, 135.00,  75600.00, 'Delta Fabrics'),
(3, '2024-11-23', 150, 210.00,  31500.00, 'Bengal Weavers'),
(4, '2024-11-25', 750,  95.00,  71250.00, 'Neon Textiles'),
(2, '2024-11-27', 310, 155.00,  48050.00, 'Star Fashion Ltd'),
(11,'2024-11-29', 130,  45.00,   5850.00, 'Rahim Garments'),

-- ============================================
-- DECEMBER (Winter peak + year-end orders)
-- ============================================
(5, '2024-12-01', 580, 135.00,  78300.00, 'Delta Fabrics'),
(4, '2024-12-02', 800,  95.00,  76000.00, 'Bengal Weavers'),
(1, '2024-12-03', 400, 180.00,  72000.00, 'Neon Textiles'),
(2, '2024-12-04', 330, 155.00,  51150.00, 'Star Fashion Ltd'),
(3, '2024-12-05', 160, 210.00,  33600.00, 'Rahim Garments'),
(6, '2024-12-06',  70, 320.00,  22400.00, 'Delta Fabrics'),
(5, '2024-12-07', 600, 135.00,  81000.00, 'Bengal Weavers'),
(4, '2024-12-08', 820,  95.00,  77900.00, 'Neon Textiles'),
(8, '2024-12-09',  55, 420.00,  23100.00, 'Star Fashion Ltd'),
(1, '2024-12-10', 420, 180.00,  75600.00, 'Rahim Garments'),
(2, '2024-12-11', 350, 155.00,  54250.00, 'Delta Fabrics'),
(5, '2024-12-12', 620, 135.00,  83700.00, 'Bengal Weavers'),
(4, '2024-12-14', 850,  95.00,  80750.00, 'Neon Textiles'),
(7, '2024-12-15',  80, 310.00,  24800.00, 'Star Fashion Ltd'),
(1, '2024-12-16', 440, 180.00,  79200.00, 'Rahim Garments'),
(3, '2024-12-17', 170, 210.00,  35700.00, 'Delta Fabrics'),
(5, '2024-12-18', 640, 135.00,  86400.00, 'Bengal Weavers'),
(4, '2024-12-19', 870,  95.00,  82650.00, 'Neon Textiles'),
(9, '2024-12-20',  90, 275.00,  24750.00, 'Star Fashion Ltd'),
(2, '2024-12-21', 360, 155.00,  55800.00, 'Rahim Garments'),
(1, '2024-12-22', 450, 180.00,  81000.00, 'Delta Fabrics'),
(6, '2024-12-23',  75, 320.00,  24000.00, 'Bengal Weavers'),
(5, '2024-12-24', 660, 135.00,  89100.00, 'Neon Textiles'),
(4, '2024-12-26', 900,  95.00,  85500.00, 'Star Fashion Ltd'),
(12,'2024-12-27',  90, 120.00,  10800.00, 'Rahim Garments'),
(1, '2024-12-28', 460, 180.00,  82800.00, 'Delta Fabrics'),
(2, '2024-12-29', 370, 155.00,  57350.00, 'Bengal Weavers'),
(5, '2024-12-30', 680, 135.00,  91800.00, 'Neon Textiles'),
(4, '2024-12-31', 920,  95.00,  87400.00, 'Star Fashion Ltd');

-- Monthly sale analysis
SELECT 
    MONTH(sale_date) AS month_num,
    MONTHNAME(sale_date) AS month_name,
    COUNT(*) AS transactions,
    SUM(total_amount) AS total_revenue
FROM sales
GROUP BY MONTH(sale_date), MONTHNAME(sale_date)
ORDER BY month_num;