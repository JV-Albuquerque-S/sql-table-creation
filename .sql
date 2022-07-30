CREATE DATABASE "Modelagem-tabelas";

CREATE TABLE "customers" (
    "id" SERIAL PRIMARY KEY,
    "fullName" TEXT NOT NULL,
    "cpf" BIGINT UNIQUE NOT NULL,
    "email" VARCHAR(50) UNIQUE NOT NULL,
    "password" VARCHAR(30) NOT NULL
);

CREATE TABLE "customerPhones" (
    "id" SERIAL PRIMARY KEY,
    "customerId" INTEGER NOT NULL REFERENCES "customers"("id"),
    "number" BIGINT UNIQUE NOT NULL,
    "type" TEXT NULL
);

CREATE TABLE "customerAdress" (
    "id" SERIAL PRIMARY KEY,
    "customerId" INTEGER NOT NULL REFERENCES "customers"("id"),
    "street" TEXT NOT NULL,
    "number" INT NOT NULL,
    "complement" TEXT NULL,
    "postalCode" INT NOT NULL,
    "cityId" INTEGER NOT NULL REFERENCES "cities"("id")
);

CREATE TABLE "cities" (
    "id" SERIAL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "stateId" INTEGER NOT NULL REFERENCES "states"("id")
);

CREATE TABLE "states" (
    "id" SERIAL PRIMARY KEY,
    "name" TEXT NOT NULL
);

CREATE TABLE "bankAccount" (
    "id" SERIAL PRIMARY KEY,
    "customerId" INTEGER NOT NULL REFERENCES "customers"("id"),
    "accountNumber" INTEGER UNIQUE NOT NULL,
    "agency" INTEGER NOT NULL,
    "openDate" TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT NOW(),
    "closeDate" TIMESTAMP WITHOUT TIME ZONE NOT NULL
);

CREATE TABLE "transactions" (
    "id" SERIAL PRIMARY KEY,
    "banlAccountId" INTEGER NOT NULL REFERENCES "bankAccount"("id"),
    "amount" BIGINT NOT NULL,
    "type" TEXT NOT NULL,
    "time" TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    "description" TEXT NOT NULL,
    "canceled" BOOL NOT NULL
);

CREATE TABLE "creditCards" (
    "id" SERIAL PRIMARY KEY,
    "banlAccountId" INTEGER NOT NULL REFERENCES "bankAccount"("id"),
    "name" TEXT NOT NULL,
    "number" INTEGER UNIQUE NOT NULL,
    "securityCode" INTEGER NOT NULL,
    "expirationMonth" TEXT NOT NULL,
    "expirationYear" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "limit" BIGINT NOT NULL
);