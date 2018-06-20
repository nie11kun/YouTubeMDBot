CREATE KEYSPACE IF NOT EXISTS YouTubeMDApp WITH replication = {'class': 'SimpleStrategy', 'replication_factor': 3};
USE YouTubeMDApp;
CREATE TABLE IF NOT EXISTS history (user_id int NOT NULL, file_id varchar NOT NULL);
CREATE TABLE IF NOT EXISTS metadata (title varchar, artist varchar, cover text, duration varchar, music_file_id varchar NOT NULL, PRIMARY KEY (music_file_id));
CREATE TABLE IF NOT EXISTS music (file_id varchar NOT NULL,video_id varchar, audio_quality int, audio_format int, times_requested int, is_metadata_by_user boolean, PRIMARY KEY (file_id));
CREATE TABLE IF NOT EXISTS playlist (playlist_id varchar NOT NULL, number_elements int, times_requested int, PRIMARY KEY (playlist_id));
CREATE TABLE IF NOT EXISTS playlist_has_music (playlist_playlist_id varchar NOT NULL, music_file_id varchar NOT NULL);
CREATE TABLE IF NOT EXISTS preferences (audio_quality varchar, audio_format varchar, os varchar, should_ask_metadata boolean, user_id int NOT NULL, PRIMARY KEY (user_id));
CREATE TABLE IF NOT EXISTS "User" (user_id int NOT NULL, username varchar, name text, PRIMARY KEY (user_id));
CREATE TABLE IF NOT EXISTS Statistics (lang varchar, downloads int, last_time_active datetime, user_id int NOT NULL, PRIMARY KEY(user_id));