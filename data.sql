/* Populate database with sample data. */

INSERT INTO "public"."animals"("id","name","date_of_birth","escape_attempts","neutered","weight_kg")
VALUES
(1,E'Agumon',E'2020-02-03',0,TRUE,10.23),
(2,E'Gabumon',E'2018-11-15',2,TRUE,8),
(3,E'Pikachu',E'2021-01-07',1,FALSE,15.04),
(4,E'Devimon',E'2017-05-12',5,TRUE,11);
