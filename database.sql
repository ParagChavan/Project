Drop view cardsale;
Drop view cardrent;
Drop table upcoming_projects;
Drop table sale;
Drop table rent;
Drop table payment;
Drop table packers_movers;
Drop table login_buider;
Drop table login;
Drop table flat;
Drop table feedbackuser;
Drop table feedbackbuilder;

CREATE TABLE feedbackbuilder
(
    val integer NOT NULL,
    name character varying NOT NULL,
    email character varying NOT NULL,
    question character varying NOT NULL
);

CREATE TABLE feedbackuser
(
    val integer NOT NULL,
    name character varying NOT NULL,
    email character varying NOT NULL,
    question character varying NOT NULL
);


CREATE TABLE flat
(
    flat_id serial NOT NULL,
    uid integer,
    bid integer,
    location character varying NOT NULL,
    city character varying NOT NULL,
    description character varying NOT NULL,
    amenities character varying NOT NULL,
    area double precision NOT NULL,
    image character varying NOT NULL,
    image1 character varying NOT NULL,
    image2 character varying NOT NULL,
    image3 character varying  NOT NULL,
    time timestamp DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT flat_pkey PRIMARY KEY (flat_id)
);

CREATE TABLE login
(
    uid serial NOT NULL,
    username character varying NOT NULL,
    password character varying NOT NULL,
    name character varying NOT NULL,
    surname character varying NOT NULL,
    email character varying NOT NULL,
    phone bigint,
    CONSTRAINT login_pkey PRIMARY KEY (uid)
);

CREATE TABLE login_builder
(
    bid serial NOT NULL,
    username character varying NOT NULL,
    lno bigint NOT NULL,
    password character varying NOT NULL,
    emailid character varying NOT NULL,
    phoneno bigint NOT NULL,
    nameorg character varying NOT NULL,
    CONSTRAINT login_builder_pkey PRIMARY KEY (bid)
);

CREATE TABLE packers_movers
(
    pid serial NOT NULL,
    name_org character varying NOT NULL,
    contact_no integer NOT NULL,
    email_id character varying NOT NULL,
    CONSTRAINT packers_movers_pkey PRIMARY KEY (pid)
);

CREATE TABLE payment
(
    UID integer NOT NULL,
    buyer character varying NOT NULL,
    Bank_name character varying NOT NULL,
    amount integer NOT NULL,
    Loan_details character varying  NOT NULL,
    chaque_number integer NOT NULL,
    payment_opt character varying NOT NULL,
    CONSTRAINT payment_pkey PRIMARY KEY (UID)
);

CREATE TABLE rent
(
    flat_id integer NOT NULL,
    rent_amount integer NOT NULL,
    deposit_amount integer NOT NULL,
    time_period integer NOT NULL,
    CONSTRAINT rent_ibfk_1 FOREIGN KEY (flat_id)
        REFERENCES flat (flat_id) MATCH SIMPLE
);

CREATE TABLE sale
(
    flat_id integer NOT NULL,
    totalcost double precision NOT NULL,
    rate double precision NOT NULL,
    CONSTRAINT sale_ibfk_1 FOREIGN KEY (flat_id)
        REFERENCES flat (flat_id) MATCH SIMPLE
);

CREATE TABLE upcoming_projects
(
    upid serial NOT NULL,
    bid integer NOT NULL,
    location character varying NOT NULL,
    city character varying NOT NULL,
    comp_time integer NOT NULL,
    CONSTRAINT upcoming_projects_pkey PRIMARY KEY (upid)
);

CREATE OR REPLACE VIEW cardrent
 AS
 SELECT flat.flat_id,
    flat.location,
    flat.city,
    rent.rent_amount,
    flat.image,
    flat."time"
   FROM flat
     JOIN rent ON flat.flat_id = rent.flat_id;

CREATE OR REPLACE VIEW cardsale
 AS
 SELECT flat.flat_id,
    flat.location,
    flat.city,
    sale.totalcost,
    flat.image,
    flat."time"
   FROM flat
     JOIN sale ON flat.flat_id = sale.flat_id;