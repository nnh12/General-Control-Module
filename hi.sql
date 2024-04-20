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
