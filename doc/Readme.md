# Documentation for BBR Test Data Generation
## General flow and structure
### Introduction
This document describes how extraction of a test data set based on a set of keys. The basis is the fil download from BBR. All test data is based on this fil download file.

### Program flow
The generation of test data is set in three steps:
1. Indexing
2. Processing
3. Generation

#### Indexing
In this part the download fil is scanned sequential. During the scan the keys and the position of the keys are extracted and stored in csv-files. The following keys are used:
+ id_lokalId (file bbr.csv)
+ husnummer (file husnumer.csv)
+ bfeNummer (file bfe.csv)

Each key has its own csv file.
All the indexes are stored in SQLITE DB. Each key has its own database
+ id_lokalId (DB bbr.db - created with createdb.sql)
+ husnummer (DB husnumer.db - created with createhusnummer.sql)
+ bfeNummer (DB bfe.db - created with createbfedb.sql)

| key | file | db | script  |
|---| ---- | -- | ------  |
| id_lokalID | bbr.csv | bbr.db | createdb.sql |
| husnummer | husnummer.csv | husnummer.db | createhusnummer.sql|
| bfeNummer | bfe.csv | bfe.db | createbfedb.sql |

##### Script
indexjson.pl - create the bbr.csv, husnummer.csv and bfe.csv

#### Processing
In this phase the file download is search and extract keys are extracted

##### Script
+ processhusnummer.pl - extract position (input: uuid.csv, output: position.csv)
+ processuuid.pl - extract positions (input: newuuid.csv, output: newposition.csv)
+ processbfe.pl  - extract positions (input: bfenummer.csv, output: position2.csv)

#### Generation
In this phase the output JSON file is created based on the keys and the positions found in the processing phase.
##### Script
+ generate.pl - generated the bbr-vx.x.json based on position (input: position.csv, output: bbr-vx.x.json, newuuid.csv)

### File format
#### Position.csv

| key  | start | end | list |
| ---- | ----- | --- | ----
| uuidd|byte position| byte position | name of list in JSON file |
|006ea6c5-2e39-40d6-a9f1-eeea02d267cd|66277667400|66277667916|GrundList|
