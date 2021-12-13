CREATE TABLE IF NOT EXISTS "client" (
  "id" SERIAL PRIMARY KEY NOT NULL,
  "full_name" TEXT NOT NULL,
  "passport" TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS "users" (
  "id" SERIAL PRIMARY KEY NOT NULL,
  "fullname" varchar(255) NOT NULL,
  "username" varchar(255) NOT NULL,
  "email" varchar(255) NOT NULL,
  "password" varchar(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS "contract" (
  "id" SERIAL PRIMARY KEY NOT NULL,
  "number" INTEGER NOT NULL,
  "adress" TEXT NOT NULL,
  "client_id" INTEGER NOT NULL,
  "start_date" timestamp NOT NULL,
  "end_date" timestamp NOT NULL,
  "id_pos" INTEGER NOT NULL,
  "sum" DOUBLE PRECISION NOT NULL
);

CREATE TABLE IF NOT EXISTS "package_of_services" (
  "id" SERIAL PRIMARY KEY NOT NULL,
  "name" TEXT NOT NULL,
  "month_payment" double precision NOT NULL
);

CREATE TABLE IF NOT EXISTS "service_package_of_services" (
  "id" SERIAL PRIMARY KEY NOT NULL,
  "id_pos" INTEGER NOT NULL,
  "id_service" INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS "service" (
  "id" SERIAL PRIMARY KEY NOT NULL,
  "name" TEXT NOT NULL,
  "cost" double precision NOT NULL
);

CREATE TABLE IF NOT EXISTS "payment" (
  "id" SERIAL PRIMARY KEY NOT NULL,
  "id_contract" INTEGER NOT NULL,
  "month" INTEGER NOT NULL,
  "year" INTEGER NOT NULL,
  "sum" double precision NOT NULL,
  "date_of_payment" timestamp NOT NULL
);


ALTER TABLE "service_package_of_services" ADD FOREIGN KEY ("id_service") REFERENCES "service" ("id");

ALTER TABLE "service_package_of_services" ADD FOREIGN KEY ("id_pos") REFERENCES "package_of_services" ("id");

ALTER TABLE "contract" ADD FOREIGN KEY ("client_id") REFERENCES "client" ("id");

ALTER TABLE "users" ADD FOREIGN KEY ("id") REFERENCES "client" ("id");

ALTER TABLE "payment" ADD FOREIGN KEY ("id_contract") REFERENCES "contract" ("id");

ALTER TABLE "contract" ADD FOREIGN KEY ("id_pos") REFERENCES "package_of_services" ("id");
