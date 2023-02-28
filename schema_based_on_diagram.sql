CREATE TABLE patients(
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(250),
  date_of_birth DATE,
  PRIMARY KEY(id)
);

CREATE TABLE medical_histories(
  id INT GENERATED ALWAYS AS IDENTITY,
  admitted_at TIMESTAMP,
  patient_id INT,
  CONSTRAINT patient_id_fk  FOREIGN KEY (patient_id) REFERENCES patients(id),
  status VARCHAR(250),
  PRIMARY KEY(id)
);

CREATE TABLE invoices(
  id INT GENERATED ALWAYS AS IDENTITY,
  total_amount DECIMAL,
  generated_at TIMESTAMP,
  payed_at TIMESTAMP,
  medical_history_id INT,
  CONSTRAINT medical_history_id_fk FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id),
  PRIMARY KEY(id)
);

CREATE TABLE treatments(
id INT GENERATED ALWAYS AS IDENTITY,
type VARCHAR(250),
name VARCHAR(250),
PRIMARY KEY(id)
);

CREATE TABLE invoice_items(
id INT GENERATED ALWAYS AS IDENTITY,
unit_price DECIMAL,
quantity INT,
total_price DECIMAL,
invoice_id INT,
treatment_id INT,
CONSTRAINT invoice_id_fk FOREIGN KEY (invoice_id) REFERENCES invoices(id),
CONSTRAINT treatment_id_fk FOREIGN KEY (treatment_id) REFERENCES treatments(id),
PRIMARY KEY(id)
);

CREATE TABLE medical_histories_treatments(
id INT GENERATED ALWAYS AS IDENTITY,
medical_histories_id INT,
treatments_id INT,
CONSTRAINT histories_id_fk FOREIGN KEY (medical_histories_id) REFERENCES medical_histories(id),
CONSTRAINT treatments_id_fk FOREIGN KEY (treatments_id) REFERENCES treatments(id),
PRIMARY KEY(id)
);
