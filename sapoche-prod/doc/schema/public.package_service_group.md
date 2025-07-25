# public.package_service_group

## Description

## Columns

| Name             | Type   | Default                                           | Nullable | Parents                                           |
| ---------------- | ------ | ------------------------------------------------- | -------- | ------------------------------------------------- |
| id               | bigint | nextval('package_service_group_id_seq'::regclass) | false    |                                                   |
| package_id       | bigint |                                                   | false    | [public.packages](public.packages.md)             |
| service_group_id | bigint |                                                   | false    | [public.service_groups](public.service_groups.md) |

## Constraints

| Name                                           | Type        | Definition                                                                     |
| ---------------------------------------------- | ----------- | ------------------------------------------------------------------------------ |
| package_service_group_service_group_id_foreign | FOREIGN KEY | FOREIGN KEY (service_group_id) REFERENCES service_groups(id) ON DELETE CASCADE |
| package_service_group_package_id_foreign       | FOREIGN KEY | FOREIGN KEY (package_id) REFERENCES packages(id) ON DELETE CASCADE             |
| package_service_group_pkey                     | PRIMARY KEY | PRIMARY KEY (id)                                                               |

## Indexes

| Name                       | Definition                                                                                      |
| -------------------------- | ----------------------------------------------------------------------------------------------- |
| package_service_group_pkey | CREATE UNIQUE INDEX package_service_group_pkey ON public.package_service_group USING btree (id) |

## Relations

![er](public.package_service_group.svg)

---

> Generated by [tbls](https://github.com/k1LoW/tbls)
