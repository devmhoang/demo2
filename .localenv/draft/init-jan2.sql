-- Insert 3  users
INSERT INTO demo2.users (customid, email, password, region, geodata, latitude, longitude, role) VALUES
('USR001', 'farmer.chicago@example.com', 'hashed_password_1', 'Illinois', ST_SetSRID(ST_MakePoint(-87.6298, 41.8781), 4326), 41.8781, -87.6298, 'farmer'),
('USR002', 'farmer.kc@example.com', 'hashed_password_2', 'Missouri', ST_SetSRID(ST_MakePoint(-94.5786, 39.0997), 4326), 39.0997, -94.5786, 'farmer'),
('USR003', 'farmer.minneapolis@example.com', 'hashed_password_3', 'Minnesota', ST_SetSRID(ST_MakePoint(-93.2650, 44.9778), 4326), 44.9778, -93.2650, 'farmer');

-- Insert 6 products
INSERT INTO demo2.products (customid, user_id, product_name, product_desc, product_price, product_stock) VALUES
('PRD001', (SELECT id FROM demo2.users WHERE email = 'farmer.chicago@example.com'), 'Organic Sweet Corn', 'Fresh sweet corn harvested daily from our Illinois farm', 450, 200),
('PRD002', (SELECT id FROM demo2.users WHERE email = 'farmer.chicago@example.com'), 'Farm Fresh Eggs', 'Free-range chicken eggs, dozen', 600, 150),
('PRD003', (SELECT id FROM demo2.users WHERE email = 'farmer.kc@example.com'), 'Premium Wheat Flour', 'Stone-ground whole wheat flour, 5lb bag', 800, 100),
('PRD004', (SELECT id FROM demo2.users WHERE email = 'farmer.kc@example.com'), 'Raw Honey', 'Pure wildflower honey from Missouri apiaries, 16oz jar', 1200, 75),
('PRD005', (SELECT id FROM demo2.users WHERE email = 'farmer.minneapolis@example.com'), 'Wild Rice', 'Authentic Minnesota wild rice, 2lb bag', 1500, 50),
('PRD006', (SELECT id FROM demo2.users WHERE email = 'farmer.minneapolis@example.com'), 'Organic Soybeans', 'Non-GMO organic soybeans, 10lb bag', 2000, 80);

-- Create spatial index
CREATE INDEX idx_users_geodata ON demo2.users USING GIST(geodata);