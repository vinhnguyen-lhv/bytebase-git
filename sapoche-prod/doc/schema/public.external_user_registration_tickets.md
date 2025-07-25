# public.external_user_registration_tickets

## Description

## Columns

| Name          | Type                           | Default                                                        | Nullable |
| ------------- | ------------------------------ | -------------------------------------------------------------- | -------- |
| id            | bigint                         | nextval('external_user_registration_tickets_id_seq'::regclass) | false    |
| first_name    | varchar(255)                   |                                                                | false    |
| last_name     | varchar(255)                   |                                                                | false    |
| specialty     | json                           |                                                                | false    |
| mobile_phone  | varchar(20)                    |                                                                | true     |
| email         | varchar(255)                   |                                                                | true     |
| practice_name | varchar(255)                   |                                                                | true     |
| created_at    | timestamp(0) without time zone |                                                                | true     |
| updated_at    | timestamp(0) without time zone |                                                                | true     |

## Constraints

| Name                                    | Type        | Definition       |
| --------------------------------------- | ----------- | ---------------- |
| external_user_registration_tickets_pkey | PRIMARY KEY | PRIMARY KEY (id) |

## Indexes

| Name                                                | Definition                                                                                                                             |
| --------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------- |
| external_user_registration_tickets_pkey             | CREATE UNIQUE INDEX external_user_registration_tickets_pkey ON public.external_user_registration_tickets USING btree (id)              |
| external_user_registration_tickets_created_at_index | CREATE INDEX external_user_registration_tickets_created_at_index ON public.external_user_registration_tickets USING btree (created_at) |
| external_user_registration_tickets_updated_at_index | CREATE INDEX external_user_registration_tickets_updated_at_index ON public.external_user_registration_tickets USING btree (updated_at) |

## Relations

![er](public.external_user_registration_tickets.svg)

---

> Generated by [tbls](https://github.com/k1LoW/tbls)
