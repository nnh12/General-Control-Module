ALTER TABLE projections_update_system_currentprojections
ADD column projectionMonth integer;

ALTER TABLE  projections_update_system_currentprojections
ADD column projectionYear integer;

ALTER TABLE data_upload_system_archivehistory
ADD column monthArchived INTEGER;

ALTER TABLE data_upload_system_archivehistory
ADD column yearArchived INTEGER;

ALTER TABLE data_upload_system_archivehistory
ADD column month INTEGER;

CREATE TABLE IF NOT EXISTS "projections_update_system_projectionsarchive" (
	"id"	INTEGER NOT NULL,
	"projection"	NUMERIC,
	"accE_id"	TEXT,
	"org_id"	INTEGER,
	"comments"	TEXT,
	"account"	TEXT,
	"lastUpdatedFiscalMonth"	INTEGER,
	"lastUpdatedYear"	INTEGER,
	"activity"	TEXT,
	"location"	TEXT,
	"program"	TEXT
, projectionMonth integer, projectionYear integer);
