CREATE TABLE "migrations" ("id" integer primary key autoincrement not null, "migration" varchar not null, "batch" integer not null);

CREATE TABLE sqlite_sequence(name,seq);

CREATE TABLE "users" ("id" integer primary key autoincrement not null, "name" varchar not null, "email" varchar not null, "email_verified_at" datetime, "password" varchar not null, "remember_token" varchar, "created_at" datetime, "updated_at" datetime);

CREATE TABLE "password_reset_tokens" ("email" varchar not null, "token" varchar not null, "created_at" datetime, primary key ("email"));

CREATE TABLE "sessions" ("id" varchar not null, "user_id" integer, "ip_address" varchar, "user_agent" text, "payload" text not null, "last_activity" integer not null, primary key ("id"));

CREATE TABLE "cache" ("key" varchar not null, "value" text not null, "expiration" integer not null, primary key ("key"));

CREATE TABLE "cache_locks" ("key" varchar not null, "owner" varchar not null, "expiration" integer not null, primary key ("key"));

CREATE TABLE "queued_jobs" ("id" integer primary key autoincrement not null, "queue" varchar not null, "payload" text not null, "attempts" integer not null, "reserved_at" integer, "available_at" integer not null, "created_at" integer not null);

CREATE TABLE "queued_job_batches" ("id" varchar not null, "name" varchar not null, "total_jobs" integer not null, "pending_jobs" integer not null, "failed_jobs" integer not null, "failed_job_ids" text not null, "options" text, "cancelled_at" integer, "created_at" integer not null, "finished_at" integer, primary key ("id"));

CREATE TABLE "queued_failed_jobs" ("id" integer primary key autoincrement not null, "uuid" varchar not null, "connection" varchar not null, "queue" varchar not null, "payload" text not null, "exception" text not null, "failed_at" datetime not null default CURRENT_TIMESTAMP);

CREATE TABLE "employers" ("id" integer primary key autoincrement not null, "user_id" integer not null, "name" varchar not null, "logo" varchar not null, "created_at" datetime, "updated_at" datetime);

CREATE TABLE "jobs" ("id" integer primary key autoincrement not null, "employer_id" integer not null, "title" varchar not null, "salary" varchar not null, "location" varchar not null, "schedule" varchar not null default 'Full Time', "url" varchar not null, "featured" tinyint(1) not null default '0', "created_at" datetime, "updated_at" datetime);

CREATE TABLE "tags" ("id" integer primary key autoincrement not null, "name" varchar not null, "created_at" datetime, "updated_at" datetime);

CREATE TABLE "job_tag" ("id" integer primary key autoincrement not null, "job_id" integer not null, "tag_id" integer not null, "created_at" datetime, "updated_at" datetime, foreign key("job_id") references "jobs"("id") on delete cascade, foreign key("tag_id") references "tags"("id") on delete cascade);

INSERT INTO "migrations" ("id", "migration", "batch") VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_queued_jobs_table', 1),
(4, '2026_07_02_080330_create_employers_table', 1),
(5, '2026_07_02_082041_create_jobs_table', 1),
(6, '2026_07_02_094743_create_tags_table', 1),
(7, '2026_07_02_095134_create_job_tag_table', 1);
INSERT INTO "sqlite_sequence" ("name", "seq") VALUES
('migrations', '7'),
('users', '1'),
('employers', '1'),
('jobs', '1'),
('tags', '5'),
('job_tag', '5');
INSERT INTO "users" ("id", "name", "email", "email_verified_at", "password", "remember_token", "created_at", "updated_at") VALUES
(1, 'Dovla', 'dovla91mos@gmail.com', NULL, '$2y$12$tRTvyCbL8Is/6EI/fcDrjuExxoTqxGgWs2yED8ujHqubxgi0/t70a', NULL, '2026-07-02 18:28:31', '2026-07-02 18:28:31');

INSERT INTO "sessions" ("id", "user_id", "ip_address", "user_agent", "payload", "last_activity") VALUES
('zyzLsFTn0djKUUjqGa6s9qquqhoTppEIz34GPNDV', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'eyJfdG9rZW4iOiJkOTVqbXdidVIzbXVDejNJT3pla2x3VmJ4MEVWYzc4TW52d0k3aXRlIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cL3BpeGVsLXBvc2l0aW9ucy50ZXN0Iiwicm91dGUiOm51bGx9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX19', 1783017188);





INSERT INTO "employers" ("id", "user_id", "name", "logo", "created_at", "updated_at") VALUES
(1, 1, 'Vlado', 'logos/Uwdh4C3jcgm8R54FXrsqNlwUcAlN2nSfoatUGPsm.png', '2026-07-02 18:28:32', '2026-07-02 18:28:32');
INSERT INTO "jobs" ("id", "employer_id", "title", "salary", "location", "schedule", "url", "featured", "created_at", "updated_at") VALUES
(1, 1, 'Wordpress Developer', '$90,000', 'Croatia', 'Full Time', 'https://vlado-web.ba', '1', '2026-07-02 18:29:06', '2026-07-02 18:29:06');
INSERT INTO "tags" ("id", "name", "created_at", "updated_at") VALUES
(1, 'frontend', '2026-07-02 18:29:06', '2026-07-02 18:29:06'),
(2, 'backend', '2026-07-02 18:29:06', '2026-07-02 18:29:06'),
(3, 'it', '2026-07-02 18:29:06', '2026-07-02 18:29:06'),
(4, 'web development', '2026-07-02 18:29:06', '2026-07-02 18:29:06'),
(5, ' wordpress', '2026-07-02 18:29:06', '2026-07-02 18:29:06');
INSERT INTO "job_tag" ("id", "job_id", "tag_id", "created_at", "updated_at") VALUES
(1, 1, 1, NULL, NULL),
(2, 1, 2, NULL, NULL),
(3, 1, 3, NULL, NULL),
(4, 1, 4, NULL, NULL),
(5, 1, 5, NULL, NULL);
