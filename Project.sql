CREATE TABLE "customer_profile" (
  "customer_id" serial PRIMARY KEY,
  "customer_fn" varchar(50),
  "customer_ln" varchar(50),
  "customer_email" varchar(50)
);

CREATE TABLE "employee_profile" (
  "employee_id" serial PRIMARY KEY,
  "employee_fn" varchar(50),
  "employee_ln" varchar(50),
  "job_title" varchar(20)
);

CREATE TABLE "parts" (
  "part_id" serial PRIMARY KEY,
  "part_description" varchar(50),
  "price" numeric(100, 2)
);

CREATE TABLE "dealer_car" (
  "d_car_id" serial PRIMARY KEY,
  "is_used" bool,
  "car_year" integer,
  "car_make" varchar(20),
  "car_model" varchar(40),
  "price" numeric(100, 2)
);

CREATE TABLE "customer_car" (
  "c_car_id" serial PRIMARY KEY,
  "customer_id" integer,
  "car_year" integer,
  "car_make" varchar(20),
  "car_model" varchar(40)
);

CREATE TABLE "invoice" (
  "invoice_id" serial PRIMARY KEY,
  "transaction_date" date,
  "customer_id" integer,
  "purchase" bool,
  "dealership_car_id" integer,
  "service_id" integer,
  "total" numeric(100, 2)
);

CREATE TABLE "service_invoice" (
  "service_id" serial PRIMARY KEY,
  "customer_car" integer,
  "mechanic_id" integer,
  "labor_hours" integer,
  "parts" bool,
  "parts_id" integer
);

ALTER TABLE "customer_car" ADD FOREIGN KEY ("customer_id") REFERENCES "customer_profile" ("customer_id");

ALTER TABLE "service_invoice" ADD FOREIGN KEY ("customer_car") REFERENCES "customer_car" ("c_car_id");

ALTER TABLE "service_invoice" ADD FOREIGN KEY ("mechanic_id") REFERENCES "employee_profile" ("employee_id");

ALTER TABLE "service_invoice" ADD FOREIGN KEY ("parts_id") REFERENCES "parts" ("part_id");

ALTER TABLE "invoice" ADD FOREIGN KEY ("customer_id") REFERENCES "customer_profile" ("customer_id");

ALTER TABLE "invoice" ADD FOREIGN KEY ("dealership_car_id") REFERENCES "dealer_car" ("d_car_id");

ALTER TABLE "invoice" ADD FOREIGN KEY ("service_id") REFERENCES "service_invoice" ("service_id");


--customers

insert into customer_profile(customer_fn, customer_ln, customer_email)
values('Shane', 'Newbanks', 'Shane.Newbanks@gmail.com');

insert into customer_profile(customer_fn, customer_ln, customer_email)
values('Olivia', 'Newbanks', 'ON@gmail.com');

--employee

insert into employee_profile(employee_fn, employee_ln, job_title)
values('Bob', 'Builder', 'Sr Sales Associate');

insert into employee_profile(employee_fn, employee_ln, job_title)
values('Buzz', 'Lightyear', 'Jr Sales Associate');

insert into employee_profile(employee_fn, employee_ln, job_title)
values('FixIt', 'Felix', 'Mechanic');

--Parts

insert into parts(part_description, price)
values('Wheels', '500000');

insert into parts(part_description, price)
values('engine', '1000000');

--Dealer Car

insert into dealer_car(is_used, car_year, car_make, car_model, price)
values('0', '21', 'Nissan', 'Altima', '22999.00');

insert into dealer_car(is_used, car_year, car_make, car_model, price)
values('1', '18', 'Honda', 'Pilot', '19999.00');

--customer car

insert into customer_car(customer_id, car_year, car_make, car_model)
values('1', '21', 'Tesla', 'Model S');

insert into customer_car(customer_id, car_year, car_make, car_model)
values('2', '21', 'Tesla', 'Model 3');

insert into customer_car(customer_id, car_year, car_make, car_model)
values('3', '21', 'Tesla', 'Model X');

-- invoice

insert into invoice(transaction_date, customer_id, purchase, dealer_id, dealership_car_id, service_id, total)
values('11/18/2021', '1', '1', '1', '1', '1','45000.00');

-- service invoice

insert into service_invoice(customer_car, mechanic_id, labor_hours, parts, parts_id)
values('1', '2', '3', '1', '1');

insert into service_invoice(customer_car, mechanic_id, labor_hours, parts, parts_id)
values('2', '1', '5', '1', '2');

