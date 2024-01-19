PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "django_migrations" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "app" varchar(255) NOT NULL, "name" varchar(255) NOT NULL, "applied" datetime NOT NULL);
CREATE TABLE IF NOT EXISTS "auth_group_permissions" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "group_id" integer NOT NULL REFERENCES "auth_group" ("id") DEFERRABLE INITIALLY DEFERRED, "permission_id" integer NOT NULL REFERENCES "auth_permission" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE TABLE IF NOT EXISTS "auth_user_groups" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "user_id" integer NOT NULL REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED, "group_id" integer NOT NULL REFERENCES "auth_group" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE TABLE IF NOT EXISTS "auth_user_user_permissions" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "user_id" integer NOT NULL REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED, "permission_id" integer NOT NULL REFERENCES "auth_permission" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE TABLE IF NOT EXISTS "data_upload_system_organization" ("id" varchar(10) NOT NULL PRIMARY KEY, "name" varchar(100) NOT NULL);
CREATE TABLE IF NOT EXISTS "data_upload_system_record" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "fiscal_year" smallint unsigned NOT NULL CHECK ("fiscal_year" >= 0), "month" smallint unsigned NOT NULL CHECK ("month" >= 0), "fund_type_parent_level_A" varchar(50) NOT NULL, "fund_type_parent_level_B" varchar(50) NOT NULL, "fund_type" varchar(50) NOT NULL, "fund_source_parent_level_C" varchar(50) NOT NULL, "fund_source_parent_level_D" varchar(50) NOT NULL, "fund_source" varchar(50) NOT NULL, "organization_parent_level_B" varchar(50) NOT NULL, "organization_parent_level_C" varchar(50) NOT NULL, "organization_parent_level_D" varchar(50) NOT NULL, "organization_parent_level_E" varchar(50) NOT NULL, "organization" varchar(50) NOT NULL, "account_parent_level_B" varchar(50) NOT NULL, "account_parent_level_C" varchar(50) NOT NULL, "account_parent_level_D" varchar(50) NOT NULL, "account_parent_level_E" varchar(50) NOT NULL, "account" varchar(50) NOT NULL, "budget_amount" real NOT NULL, "actual_YTD_beginning_of_period" real NOT NULL, "period_net" real NOT NULL, "actual_YTD_end_of_period" real NOT NULL, "PO_Req_other_encumbrances" real NOT NULL, "salary_encumbrance" real NOT NULL, "remaining_budget" real NOT NULL, "program" varchar(20) NOT NULL, "activity" varchar(20) NOT NULL, "location" varchar(20) NOT NULL, "upload_id" char(32) NOT NULL);
CREATE TABLE IF NOT EXISTS "accounts_myorganizations_organizations" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "myorganizations_id" integer NOT NULL REFERENCES "accounts_myorganizations" ("id") DEFERRABLE INITIALLY DEFERRED, "organization_id" varchar(10) NOT NULL REFERENCES "data_upload_system_organization" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE TABLE IF NOT EXISTS "accounts_myorganizations" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "user_id" integer NULL UNIQUE REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE TABLE IF NOT EXISTS "django_admin_log" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "action_time" datetime NOT NULL, "object_id" text NULL, "object_repr" varchar(200) NOT NULL, "change_message" text NOT NULL, "content_type_id" integer NULL REFERENCES "django_content_type" ("id") DEFERRABLE INITIALLY DEFERRED, "user_id" integer NOT NULL REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED, "action_flag" smallint unsigned NOT NULL CHECK ("action_flag" >= 0));
CREATE TABLE IF NOT EXISTS "django_content_type" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "app_label" varchar(100) NOT NULL, "model" varchar(100) NOT NULL);
CREATE TABLE IF NOT EXISTS "auth_permission" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "content_type_id" integer NOT NULL REFERENCES "django_content_type" ("id") DEFERRABLE INITIALLY DEFERRED, "codename" varchar(100) NOT NULL, "name" varchar(255) NOT NULL);
CREATE TABLE IF NOT EXISTS "auth_group" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(150) NOT NULL UNIQUE);
CREATE TABLE IF NOT EXISTS "data_upload_system_accountparentlevele" ("id" varchar(10) NOT NULL PRIMARY KEY, "name" varchar(100) NOT NULL, "allowChildProjections" bool NOT NULL);
CREATE TABLE IF NOT EXISTS "django_cas_ng_proxygrantingticket" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "pgtiou" varchar(255) NULL, "pgt" varchar(255) NULL, "date" datetime NOT NULL, "user_id" integer NULL REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED, "session_key" varchar(1024) NULL);
CREATE TABLE IF NOT EXISTS "django_cas_ng_sessionticket" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "session_key" varchar(1024) NOT NULL, "ticket" varchar(1024) NOT NULL);
CREATE TABLE IF NOT EXISTS "projections_update_system_projectionsupdatelog" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "accE_id" varchar(10) NOT NULL REFERENCES "data_upload_system_accountparentlevele" ("id") DEFERRABLE INITIALLY DEFERRED, "org_id" varchar(10) NOT NULL REFERENCES "data_upload_system_organization" ("id") DEFERRABLE INITIALLY DEFERRED, "byUserName" varchar(50) NOT NULL, "fromValue" real NOT NULL, "toValue" real NOT NULL, "timestamp" datetime NOT NULL);
CREATE TABLE IF NOT EXISTS "django_session" ("session_key" varchar(40) NOT NULL PRIMARY KEY, "session_data" text NOT NULL, "expire_date" datetime NOT NULL);
CREATE TABLE IF NOT EXISTS "accounts_authorizednetid" ("netID" varchar(20) NOT NULL PRIMARY KEY);
CREATE TABLE IF NOT EXISTS "projections_update_system_currentprojections" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "projection" real NOT NULL, "accE_id" varchar(10) NOT NULL REFERENCES "data_upload_system_accountparentlevele" ("id") DEFERRABLE INITIALLY DEFERRED, "org_id" varchar(10) NOT NULL REFERENCES "data_upload_system_organization" ("id") DEFERRABLE INITIALLY DEFERRED, "comments" varchar(1500) NULL, "account" varchar(50) NULL, "lastUpdatedFiscalMonth" integer NULL, "lastUpdatedYear" smallint unsigned NULL CHECK ("lastUpdatedYear" >= 0), "activity" varchar(100) NULL, "location" varchar(100) NULL, "program" varchar(100) NULL, projectionMonth integer, projectionYear integer);
CREATE TABLE IF NOT EXISTS "data_upload_system_recordarchive" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "fiscal_year" smallint unsigned NOT NULL CHECK ("fiscal_year" >= 0), "month" smallint unsigned NOT NULL CHECK ("month" >= 0), "upload_id" char(32) NOT NULL, "fund_type_parent_level_A" varchar(50) NOT NULL, "fund_type_parent_level_B" varchar(50) NOT NULL, "fund_type" varchar(50) NOT NULL, "fund_source_parent_level_C" varchar(50) NOT NULL, "fund_source_parent_level_D" varchar(50) NOT NULL, "fund_source" varchar(50) NOT NULL, "organization_parent_level_B" varchar(50) NOT NULL, "organization_parent_level_C" varchar(50) NOT NULL, "organization_parent_level_D" varchar(50) NOT NULL, "organization_parent_level_E" varchar(50) NOT NULL, "organization" varchar(50) NOT NULL, "account_parent_level_B" varchar(50) NOT NULL, "account_parent_level_C" varchar(50) NOT NULL, "account_parent_level_D" varchar(50) NOT NULL, "account_parent_level_E" varchar(50) NOT NULL, "account" varchar(50) NOT NULL, "budget_amount" real NOT NULL, "actual_YTD_beginning_of_period" real NOT NULL, "period_net" real NOT NULL, "actual_YTD_end_of_period" real NOT NULL, "PO_Req_other_encumbrances" real NOT NULL, "salary_encumbrance" real NOT NULL, "remaining_budget" real NOT NULL, "program" varchar(20) NOT NULL, "activity" varchar(20) NOT NULL, "location" varchar(20) NOT NULL);
CREATE TABLE IF NOT EXISTS "data_upload_system_archivehistory" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "fiscalYear" smallint unsigned NOT NULL CHECK ("fiscalYear" >= 0), "byUsername" varchar(50) NOT NULL, "timestamp" datetime NOT NULL, "rows" smallint unsigned NOT NULL CHECK ("rows" >= 0), monthArchived integer, yearArchived integer, month);
CREATE TABLE IF NOT EXISTS "data_upload_system_uploadhistory" ("id" char(32) NOT NULL PRIMARY KEY, "byUsername" varchar(50) NOT NULL, "month" smallint unsigned NOT NULL CHECK ("month" >= 0), "uploadTime" datetime NOT NULL, "rows" smallint unsigned NOT NULL CHECK ("rows" >= 0));
CREATE TABLE IF NOT EXISTS "data_upload_system_uploadhistoryarchive" ("id" char(32) NOT NULL PRIMARY KEY, "byUsername" varchar(50) NOT NULL, "month" smallint unsigned NOT NULL CHECK ("month" >= 0), "uploadTime" datetime NOT NULL, "rows" smallint unsigned NOT NULL CHECK ("rows" >= 0));
CREATE TABLE IF NOT EXISTS "projections_update_system_projectionsupdatelogarchive" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "byUserName" varchar(50) NOT NULL, "fromValue" real NOT NULL, "toValue" real NOT NULL, "timestamp" datetime NOT NULL, "accE_id" varchar(10) NOT NULL REFERENCES "data_upload_system_accountparentlevele" ("id") DEFERRABLE INITIALLY DEFERRED, "org_id" varchar(10) NOT NULL REFERENCES "data_upload_system_organization" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE TABLE IF NOT EXISTS "auth_user" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "password" varchar(128) NOT NULL, "last_login" datetime NULL, "is_superuser" bool NOT NULL, "username" varchar(150) NOT NULL UNIQUE, "last_name" varchar(150) NOT NULL, "email" varchar(254) NOT NULL, "is_staff" bool NOT NULL, "is_active" bool NOT NULL, "date_joined" datetime NOT NULL, "first_name" varchar(150) NOT NULL);
CREATE TABLE IF NOT EXISTS "projections_update_system_addnewaccounttoorg" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT);
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
DELETE FROM sqlite_sequence;
CREATE UNIQUE INDEX "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" ON "auth_group_permissions" ("group_id", "permission_id");
CREATE INDEX "auth_group_permissions_group_id_b120cbf9" ON "auth_group_permissions" ("group_id");
CREATE INDEX "auth_group_permissions_permission_id_84c5c92e" ON "auth_group_permissions" ("permission_id");
CREATE UNIQUE INDEX "auth_user_groups_user_id_group_id_94350c0c_uniq" ON "auth_user_groups" ("user_id", "group_id");
CREATE INDEX "auth_user_groups_user_id_6a12ed8b" ON "auth_user_groups" ("user_id");
CREATE INDEX "auth_user_groups_group_id_97559544" ON "auth_user_groups" ("group_id");
CREATE UNIQUE INDEX "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq" ON "auth_user_user_permissions" ("user_id", "permission_id");
CREATE INDEX "auth_user_user_permissions_user_id_a95ead1b" ON "auth_user_user_permissions" ("user_id");
CREATE INDEX "auth_user_user_permissions_permission_id_1fbb5f2c" ON "auth_user_user_permissions" ("permission_id");
CREATE UNIQUE INDEX "accounts_myorganizations_organizations_myorganizations_id_organization_id_0a02ca37_uniq" ON "accounts_myorganizations_organizations" ("myorganizations_id", "organization_id");
CREATE INDEX "accounts_myorganizations_organizations_myorganizations_id_1e832432" ON "accounts_myorganizations_organizations" ("myorganizations_id");
CREATE INDEX "accounts_myorganizations_organizations_organization_id_ab776e40" ON "accounts_myorganizations_organizations" ("organization_id");
CREATE INDEX "django_admin_log_content_type_id_c4bce8eb" ON "django_admin_log" ("content_type_id");
CREATE INDEX "django_admin_log_user_id_c564eba6" ON "django_admin_log" ("user_id");
CREATE UNIQUE INDEX "django_content_type_app_label_model_76bd3d3b_uniq" ON "django_content_type" ("app_label", "model");
CREATE UNIQUE INDEX "auth_permission_content_type_id_codename_01ab375a_uniq" ON "auth_permission" ("content_type_id", "codename");
CREATE INDEX "auth_permission_content_type_id_2f476e4b" ON "auth_permission" ("content_type_id");
CREATE UNIQUE INDEX "django_cas_ng_proxygrantingticket_session_key_user_id_4cd2ea19_uniq" ON "django_cas_ng_proxygrantingticket" ("session_key", "user_id");
CREATE INDEX "django_cas_ng_proxygrantingticket_user_id_f833edd2" ON "django_cas_ng_proxygrantingticket" ("user_id");
CREATE INDEX "projections_update_system_projectionsupdatelog_accE_id_01e8190f" ON "projections_update_system_projectionsupdatelog" ("accE_id");
CREATE INDEX "projections_update_system_projectionsupdatelog_org_id_62dd9885" ON "projections_update_system_projectionsupdatelog" ("org_id");
CREATE INDEX "django_session_expire_date_a5c62663" ON "django_session" ("expire_date");
CREATE INDEX "projections_update_system_currentprojections_accE_id_423d9a66" ON "projections_update_system_currentprojections" ("accE_id");
CREATE INDEX "projections_update_system_currentprojections_org_id_b86cf1ce" ON "projections_update_system_currentprojections" ("org_id");
CREATE INDEX "projections_update_system_projectionsupdatelogarchive_accE_id_00108476" ON "projections_update_system_projectionsupdatelogarchive" ("accE_id");
CREATE INDEX "projections_update_system_projectionsupdatelogarchive_org_id_bf87149b" ON "projections_update_system_projectionsupdatelogarchive" ("org_id");
COMMIT;
