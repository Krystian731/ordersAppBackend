CREATE DATABASE ordersApp;

use ordersApp;

CREATE TABLE users (
                       id INT AUTO_INCREMENT PRIMARY KEY,
                       username VARCHAR(50) NOT NULL,
                       password VARCHAR(255) NOT NULL
);

CREATE TABLE order_types (
                             id INT AUTO_INCREMENT PRIMARY KEY,
                             user_id INT NOT NULL,
                             name VARCHAR(255) NOT NULL
);

CREATE TABLE orders (
                        id INT AUTO_INCREMENT PRIMARY KEY,
                        user_id INT NOT NULL,
                        order_type_id INT NOT NULL,
                        price float NOT NULL,
                        title VARCHAR(255) NOT NULL,
                        description VARCHAR(255) NOT NULL,
                        client VARCHAR(255) NOT NULL,
                        quantity int NOT NULL,
                        planned_completion_date DATETIME NOT NULL,
                        completed bit NOT NULL DEFAULT 0,
                        FOREIGN KEY (order_type_id) REFERENCES order_types(id),
                        FOREIGN KEY (user_id) REFERENCES users(id)
);

# some mock date to this database

-- Inserting mock data for users
INSERT INTO users (username, password)
VALUES
    ('john_doe', 'password123'),
    ('jane_smith', 'securepass'),
    ('user123', 'pass456');

-- Inserting mock data for order types
INSERT INTO order_types (user_id, name)
VALUES
    (1, 'Standard Order'),
    (2, 'Express Order'),
    (3, 'Custom Order');

-- Inserting mock data for orders
INSERT INTO orders (user_id, order_type_id, price, title, description, client, quantity, planned_completion_date, completed)
VALUES
    (1, 1, 150.00, 'Widget Production', 'Production of widgets', 'ACME Corp', 100, DATE_ADD(NOW(), INTERVAL 1 DAY), 0),
    (2, 2, 300.00, 'Urgent Delivery', 'Delivery of urgent items', 'Fast Logistics', 50, DATE_ADD(NOW(), INTERVAL 3 DAY), 0),
    (3, 3, 500.00, 'Custom Design', 'Designing a custom solution', 'Innovative Designs', 10, DATE_ADD(NOW(), INTERVAL 14 DAY), 0),
    (1, 1, 1000.00, 'Large Order', 'A large bulk order', 'Global Supply Inc', 500, DATE_ADD(NOW(), INTERVAL 10 DAY), 0),
    (2, 3, 750.00, 'Unique Prototype', 'Creating a unique prototype', 'FutureTech', 1, DATE_ADD(NOW(), INTERVAL 21 DAY), 0);

-- Insert more mock data as needed...
