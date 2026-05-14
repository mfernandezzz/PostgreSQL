La sentencia ALTER TABLE permite modificar una tabla con el objetivo de agregar, modificar o eliminar columnas de una tabla. Tambien puede ser usado para
eliminar varias restricciones (constraint) a una tabla existente. 

Sintaxis:
ALTER TABLE nombreTabla ADD COLUMN nombreColumna tipodeDato;
ALTER TABLE nombreTabla ADD CONSTRAINT nombre_de_la_restriccion FOREIGN KEY (nombre_columna) REFERENCES tabla(id);

Ejemplo de uso de la sentencia ALTER TABLE para modificar una tabla, agregarle una columna y asignarle una restriccion:
ALTER TABLE film ADD COLUMN director_id INT;
ALTER TABLE film ADD CONSTRAINT fk_film_director FOREIGN KEY(director_id) REFERENCES director(director_id);

Cambiar el tipo de dato de una columna en una tabla:
ALTER TABLE cars
ALTER COLUMN year type VARCHAR(4);  --si el tipo de dato era int, ahora pasara a ser varchar

ALTER TABLE cars
ADD color VARCHAR(50);  --agregar un tipo de dato a la tabla

Creacion de relacion N a N con la tabla intermedia order_details
CREATE TABLE order_details (order_detail_id SERIAL PRIMARY KEY); --crear la tabla intermedia
ALTER TABLE order_details ADD COLUMN order_id INT NOT NULL; --se crea la tabla que almacena la clave foranea order_id
ALTER TABLE order_details ADD COLUMN product_id INT NOT NULL; --se crea la tabla que almacena la clave foranea product_id
ALTER TABLE order_details ADD CONSTRAINT fk_order_details_orders FOREIGN KEY (order_id) REFERENCES orders(order_id);
--se edita la tabla intermedia para añadir la constraint entre la tabla orders y order_details
ALTER TABLE order_details ADD CONSTRAINT fk_order_details_products FOREIGN KEY (product_id) REFERENCES products(product_id);
--se edita la tabla intermedia para añadir la constraint entre la tabla products y order_details

Creacion de relacion N a 1 entre tabla products y tabla categories
ALTER TABLE products ADD COLUMN category_id INT NOT NULL; --se edita la tabla products para agregar la columna que almacenara la clave foranea
ALTER TABLE products ADD CONSTRAINT fk_products_categories FOREIGN KEY (category_id) REFERENCES categories(category_id);
--se edita la tabla products para añadir la constraint entre la tabla products y categories

Creacion de relacion 1 a 1 entre tabla labels y test_products (esta ultima previamente creada)
CREATE TABLE labels (label_id SERIAL PRIMARY KEY); --se crea la tabla labels
ALTER TABLE labels ADD COLUMN label_name VARCHAR(55) NOT NULL;
ALTER TABLE labels ADD COLUMN testproduct_id INT UNIQUE NOT NULL; --se modifica la tabla labels para añadir la columna que almacenara la clafe foranea de la 
--tabla test_products. Se añade la restriccion UNIQUE para asegurar que la clave foranea no se pueda repetir, asegurando la relacion 1 a 1.
ALTER TABLE labels ADD CONSTRAINT fk_labels_testproducts FOREIGN KEY (testproduct_id) REFERENCES test_products(testproduct_id);
