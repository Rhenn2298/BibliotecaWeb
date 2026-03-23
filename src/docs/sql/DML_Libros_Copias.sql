-- ===================================
-- LIBROS
-- ===================================
-- FICCION 
INSERT INTO libros VALUES 
('100001', 'Cien años de soledad', 'Gabriel García Márquez', 'FICCION', 'Sudamericana', 1967),
('100002', 'El amor en los tiempos del cólera', 'Gabriel García Márquez', 'FICCION', 'Oveja Negra', 1985),
('100003', 'La casa de los espíritus', 'Isabel Allende', 'FICCION', 'Plaza & Janés', 1982),
('100004', 'Como agua para chocolate', 'Laura Esquivel', 'FICCION', 'Planeta', 1989);
-- NOVELA 
INSERT INTO libros VALUES 
('200001', 'El Quijote', 'Miguel de Cervantes', 'NOVELA', 'Francisco de Robles', 1605),
('200002', 'Madame Bovary', 'Gustave Flaubert', 'NOVELA', 'Michel Lévy', 1856);
-- CIENCIA
INSERT INTO libros VALUES 
('300001', 'Una breve historia del tiempo', 'Stephen Hawking', 'CIENCIA', 'Bantam Books', 1988),
('300002', 'El universo en una cáscara de nuez', 'Stephen Hawking', 'CIENCIA', 'Bantam Press', 2001),
('300003', 'Cosmos', 'Carl Sagan', 'CIENCIA', 'Random House', 1980);
-- HISTORIA 
INSERT INTO libros VALUES 
('400001', 'Armas, gérmenes y acero', 'Jared Diamond', 'HISTORIA', 'W.W. Norton', 1997),
('400002', '1491: Una nueva historia de las Américas', 'Charles C. Mann', 'HISTORIA', 'Knopf', 2005),
('400003', 'El fin de la historia', 'Francis Fukuyama', 'HISTORIA', 'Free Press', 1992),
('400004', 'La caída del muro', 'Peter Sarsinelli', 'HISTORIA', 'Planeta', 2009);
-- FILOSOFIA
INSERT INTO libros VALUES 
('500001', 'Crítica de la razón pura', 'Immanuel Kant', 'FILOSOFIA', 'Jauche', 1781);
-- DRAMA
INSERT INTO libros VALUES 
('600001', 'La casa de Bernarda Alba', 'Federico García Lorca', 'DRAMA', 'Cruz y Raya', 1936),
('600002', 'Hamlet', 'William Shakespeare', 'DRAMA', 'Thomas Nelson', 1603);
-- AVENTURA
INSERT INTO libros VALUES 
('700001', 'La isla del tesoro', 'Robert Louis Stevenson', 'AVENTURA', 'Cassell', 1882),
('700002', 'Veinte mil leguas de viaje submarino', 'Jules Verne', 'AVENTURA', 'Hetzel', 1870),
('700003', 'Viaje al centro de la tierra', 'Jules Verne', 'AVENTURA', 'Hetzel', 1864),
('700004', 'El conde de Montecristo', 'Alexandre Dumas', 'AVENTURA', 'Picquet', 1844),
('700005', 'Los tres mosqueteros', 'Alexandre Dumas', 'AVENTURA', 'Sermoyer', 1844);
-- FANTASIA
INSERT INTO libros VALUES 
('800001', 'Harry Potter y la piedra filosofal', 'J.K. Rowling', 'FANTASIA', 'Bloomsbury', 1997),
('800002', 'El señor de los anillos', 'J.R.R. Tolkien', 'FANTASIA', 'Allen & Unwin', 1954),
('800003', 'Las crónicas de Narnia', 'C.S. Lewis', 'FANTASIA', 'Geoffrey Bles', 1950);
-- ===================================
-- COPIAS
-- ===================================
-- Ficción
INSERT INTO copias (id_copia, isbn, número_copia, disponible) VALUES 
('100001CN01', '100001', 1, true),
('100001CN02', '100001', 2, true),
('100001CN03', '100001', 3, true),
('100002CN01', '100002', 1, true),
('100002CN02', '100002', 2, true),
('100002CN03', '100002', 3, true),
('100003CN01', '100003', 1, true),
('100003CN02', '100003', 2, true),
('100003CN03', '100003', 3, true),
('100004CN01', '100004', 1, true),
('100004CN02', '100004', 2, true),
('100004CN03', '100004', 3, true);
-- Novelas
INSERT INTO copias (id_copia, isbn, número_copia, disponible) VALUES 
('200001CN01', '200001', 1, true),
('200001CN02', '200001', 2, true),
('200001CN03', '200001', 3, true),
('200002CN01', '200002', 1, true),
('200002CN02', '200002', 2, true),
('200002CN03', '200002', 3, true);
-- Ciencia
INSERT INTO copias (id_copia, isbn, número_copia, disponible) VALUES 
('300001CN01', '300001', 1, true),
('300001CN02', '300001', 2, true),
('300001CN03', '300001', 3, true),
('300002CN01', '300002', 1, true),
('300002CN02', '300002', 2, true),
('300002CN03', '300002', 3, true),
('300003CN01', '300003', 1, true),
('300003CN02', '300003', 2, true),
('300003CN03', '300003', 3, true);
-- Historia
INSERT INTO copias (id_copia, isbn, número_copia, disponible) VALUES 
('400001CN01', '400001', 1, true),
('400001CN02', '400001', 2, true),
('400001CN03', '400001', 3, true),
('400002CN01', '400002', 1, true),
('400002CN02', '400002', 2, true),
('400002CN03', '400002', 3, true),
('400003CN01', '400003', 1, true),
('400003CN02', '400003', 2, true),
('400003CN03', '400003', 3, true),
('400004CN01', '400004', 1, true),
('400004CN02', '400004', 2, true),
('400004CN03', '400004', 3, true);
-- Filosofía
INSERT INTO copias (id_copia, isbn, número_copia, disponible) VALUES 
('500001CN01', '500001', 1, true),
('500001CN02', '500001', 2, true),
('500001CN03', '500001', 3, true);
-- Drama
INSERT INTO copias (id_copia, isbn, número_copia, disponible) VALUES 
('600001CN01', '600001', 1, true),
('600001CN02', '600001', 2, true),
('600001CN03', '600001', 3, true),
('600002CN01', '600002', 1, true),
('600002CN02', '600002', 2, true),
('600002CN03', '600002', 3, true);
-- Aventura
INSERT INTO copias (id_copia, isbn, número_copia, disponible) VALUES 
('700001CN01', '700001', 1, true),
('700001CN02', '700001', 2, true),
('700001CN03', '700001', 3, true),
('700002CN01', '700002', 1, true),
('700002CN02', '700002', 2, true),
('700002CN03', '700002', 3, true),
('700003CN01', '700003', 1, true),
('700003CN02', '700003', 2, true),
('700003CN03', '700003', 3, true),
('700004CN01', '700004', 1, true),
('700004CN02', '700004', 2, true),
('700004CN03', '700004', 3, true),
('700005CN01', '700005', 1, true),
('700005CN02', '700005', 2, true),
('700005CN03', '700005', 3, true);
-- Fantasía
INSERT INTO copias (id_copia, isbn, número_copia, disponible) VALUES 
('800001CN01', '800001', 1, true),
('800001CN02', '800001', 2, true),
('800001CN03', '800001', 3, true),
('800002CN01', '800002', 1, true),
('800002CN02', '800002', 2, true),
('800002CN03', '800002', 3, true),
('800003CN01', '800003', 1, true),
('800003CN02', '800003', 2, true),
('800003CN03', '800003', 3, true);
-- Prestamo vencido
INSERT INTO prestamos (rut, id_copia, fecha_solicitud, fecha_entrega, fecha_vencimiento, estado)
VALUES (
    '19876543-2',
    '200001CN03',
    '2024-10-01',
    '2024-10-05',
    '2024-12-05',
    'VENCIDO'
);