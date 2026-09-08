INSERT INTO Categoria (nombre) VALUES
('Cosméticos'),
('Cuidado de la piel'),
('Perfumes'),
('Accesorios');

INSERT INTO Producto (nombre, descripcion, id_categoria, precio, stock, tipo, tono_color, tipo_piel, componentes, fecha_exp, tipo_aroma, tamaño, material)
VALUES
-- Cosméticos
('Maybelline Fit Me Foundation', 'Base líquida acabado natural', 1, 89.00, 50, 'base', '120 Classic Ivory', NULL, NULL, '2026-12-01', NULL, NULL, NULL),
('MAC Lipstick Ruby Woo', 'Labial rojo icónico', 1, 165.00, 30, 'labial', 'Ruby Woo', NULL, NULL, '2027-05-01', NULL, NULL, NULL),
('Fenty Beauty Gloss Bomb', 'Gloss universal luminador', 1, 140.00, 40, 'gloss', 'Fenty Glow', NULL, NULL, '2027-03-01', NULL, NULL, NULL),
('Urban Decay Naked Palette', 'Paleta de sombras neutras', 1, 420.00, 20, 'sombra', 'Naked', NULL, NULL, '2027-08-01', NULL, NULL, NULL),
('NARS Blush Orgasm', 'Rubor rosado con brillo', 1, 210.00, 25, 'rubor', 'Orgasm', NULL, NULL, '2027-02-01', NULL, NULL, NULL),

-- Cuidado de la piel
('CeraVe Moisturizing Cream', 'Crema hidratante para piel seca', 2, 110.00, 60, NULL, NULL, 'seca', 'ceramidas, ácido hialurónico', '2026-11-01', NULL, NULL, NULL),
('Clinique Dramatically Different Gel', 'Gel hidratante para piel grasa', 2, 230.00, 40, NULL, NULL, 'grasa', 'glicerina, extractos botánicos', '2027-01-01', NULL, NULL, NULL),
('The Ordinary Niacinamide 10%', 'Suero para piel mixta', 2, 95.00, 70, NULL, NULL, 'mixta', 'niacinamida, zinc', '2026-10-01', NULL, NULL, NULL),
('La Roche-Posay Sunscreen SPF 50', 'Protector solar', 2, 180.00, 50, NULL, NULL, 'todos', 'antioxidantes, filtros UV', '2027-06-01', NULL, NULL, NULL),
('Estée Lauder Advanced Night Repair', 'Suero reparador nocturno', 2, 520.00, 30, NULL, NULL, 'todos', 'ácido hialurónico, antioxidantes', '2027-04-01', NULL, NULL, NULL),

-- Perfumes
('Dior Sauvage', 'Fragancia masculina fresca', 3, 850.00, 20, NULL, NULL, NULL, NULL, 'amaderado', '100ml', NULL),
('Carolina Herrera Good Girl', 'Perfume femenino dulce', 3, 780.00, 15, NULL, NULL, NULL, NULL, 'floral dulce', '80ml', NULL),
('Versace Dylan Blue', 'Fragancia masculina intensa', 3, 690.00, 18, NULL, NULL, NULL, NULL, 'cítrico amaderado', '100ml', NULL),
('YSL Black Opium', 'Perfume femenino oriental', 3, 820.00, 12, NULL, NULL, NULL, NULL, 'vainilla café', '90ml', NULL),
('Burberry Her', 'Perfume femenino frutal', 3, 760.00, 14, NULL, NULL, NULL, NULL, 'frutal dulce', '100ml', NULL),

-- Accesorios
('Beauty Blender Original', 'Esponja para maquillaje', 4, 150.00, 40, NULL, NULL, NULL, NULL, NULL, NULL, 'esponja'),
('Real Techniques Brush Set', 'Set de brochas profesionales', 4, 320.00, 25, NULL, NULL, NULL, NULL, NULL, NULL, 'fibra sintética'),
('Tweezerman Slant Tweezer', 'Pinza de cejas', 4, 180.00, 30, NULL, NULL, NULL, NULL, NULL, NULL, 'acero inoxidable'),
('Sephora Eyelash Curler', 'Rizador de pestañas', 4, 140.00, 20, NULL, NULL, NULL, NULL, NULL, NULL, 'metal'),
('NYX Makeup Bag', 'Bolsa de maquillaje', 4, 95.00, 35, NULL, NULL, NULL, NULL, NULL, 'mediana', 'vinilo');

INSERT INTO Cliente (nombre, correo, direccion, telefono) VALUES
('María López', 'maria.lopez@gmail.com', 'Zona 1, Ciudad de Guatemala', '5555-1234'),
('Ana Pérez', 'ana.perez@hotmail.com', 'Mixco, Zona 4', '5555-5678'),
('Carla Gómez', 'carla.gomez@yahoo.com', 'Villa Nueva', '5555-8765'),
('Luis Martínez', 'luis.mtz@gmail.com', 'Zona 10, Guatemala', '5555-1122'),
('Sofía Ramírez', 'sofia.rz@gmail.com', 'San Cristóbal', '5555-3344'),
('Daniel Herrera', 'daniel.herrera@gmail.com', 'Zona 5, Guatemala', '5555-9988'),
('Paola Díaz', 'paola.dz@gmail.com', 'Zona 7, Guatemala', '5555-4433'),
('Andrea Castillo', 'andrea.castillo@gmail.com', 'Zona 12, Guatemala', '5555-2211'),
('Fernando Ruiz', 'fernando.ruiz@gmail.com', 'Zona 9, Guatemala', '5555-7788'),
('Gabriela Torres', 'gabriela.torres@gmail.com', 'Zona 14, Guatemala', '5555-8899');


INSERT INTO Empleado (nombre, fecha_ingreso) VALUES
('Valeria Méndez', '2023-01-10'),
('Carlos López', '2022-05-20'),
('Jimena Aguilar', '2021-11-15'),
('Ricardo Pérez', '2020-03-01'),
('Lucía Hernández', '2024-02-10'),
('Diego Morales', '2023-07-25'),
('Camila Soto', '2022-09-30'),
('Javier Ramos', '2021-04-18'),
('Elena Vargas', '2020-12-05'),
('Mateo Castillo', '2023-03-22');

INSERT INTO Proveedor (empresa, contacto, telefono, direccion) VALUES
('L’Oréal Paris', 'Jean Dupont', '4444-1111', 'París, Francia'),
('Maybelline New York', 'Sarah Johnson', '4444-2222', 'New York, USA'),
('Fenty Beauty', 'Robyn Fenty', '4444-3333', 'Los Ángeles, USA'),
('MAC Cosmetics', 'Emily Carter', '4444-4444', 'Toronto, Canadá'),
('Urban Decay', 'Michael Smith', '4444-5555', 'California, USA'),
('NARS Cosmetics', 'Laura Kim', '4444-6666', 'Nueva York, USA'),
('Clinique', 'Robert Wilson', '4444-7777', 'Illinois, USA'),
('Dior Beauty', 'Pierre Martin', '4444-8888', 'París, Francia'),
('YSL Beauty', 'Camille Laurent', '4444-9999', 'París, Francia'),
('Estée Lauder', 'Helen Brown', '4444-0000', 'Nueva York, USA');
